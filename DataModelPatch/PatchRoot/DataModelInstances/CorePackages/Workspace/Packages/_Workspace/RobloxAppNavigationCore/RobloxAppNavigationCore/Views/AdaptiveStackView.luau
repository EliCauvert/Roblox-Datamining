local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local ReactModule = require(Parent.React)
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent.RobloxAppEnums).UiMode
local TenFootUiStackView = require(Parent.TenFootUiShell).Views.TenFootUiStackView
local _ = require(Parent.Navigation)
local AppStackViewModule = require(script.Parent.AppStackView)
local FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole

return function(p1)
	-- upvalues: UseUiModeInfoFunction (copy), FFlagEnableLeftNavOnConsole (copy), UiMode (copy), ReactModule (copy), TenFootUiStackView (copy), AppStackViewModule (copy)
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	
	return if FFlagEnableLeftNavOnConsole or UseUiModeInfoResult.uiMode ~= UiMode.TenFoot then ReactModule.createElement(AppStackViewModule, p1) else ReactModule.createElement(TenFootUiStackView, p1)
end