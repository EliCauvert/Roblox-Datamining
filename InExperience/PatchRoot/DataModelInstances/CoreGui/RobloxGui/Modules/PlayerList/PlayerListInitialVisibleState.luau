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
local fFlagPlayerListReskin = playerListModule.Flags.FFlagPlayerListReskin

local function _()
	-- upvalues: userInputService (ref)
	return if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
end

local _ = function()
	-- upvalues: fFlagPlayerListReskin (ref), fFlagEnableMobilePlayerListOnConsole (ref), guiService (ref), userInputService (ref)
	return fFlagPlayerListReskin and (fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true)))
end

local function isSmallTouchScreen()
	-- upvalues: fFlagPlayerListReskin (ref), fFlagEnableMobilePlayerListOnConsole (ref), guiService (ref), userInputService (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), utilityModule (ref), fStringPlayerListOverrideTypeModule (ref)
	local var1
	if _G.__TESTEZ_RUNNING_TEST__ then
		return false
	elseif fFlagPlayerListReskin and (fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true))) then
		return true
	elseif fFlagPlayerListUseMobileOnSmallDisplay then
		var1 = guiService.ViewportDisplaySize == Enum.DisplaySize.Small
		var1 = nil
	else
		var1 = false
	end
	local var2
	if fFlagEnableMobilePlayerListOnConsole then
		var2 = guiService.ViewportDisplaySize == Enum.DisplaySize.Large
		var2 = nil
	else
		var2 = false
	end
	local var3
	if fFlagEnableMobilePlayerListOnConsole or fFlagPlayerListUseMobileOnSmallDisplay then
		var3 = true
		
		if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
			local _ = userInputService.PreferredInput == Enum.PreferredInput.Gamepad
		end
	else
		var3 = false
	end
	return utilityModule:IsSmallTouchScreen() or fFlagEnableMobilePlayerListOnConsole and (var2 and (var3 or fFlagPlayerListUseMobileOnSmallDisplay and (var1 and (var3 or fStringPlayerListOverrideTypeModule == "mobile"))))
end

return function()
	-- upvalues: isSmallTouchScreen (ref), VRService (ref), fFlagPlayerListReskin (ref), fFlagEnableMobilePlayerListOnConsole (ref), guiService (ref), userInputService (ref), tenFootInterfaceModule (ref), fFlagPlayerListPersistVisibilityModule (ref)
	local var1 = not isSmallTouchScreen()
	
	if var1 then
		var1 = not VRService.VREnabled
		
		if var1 then
			if not (fFlagPlayerListReskin and (fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true)))) and not fFlagEnableMobilePlayerListOnConsole then
				var1 = not tenFootInterfaceModule:IsEnabled()
				
				if var1 then
					if fFlagPlayerListPersistVisibilityModule then
						return UserSettings().GameSettings.PlayerListVisible
					end
					var1 = true
				end
			end
		end
	end
	return var1
end