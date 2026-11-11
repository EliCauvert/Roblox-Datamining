local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local ReactModule = require(Parent.React)
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent.RobloxAppEnums).UiMode
local TenFootUiSwitchView = require(Parent.TenFootUiShell).Views.TenFootUiSwitchView
local _ = require(Parent.Navigation)
local AppSwitchViewModule = require(script.Parent.AppSwitchView)
local FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole

return function(p1)
	-- upvalues: UseUiModeInfoFunction (copy), FFlagEnableLeftNavOnConsole (copy), UiMode (copy), ReactModule (copy), TenFootUiSwitchView (copy), AppSwitchViewModule (copy)
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	
	return if FFlagEnableLeftNavOnConsole or UseUiModeInfoResult.uiMode ~= UiMode.TenFoot then ReactModule.createElement(AppSwitchViewModule, p1) else ReactModule.createElement(TenFootUiSwitchView, p1)
end