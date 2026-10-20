local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SearchPageModule = require(Modules.LuaApp.Components.Search.SearchPage)
local TenFootUiSearchModule = require(Modules.LuaApp.Components.Search.TenFootUi.TenFootUiSearch)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

return function(p1)
	-- upvalues: UseUiModeInfoFunction (copy), UiMode (copy), ReactModule (copy), FFlagEnableLeftNavOnConsole (copy), TenFootUiSearchModule (copy), SearchPageModule (copy)
	return ReactModule.createElement(if UseUiModeInfoFunction().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole then TenFootUiSearchModule else SearchPageModule, p1)
end