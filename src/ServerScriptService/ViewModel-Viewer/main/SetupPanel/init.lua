local CoreGui = game:GetService("CoreGui")

local Viewer		= script.Parent.Parent
local Dependencies 	= Viewer.Dependencies
local Utils			= script.Parent.Parent.Util

local Trove					= require(Dependencies.Trove)
local Signal 				= require(Dependencies.Signal)
local ignoreTypes			= require(Utils.IgnoreTypes)
local Types 				= require(Viewer.Types)
local MainFrame 			= require(script.Main)
local createUiWrapper 		= require(script.Wrapper)
local Widget 				= require(script.Parent.Widget)
local createViewportFrame 	= require(script.createViewportFrame)
local RenderManger 			= require(script.Parent.RenderManger)
local GetCameraPart 		= require(Utils.GetCameraPart)
local Loger					= require(Utils.Loger)

local PLUGIN_NAME = "View Port Viewer"

type _setupPanel = Types._setupPanel
type SetupPanelInstance = Types.SetupPanelInstance


local SetupPanel = {}
SetupPanel.__index = SetupPanel


local function GetScreenGui(name: string)
	local screenGui = CoreGui:FindFirstChild(name) :: ScreenGui
	if screenGui then return screenGui end
	screenGui = Instance.new("ScreenGui") :: ScreenGui
	screenGui.Name = name
	screenGui.Parent = CoreGui
	return screenGui;
end

local function attachViewport(self: Types._setupPanel , model: Model)
	
	local ViewportFrame = createViewportFrame(self , model)
	local Widget = self._widget:get()
	assert(Widget , "")
	ViewportFrame.Parent = Widget
	self._activeViewportInstance = ViewportFrame;
	-- render the model to viewport
	local CameraPart = GetCameraPart(model)
	local Camera = ViewportFrame:FindFirstChildOfClass("Camera")
	
	if not CameraPart then
		Loger(`The Selected Model <{model.Name}> Can't Be Rendered`)
		self:free()
		return
	end
	RenderManger.addModel(model , Camera , ViewportFrame , CameraPart)
end

local function destoryViewportFrame(self: _setupPanel)
	self._activeViewportInstance:Destroy()
	self._activeViewportInstance = ignoreTypes(self._activeViewportInstance)[1]
end

function SetupPanel.create(Plugin: Plugin , ToolBar: PluginToolbar)
	local self = setmetatable({
		_widget = Widget.create(Plugin , {Title = PLUGIN_NAME});
		_trove	= Trove.new();
		OnClose = Signal.new();
		_viewportWidgetEnabled = false
	} , SetupPanel)
	
	return self
end

function SetupPanel.new(...)
	return SetupPanel.create(...)
end

function SetupPanel.setToViewport(self: _setupPanel , ViewModel: Model?)
	self._selected = ViewModel
end

function SetupPanel.removeDockWidget(self: _setupPanel)
	self._widget:setActive(false)
end

function SetupPanel.destroy(self: _setupPanel)
	self._widget:destroy()
	self._trove:Destroy()
end

function SetupPanel.open(self: _setupPanel)
	self._instance = MainFrame(self._trove:Add(GetScreenGui(PLUGIN_NAME))) :: Types.GuiType
	self._guiHanlder = createUiWrapper(self):init():enableDrag()
	
	
	self._guiHanlder.InstanceAttached:Connect(function(...: any) 
		if not self._selected then
			Loger("Can not Attach <nil> to viewport")
			return
		end
		if self._activeViewportInstance then
			self._lastAlert = self._guiHanlder:Alert("You Have Active Viewport Rendering By Clicking Continue You Will Close The Current Viewport" ,function()
				destoryViewportFrame(self)
				RenderManger.cleanup()
				attachViewport(self , self._selected)
				self._guiHanlder:instanceDeselect(self._selected)
			end)
		else
			SetupPanel.openViewportWidget(self)
			attachViewport(self , self._selected)
			self._guiHanlder:instanceDeselect(self._selected)
		end
	end)
	
	self._guiHanlder.TerminateSignal:Connect(function(...: any)
		SetupPanel.closeViewportWidget(self)
	end)
end

function SetupPanel.close(self: _setupPanel)
	self.OnClose:Fire()
	if self._instance  then
		self._instance:Destroy()
	end
	if self._guiHanlder ~= nil then
		self._guiHanlder:cleanup()
	end
	self._guiHanlder = ignoreTypes(self._guiHanlder)[1]
	self._instance = nil
end

function SetupPanel.openViewportWidget(self: _setupPanel)
	self._viewportWidgetEnabled = true
	self._widget:setActive(self._viewportWidgetEnabled)
	
	self._widget:bindToClose(function() 
		SetupPanel.closeViewportWidget(self)
	end)
end

function SetupPanel.closeViewportWidget(self: _setupPanel)
	self._viewportWidgetEnabled = false
	self._widget:setActive(self._viewportWidgetEnabled)
	
	if self._activeViewportInstance then
		destoryViewportFrame(self)
	end
	if typeof(self._lastAlert) == "function" then
		self._lastAlert()
		self._lastAlert = nil
	end
	self._selected = nil
	RenderManger.cleanup()
end

SetupPanel.free = SetupPanel.close

return SetupPanel :: {
	create: (Plugin: Plugin, ToolBar: PluginToolbar) -> SetupPanelInstance;
	new: 	(Plugin: Plugin, ToolBar: PluginToolbar) -> SetupPanelInstance;
}
