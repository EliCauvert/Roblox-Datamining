local UserInputService = game:GetService("UserInputService")
local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local SignalsModule = require(Parent.Signals)
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local Input = ResponsiveModule.Input
local IconName = require(Parent.Foundation).Enums.IconName
local EnumsModule = require(InExperienceSideSheet.Common.Enums)
local GetActionBindingsStoreModule = require(InExperienceSideSheet.Stores.GetActionBindingsStore)
local config = {
	["rbxasset://textures/ui/Controls/DefaultController/ButtonX@2x.png"] = IconName.XboxX,
	["rbxasset://textures/ui/Controls/DefaultController/ButtonY@2x.png"] = IconName.XboxY,
	["rbxasset://textures/ui/Controls/XboxController/ButtonX@2x.png"] = IconName.XboxX,
	["rbxasset://textures/ui/Controls/XboxController/ButtonY@2x.png"] = IconName.XboxY,
	["rbxasset://textures/ui/Controls/PlayStationController/ButtonSquare@2x.png"] = IconName.PsSquare,
	["rbxasset://textures/ui/Controls/PlayStationController/ButtonTriangle@2x.png"] = IconName.PsTriagle
}

return function()
	-- upvalues: GetActionBindingsStoreModule (copy), SignalsModule (copy), EnumsModule (copy), GetInputModeStoreFunction (copy), Input (copy), UserInputService (copy), config (copy)
	local SessionActionBindings = GetActionBindingsStoreModule().sessionActionBindings
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local SessionActionButtonConfigs = {
		{
			name = "LeaveButton",
			label = "CoreScripts.InGameMenu.LeaveGame",
			keyboardIcon = "icons/controls/keys/key_l",
			isEmphasis = true,
			gamepadKeyCode = Enum.KeyCode.ButtonX,
			getShortcutIcon = Signal,
			setShortcutIcon = Signal2,
			getOnActivated = SessionActionBindings[EnumsModule.ActionBinding.Leave].getOnActivated,
			getIsEnabled = SessionActionBindings[EnumsModule.ActionBinding.Leave].getIsEnabled
		},
		{
			name = "RespawnButton",
			label = "CoreScripts.InGameMenu.QuickActions.Respawn",
			keyboardIcon = "icons/controls/keys/key_r",
			isEmphasis = false,
			gamepadKeyCode = Enum.KeyCode.ButtonY,
			getShortcutIcon = Signal1,
			setShortcutIcon = Signal2_1,
			getOnActivated = SessionActionBindings[EnumsModule.ActionBinding.Respawn].getOnActivated,
			getIsEnabled = SessionActionBindings[EnumsModule.ActionBinding.Respawn].getIsEnabled
		}
	}
	local GamepadConnectedConnection = nil
	local Effect = SignalsModule.createEffect(function(p1)
		-- upvalues: GetInputModeStoreFunction (upval), GamepadConnectedConnection (ref), Input (upval), SessionActionButtonConfigs (copy), UserInputService (upval), config (upval)
		local LastInputType = GetInputModeStoreFunction(p1).getLastInputType(p1)
		
		if GamepadConnectedConnection then
			GamepadConnectedConnection:Disconnect()
		end
		if LastInputType == Input.Directional then
			local function setGamepadIcons()
				-- upvalues: SessionActionButtonConfigs (upval), UserInputService (upval), config (upval)
				for _, sessionActionButtonConfig in SessionActionButtonConfigs do
					sessionActionButtonConfig.setShortcutIcon(config[UserInputService:GetImageForKeyCode(sessionActionButtonConfig.gamepadKeyCode)])
				end
			end
			
			GamepadConnectedConnection = UserInputService.GamepadConnected:Connect(function(_)
				-- upvalues: setGamepadIcons (copy)
				setGamepadIcons()
			end)
			setGamepadIcons()
			
			return
		end
		if LastInputType == Input.Pointer then
			for _, sessionActionButtonConfig in SessionActionButtonConfigs do
				sessionActionButtonConfig.setShortcutIcon(sessionActionButtonConfig.keyboardIcon)
			end
			return
		else
			for _, sessionActionButtonConfig1 in SessionActionButtonConfigs do
				sessionActionButtonConfig1.setShortcutIcon(nil)
			end
		end
	end)
	
	return {
		sessionActionButtonConfigs = SessionActionButtonConfigs,
		cleanUp = function()
			-- upvalues: GamepadConnectedConnection (ref), Effect (copy)
			if GamepadConnectedConnection then
				GamepadConnectedConnection:Disconnect()
			end
			if Effect then
				Effect()
			end
		end
	}
end