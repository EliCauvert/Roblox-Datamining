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
local fFlagDebugEnablePioneerUX = require(parent.SharedFlags).FFlagDebugEnablePioneerUX
local getActionBindingsStoreModule = require(inExperienceSideSheet.Stores.GetActionBindingsStore)
local t = {
	["rbxasset://textures/ui/Controls/DefaultController/ButtonX@2x.png"] = iconName.XboxX,
	["rbxasset://textures/ui/Controls/DefaultController/ButtonY@2x.png"] = iconName.XboxY,
	["rbxasset://textures/ui/Controls/XboxController/ButtonX@2x.png"] = iconName.XboxX,
	["rbxasset://textures/ui/Controls/XboxController/ButtonY@2x.png"] = iconName.XboxY,
	["rbxasset://textures/ui/Controls/PlayStationController/ButtonSquare@2x.png"] = iconName.PsSquare,
	["rbxasset://textures/ui/Controls/PlayStationController/ButtonTriangle@2x.png"] = iconName.PsTriagle
}

return function()
	-- upvalues: getActionBindingsStoreModule (ref), signalsModule (ref), fFlagDebugEnablePioneerUX (ref), constantsModule (ref), enumsModule (ref), getInputModeStore (ref), input (ref), userInputService (ref), t (ref)
	local sessionActionBindings = getActionBindingsStoreModule().sessionActionBindings
	local var8, var9 = signalsModule.createSignal(nil)
	local var10, var11 = signalsModule.createSignal(nil)
	local list = {
		{
			name = "LeaveButton",
			keyboardIcon = "icons/controls/keys/key_l",
			isEmphasis = true,
			label = if fFlagDebugEnablePioneerUX then constantsModule.LocalizationKeys.LogoutButton else "CoreScripts.InGameMenu.LeaveGame",
			gamepadKeyCode = Enum.KeyCode.ButtonX,
			getShortcutIcon = var8,
			setShortcutIcon = var9,
			getOnActivated = sessionActionBindings[enumsModule.ActionBinding.Leave].getOnActivated,
			getIsEnabled = sessionActionBindings[enumsModule.ActionBinding.Leave].getIsEnabled
		},
		{
			name = "RespawnButton",
			label = "CoreScripts.InGameMenu.QuickActions.Respawn",
			keyboardIcon = "icons/controls/keys/key_r",
			isEmphasis = false,
			gamepadKeyCode = Enum.KeyCode.ButtonY,
			getShortcutIcon = var10,
			setShortcutIcon = var11,
			getOnActivated = sessionActionBindings[enumsModule.ActionBinding.Respawn].getOnActivated,
			getIsEnabled = sessionActionBindings[enumsModule.ActionBinding.Respawn].getIsEnabled
		}
	}
	local var13 = nil
	local var14 = signalsModule.createEffect(function(p0)
		-- upvalues: getInputModeStore (copy), var13 (write), input (copy), list (ref), userInputService (copy), t (copy)
		local lastInputType = getInputModeStore(p0).getLastInputType(p0)
		
		if var13 then
			var13:Disconnect()
		end
		if lastInputType == input.Directional then
			local function setGamepadIcons()
				-- upvalues: list (copy), userInputService (copy), t (copy)
				for i, v in list do
					v.setShortcutIcon(t[userInputService:GetImageForKeyCode(v.gamepadKeyCode)])
				end
			end
			
			var13 = userInputService.GamepadConnected:Connect(function(_)
				-- upvalues: setGamepadIcons (ref)
				setGamepadIcons()
			end)
			setGamepadIcons()
			
			return
		elseif lastInputType == input.Pointer then
			for i, v in list do
				v.setShortcutIcon(v.keyboardIcon)
			end
			return
		else
			for i, v in list do
				v.setShortcutIcon(nil)
			end
		end
	end)
	
	return {
		sessionActionButtonConfigs = list,
		cleanUp = function()
			-- upvalues: var13 (write), var14 (ref)
			if var13 then
				var13:Disconnect()
			end
			if var14 then
				var14()
			end
		end
	}
end