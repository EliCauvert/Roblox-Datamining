local VRService = game:GetService("VRService")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local TenFootInterfaceModule = require(RobloxGui.Modules.TenFootInterface)
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local Parent = script.Parent
local FFlagPlayerListPersistVisibilityModule = require(Parent.Flags.FFlagPlayerListPersistVisibility)
local FStringPlayerListOverrideTypeModule = require(Parent.Flags.FStringPlayerListOverrideType)
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local IsReskinConsoleMobileRouteFunction = PlayerListModule.Common.isReskinConsoleMobileRoute
local FFlagPlayerListUseMobileOnSmallDisplay = PlayerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local FFlagLuaSupportMicroGamepadPreferredInput = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput

local function _(PreferredInput): boolean --[[ Line: 22 | Named "isTouchOrGamepad" ]]
	-- upvalues: FFlagLuaSupportMicroGamepadPreferredInput (copy)
	return PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)
end

local _ = function(PreferredInput) --[[ Line: 34 | Named "isCurrentReskinConsoleMobileRoute" ]]
	-- upvalues: IsReskinConsoleMobileRouteFunction (copy), GuiService (copy)
	return IsReskinConsoleMobileRouteFunction({
		displaySize = GuiService.ViewportDisplaySize,
		preferredInput = PreferredInput
	})
end

local function isSmallTouchScreen(PreferredInput) --[[ Line: 41 ]]
	-- upvalues: IsReskinConsoleMobileRouteFunction (copy), GuiService (copy), FFlagPlayerListUseMobileOnSmallDisplay (copy), FFlagEnableMobilePlayerListOnConsole (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), UtilityModule (copy), FStringPlayerListOverrideTypeModule (copy)
	if IsReskinConsoleMobileRouteFunction({
		displaySize = GuiService.ViewportDisplaySize,
		preferredInput = PreferredInput
	}) then
		return true
	else
		local IsViewportDisplaySizeMatch: boolean = if FFlagPlayerListUseMobileOnSmallDisplay then GuiService.ViewportDisplaySize == Enum.DisplaySize.Small else false
		local IsViewportDisplaySizeMatch1: boolean = if FFlagEnableMobilePlayerListOnConsole then GuiService.ViewportDisplaySize == Enum.DisplaySize.Large else false
		local IsPreferredInputMatch: boolean = if FFlagEnableMobilePlayerListOnConsole or FFlagPlayerListUseMobileOnSmallDisplay then PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad) else false
		
		return UtilityModule:IsSmallTouchScreen() or (FFlagEnableMobilePlayerListOnConsole and IsViewportDisplaySizeMatch1 and IsPreferredInputMatch or (FFlagPlayerListUseMobileOnSmallDisplay and IsViewportDisplaySizeMatch and IsPreferredInputMatch or FStringPlayerListOverrideTypeModule == "mobile"))
	end
end

return function(p1) --[[ Line: 61 ]]
	-- upvalues: UserInputService (copy), isSmallTouchScreen (copy), VRService (copy), IsReskinConsoleMobileRouteFunction (copy), GuiService (copy), FFlagEnableMobilePlayerListOnConsole (copy), TenFootInterfaceModule (copy), FFlagPlayerListPersistVisibilityModule (copy)
	local PreferredInput = if p1 == nil then UserInputService.PreferredInput else p1
	local Inverted = not isSmallTouchScreen(PreferredInput)
	
	if Inverted then
		Inverted = not VRService.VREnabled
		
		if Inverted then
			local IsReskinConsoleMobileRoute = IsReskinConsoleMobileRouteFunction({
				displaySize = GuiService.ViewportDisplaySize,
				preferredInput = PreferredInput
			}) or FFlagEnableMobilePlayerListOnConsole
			
			if not IsReskinConsoleMobileRoute then
				Inverted = not TenFootInterfaceModule:IsEnabled()
				IsReskinConsoleMobileRoute = Inverted
			end
			if IsReskinConsoleMobileRoute then
				if FFlagPlayerListPersistVisibilityModule then
					return UserSettings().GameSettings.PlayerListVisible
				end
				Inverted = true
			end
		end
	end
	return Inverted
end