local CorePackages = game:GetService("CorePackages")
local FFlagLogKeyboardFocusModeEnteredModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.FFlagLogKeyboardFocusModeEntered)
local UseLogStatusBarTappedFunction = require(CorePackages.Workspace.Packages.UiShellEvents).useLogStatusBarTapped
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseLogInputTypeChangedFunction = require(CorePackages.Workspace.Packages.UiShellEvents).useLogInputTypeChanged
local UseLogKeyboardFocusModeEnteredFunction = require(CorePackages.Workspace.Packages.UiShellEvents).useLogKeyboardFocusModeEntered
local UseLogOrientationChangedFunction = require(CorePackages.Workspace.Packages.UiShellEvents).useLogOrientationChanged

return function(p1)
	-- upvalues: UseLogStatusBarTappedFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), UseLogInputTypeChangedFunction (copy), FFlagLogKeyboardFocusModeEnteredModule (copy), UseLogKeyboardFocusModeEnteredFunction (copy), UseLogOrientationChangedFunction (copy)
	UseLogStatusBarTappedFunction(p1.currentPage)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	UseLogInputTypeChangedFunction(UseRoactServiceResult)
	
	if FFlagLogKeyboardFocusModeEnteredModule then
		UseLogKeyboardFocusModeEnteredFunction()
	end
	UseLogOrientationChangedFunction(UseRoactServiceResult, nil, p1.currentPage)
	
	return nil
end