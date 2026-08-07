local VRService = game:GetService("VRService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local tenFootInterfaceModule = require(robloxGui.Modules.TenFootInterface)
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local parent = script.Parent
local fFlagPlayerListPersistVisibilityModule = require(parent.Flags.FFlagPlayerListPersistVisibility)
local fStringPlayerListOverrideTypeModule = require(parent.Flags.FStringPlayerListOverrideType)
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local fFlagPlayerListUseMobileOnSmallDisplay = playerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay

local function isSmallTouchScreen() --[[ line: 19 ]]
	-- upvalues: fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), fFlagEnableMobilePlayerListOnConsole (ref), userInputService (ref), utilityModule (ref), fStringPlayerListOverrideTypeModule (ref)
	local var12
	if _G.__TESTEZ_RUNNING_TEST__ then
		return false
	elseif fFlagPlayerListUseMobileOnSmallDisplay then
		var12 = guiService.ViewportDisplaySize == Enum.DisplaySize.Small
		var12 = nil
	else
		var12 = false
	end
	local var13
	if fFlagEnableMobilePlayerListOnConsole then
		var13 = guiService.ViewportDisplaySize == Enum.DisplaySize.Large
		var13 = nil
	else
		var13 = false
	end
	local var14
	if fFlagEnableMobilePlayerListOnConsole or fFlagPlayerListUseMobileOnSmallDisplay then
		var14 = true
		
		if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
			local _ = userInputService.PreferredInput == Enum.PreferredInput.Gamepad
		end
	else
		var14 = false
	end
	return utilityModule:IsSmallTouchScreen() or fFlagEnableMobilePlayerListOnConsole and (var13 and (var14 or fFlagPlayerListUseMobileOnSmallDisplay and (var12 and (var14 or fStringPlayerListOverrideTypeModule == "mobile"))))
end

return function() --[[ line: 32 ]]
	-- upvalues: isSmallTouchScreen (ref), VRService (ref), fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref), fFlagPlayerListPersistVisibilityModule (ref)
	local var15 = not isSmallTouchScreen()
	
	if var15 then
		var15 = not VRService.VREnabled
		
		if var15 then
			if not fFlagEnableMobilePlayerListOnConsole then
				var15 = not tenFootInterfaceModule:IsEnabled()
				
				if var15 then
					if fFlagPlayerListPersistVisibilityModule then
						return UserSettings().GameSettings.PlayerListVisible
					end
					var15 = true
				end
			end
		end
	end
	return var15
end