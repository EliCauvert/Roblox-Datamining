local userInputService = game:GetService("UserInputService")
local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local signalsModule = require(parent.Signals)
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore
local input = responsiveModule.Input
local iconName = require(parent.Foundation).Enums.IconName
local enumsModule = require(inExperienceSideSheet.Common.Enums)
local constantsModule = require(inExperienceSideSheet.Common.Constants)
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
local getSwitchServerStore = require(parent.SwitchServer).GetSwitchServerStore
local getActionBindingsStoreModule = require(inExperienceSideSheet.Stores.GetActionBindingsStore)
local fFlagShowSwitchServerButton = require(parent.SharedFlags).FFlagShowSwitchServerButton
local t = {
	["rbxasset://textures/ui/Controls/DefaultController/ButtonX@2x.png"] = iconName.XboxX,
	["rbxasset://textures/ui/Controls/DefaultController/ButtonY@2x.png"] = iconName.XboxY,
	["rbxasset://textures/ui/Controls/XboxController/ButtonX@2x.png"] = iconName.XboxX,
	["rbxasset://textures/ui/Controls/XboxController/ButtonY@2x.png"] = iconName.XboxY,
	["rbxasset://textures/ui/Controls/PlayStationController/ButtonSquare@2x.png"] = iconName.PsSquare,
	["rbxasset://textures/ui/Controls/PlayStationController/ButtonTriangle@2x.png"] = iconName.PsTriagle
}

local function getIsSwitchServerButtonHidden(p1)
	-- upvalues: getSwitchServerStore (ref)
	return not getSwitchServerStore(p1).shouldEnableSwitchServer(p1)
end

return function()
	-- upvalues: getActionBindingsStoreModule (ref), signalsModule (ref), isPioneerLaunch (ref), constantsModule (ref), enumsModule (ref), fFlagShowSwitchServerButton (ref), getIsSwitchServerButtonHidden (ref), getInputModeStore (ref), input (ref), userInputService (ref), t (ref)
	local sessionActionBindings = getActionBindingsStoreModule().sessionActionBindings
	local var1, var2 = signalsModule.createSignal(nil)
	local var3, var4 = signalsModule.createSignal(nil)
	local list = {
		{
			name = "LeaveButton",
			keyboardIcon = "icons/controls/keys/key_l",
			isEmphasis = true,
			label = if isPioneerLaunch() then constantsModule.LocalizationKeys.LogoutButton else "CoreScripts.InGameMenu.LeaveGame",
			gamepadKeyCode = Enum.KeyCode.ButtonX,
			getShortcutIcon = var1,
			setShortcutIcon = var2,
			getOnActivated = sessionActionBindings[enumsModule.ActionBinding.Leave].getOnActivated,
			getIsEnabled = sessionActionBindings[enumsModule.ActionBinding.Leave].getIsEnabled
		},
		{
			name = "RespawnButton",
			label = "CoreScripts.InGameMenu.QuickActions.Respawn",
			keyboardIcon = "icons/controls/keys/key_r",
			isEmphasis = false,
			gamepadKeyCode = Enum.KeyCode.ButtonY,
			getShortcutIcon = var3,
			setShortcutIcon = var4,
			getOnActivated = sessionActionBindings[enumsModule.ActionBinding.Respawn].getOnActivated,
			getIsEnabled = sessionActionBindings[enumsModule.ActionBinding.Respawn].getIsEnabled
		}
	}
	
	if fFlagShowSwitchServerButton and isPioneerLaunch() then
		table.insert(list, {
			label = "CoreScripts.InGameMenu.PeoplePage.SwitchServer",
			keyboardIcon = nil,
			gamepadKeyCode = nil,
			getShortcutIcon = nil,
			setShortcutIcon = nil,
			isEmphasis = false,
			name = constantsModule.SessionActionButtonNames.SwitchServer,
			getOnActivated = sessionActionBindings[enumsModule.ActionBinding.SwitchServer].getOnActivated,
			getIsEnabled = sessionActionBindings[enumsModule.ActionBinding.SwitchServer].getIsEnabled,
			getIsHidden = getIsSwitchServerButtonHidden
		})
	end
	local var5 = nil
	local var6 = signalsModule.createEffect(function(p1)
		-- upvalues: getInputModeStore (copy), var5 (write), input (copy), list (ref), fFlagShowSwitchServerButton (copy), userInputService (copy), t (copy)
		local lastInputType = getInputModeStore(p1).getLastInputType(p1)
		
		if var5 then
			var5:Disconnect()
		end
		if lastInputType == input.Directional then
			local function setGamepadIcons()
				-- upvalues: list (copy), fFlagShowSwitchServerButton (copy), userInputService (copy), t (copy)
				for i, v in list do
					if not fFlagShowSwitchServerButton or v.gamepadKeyCode ~= nil and v.setShortcutIcon ~= nil then
						v.setShortcutIcon(t[userInputService:GetImageForKeyCode(v.gamepadKeyCode)])
					end
				end
			end
			
			var5 = userInputService.GamepadConnected:Connect(function(_)
				-- upvalues: setGamepadIcons (ref)
				setGamepadIcons()
			end)
			setGamepadIcons()
			
			return
		elseif lastInputType == input.Pointer then
			for i, v in list do
				if not fFlagShowSwitchServerButton or v.setShortcutIcon ~= nil then
					v.setShortcutIcon(v.keyboardIcon)
				end
			end
			return
		else
			for i, v in list do
				if not fFlagShowSwitchServerButton or v.setShortcutIcon ~= nil then
					v.setShortcutIcon(nil)
				end
			end
		end
	end)
	
	return {
		sessionActionButtonConfigs = list,
		cleanUp = function()
			-- upvalues: var5 (write), var6 (ref)
			if var5 then
				var5:Disconnect()
			end
			if var6 then
				var6()
			end
		end
	}
end