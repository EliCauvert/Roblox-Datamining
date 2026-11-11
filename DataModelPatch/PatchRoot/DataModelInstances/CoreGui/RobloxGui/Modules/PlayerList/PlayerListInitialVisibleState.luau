local VRService = game:GetService("VRService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local TenFootInterfaceModule = require(RobloxGui.Modules.TenFootInterface)
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local PlayerListModule = require(game:GetService("CorePackages").Workspace.Packages.PlayerList)
local Parent = script.Parent
local FFlagPlayerListPersistVisibilityModule = require(Parent.Flags.FFlagPlayerListPersistVisibility)
local FStringPlayerListOverrideTypeModule = require(Parent.Flags.FStringPlayerListOverrideType)
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local FFlagPlayerListUseMobileOnSmallDisplay = PlayerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay

local function isSmallTouchScreen()
	-- upvalues: FFlagPlayerListUseMobileOnSmallDisplay (copy), GuiService (copy), FFlagEnableMobilePlayerListOnConsole (copy), UserInputService (copy), UtilityModule (copy), FStringPlayerListOverrideTypeModule (copy)
	if _G.__TESTEZ_RUNNING_TEST__ then
		return false
	else
		local IsViewportDisplaySizeMatch: boolean = if FFlagPlayerListUseMobileOnSmallDisplay then GuiService.ViewportDisplaySize == Enum.DisplaySize.Small else false
		local IsViewportDisplaySizeMatch1: boolean = if FFlagEnableMobilePlayerListOnConsole then GuiService.ViewportDisplaySize == Enum.DisplaySize.Large else false
		local IsPreferredInputMatch: boolean = if FFlagEnableMobilePlayerListOnConsole or FFlagPlayerListUseMobileOnSmallDisplay then UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad else false
		
		return UtilityModule:IsSmallTouchScreen() or (FFlagEnableMobilePlayerListOnConsole and IsViewportDisplaySizeMatch1 and IsPreferredInputMatch or (FFlagPlayerListUseMobileOnSmallDisplay and IsViewportDisplaySizeMatch and IsPreferredInputMatch or FStringPlayerListOverrideTypeModule == "mobile"))
	end
end

return function()
	-- upvalues: isSmallTouchScreen (copy), VRService (copy), FFlagEnableMobilePlayerListOnConsole (copy), TenFootInterfaceModule (copy), FFlagPlayerListPersistVisibilityModule (copy)
	local Inverted = not isSmallTouchScreen()
	
	if Inverted then
		Inverted = not VRService.VREnabled
		
		if Inverted then
			local FFlagEnableMobilePlayerListOnConsole1: boolean = FFlagEnableMobilePlayerListOnConsole
			
			if not FFlagEnableMobilePlayerListOnConsole1 then
				Inverted = not TenFootInterfaceModule:IsEnabled()
				FFlagEnableMobilePlayerListOnConsole1 = Inverted
			end
			if FFlagEnableMobilePlayerListOnConsole1 then
				if FFlagPlayerListPersistVisibilityModule then
					return UserSettings().GameSettings.PlayerListVisible
				end
				Inverted = true
			end
		end
	end
	return Inverted
end