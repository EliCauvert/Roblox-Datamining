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
local isReskinConsoleMobileRoute = playerListModule.Common.isReskinConsoleMobileRoute
local fFlagPlayerListUseMobileOnSmallDisplay = playerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local fFlagLuaSupportMicroGamepadPreferredInput = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput

local function _(p1)
	-- upvalues: fFlagLuaSupportMicroGamepadPreferredInput (ref)
	return if p1 ~= Enum.PreferredInput.Touch then if p1 ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and p1 == Enum.PreferredInput.MicroGamepad else true else true
end

local _ = function(p1)
	-- upvalues: isReskinConsoleMobileRoute (ref), guiService (ref)
	return isReskinConsoleMobileRoute({
		displaySize = guiService.ViewportDisplaySize,
		preferredInput = p1
	})
end

local function isSmallTouchScreen(p1)
	-- upvalues: isReskinConsoleMobileRoute (ref), guiService (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), fFlagEnableMobilePlayerListOnConsole (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref), utilityModule (ref), fStringPlayerListOverrideTypeModule (ref)
	local var1
	if isReskinConsoleMobileRoute({
		displaySize = guiService.ViewportDisplaySize,
		preferredInput = p1
	}) then
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
		
		if p1 ~= Enum.PreferredInput.Touch then
			var3 = true
			
			if p1 ~= Enum.PreferredInput.Gamepad then
				var3 = fFlagLuaSupportMicroGamepadPreferredInput
				
				if var3 then
					var3 = p1 == Enum.PreferredInput.MicroGamepad
					var3 = nil
				end
			end
		end
	else
		var3 = false
	end
	return utilityModule:IsSmallTouchScreen() or fFlagEnableMobilePlayerListOnConsole and (var2 and (var3 or fFlagPlayerListUseMobileOnSmallDisplay and (var1 and (var3 or fStringPlayerListOverrideTypeModule == "mobile"))))
end

return function(p1)
	-- upvalues: userInputService (ref), isSmallTouchScreen (ref), VRService (ref), isReskinConsoleMobileRoute (ref), guiService (ref), fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref), fFlagPlayerListPersistVisibilityModule (ref)
	local var1 = if p1 ~= nil then userInputService.PreferredInput else p1
	local var2 = not isSmallTouchScreen(var1)
	
	if var2 then
		var2 = not VRService.VREnabled
		
		if var2 then
			if not isReskinConsoleMobileRoute({
				displaySize = guiService.ViewportDisplaySize,
				preferredInput = var1
			}) and not fFlagEnableMobilePlayerListOnConsole then
				var2 = not tenFootInterfaceModule:IsEnabled()
				
				if var2 then
					if fFlagPlayerListPersistVisibilityModule then
						return UserSettings().GameSettings.PlayerListVisible
					end
					var2 = true
				end
			end
		end
	end
	return var2
end