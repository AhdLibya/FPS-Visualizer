--!strict

local App = require(script.SetupPanel)
local Constants = require(script.Parent.Util.GetConstants)()

local PLUGIN_ID    = Constants.PLUGIN_ID
local PLUGIN_NAME  = Constants.PLUGIN_NAME

local Plugin      = plugin :: Plugin
local toolbar     = Plugin:CreateToolbar(PLUGIN_NAME)
local button      = toolbar:CreateButton(PLUGIN_ID , "Open Setup Panel" , "rbxassetid://15337354002") :: PluginToolbarButton
local setupPanel  = App.create(Plugin , toolbar)

local PluginOpen = false


setupPanel.OnClose:Connect(function(...: any)
	PluginOpen = false
	button:SetActive(PluginOpen)
end)

button.Click:Connect(function()
	PluginOpen = not PluginOpen
	if PluginOpen then
		button:SetActive(PluginOpen)
		setupPanel:open()
	else
		PluginOpen = false
		setupPanel:free()
	end
end)

Plugin.Unloading:Connect(function()
	setupPanel:closeViewportWidget()
	setupPanel:free()
end)