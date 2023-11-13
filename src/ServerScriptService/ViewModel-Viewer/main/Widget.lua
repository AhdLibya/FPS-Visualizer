local Types = require(script.Parent.Parent.Types)
type Widget = Types.Widget
type widgetInstance = Types.widgetInstance
type WidgetInfo = Types.WidgetInfo

local Widget = {  }
Widget.__index = Widget



local _binding = {} :: {[number]: () -> ()}

local DEFAULT_INFO = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float, -- Widget will be initialized in floating panel
	true, -- Widget will be initially enabled
	true, -- Don't override the previous enabled state
	600,
	600,
	150, -- Minimum width of the floating window (optional)
	150 -- Minimum height of the floating window (optional)
)

function Widget.create(Plugin: Plugin , WidgetInfo: WidgetInfo)
	WidgetInfo.DockInfo = WidgetInfo.DockInfo or DEFAULT_INFO
	return setmetatable({
		Plugin = Plugin;
		Widget = nil;
		NilWidget = {nil};
		Info = WidgetInfo;
	} , Widget)
end

function Widget.new(...)
	return Widget.create(...)
end

function Widget.get(self: Widget)
	return self.Widget
end

function Widget.activate(self: Widget)
	self.Widget = self.Plugin:CreateDockWidgetPluginGui(self.Plugin.Name , self.Info.DockInfo :: DockWidgetPluginGuiInfo)
	self.Widget.Title = self.Info.Title;
end

function Widget.isActive(self: Widget)
	return self.Widget ~= nil
end

function Widget.bindToClose(self: Widget , CallBack: () -> ())
	self.Widget:BindToClose(CallBack)
end

function Widget.setActive(self: Widget , Active: boolean)
	if not Active and not Widget.isActive(self) then return end
	if Active and Widget.isActive(self) then return end
	if Active then
		return Widget.activate(self)
	end
	self.Widget:Destroy()
	self.Widget = self.NilWidget[1]
	print(self.Widget)
end

function Widget.destroy(self: Widget)
	Widget.setActive(self , false)
	table.clear(self)
end


return Widget :: {
	create: (Plugin: Plugin , WidgetInfo: WidgetInfo) -> widgetInstance;
	new: (Plugin: Plugin , DockInfo: DockWidgetPluginGuiInfo?) -> widgetInstance;
}
