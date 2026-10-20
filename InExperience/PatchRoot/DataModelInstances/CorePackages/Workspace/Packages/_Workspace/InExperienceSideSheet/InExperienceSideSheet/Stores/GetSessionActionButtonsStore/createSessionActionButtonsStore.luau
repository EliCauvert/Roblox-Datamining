local UserInputService = game:GetService("UserInputService")
local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local SignalsModule = require(Parent.Signals)
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local Input = ResponsiveModule.Input
local IconName = require(Parent.Foundation).Enums.IconName
local EnumsModule = require(InExperienceSideSheet.Common.Enums)
local ConstantsModule = require(InExperienceSideSheet.Common.Constants)
local _ = require(InExperienceSideSheet.Common.Types)
local IsPioneerLaunchFunction = require(Parent.PioneerUtils).isPioneerLaunch
local GetSwitchServerStoreFunction = require(Parent.SwitchServer).GetSwitchServerStore
local GetActionBindingsStoreModule = require(InExperienceSideSheet.Stores.GetActionBindingsStore)
local ButtonWidth = EnumsModule.ButtonWidth
local config = {
	["rbxasset://textures/ui/Controls/DefaultController/ButtonX@2x.png"] = IconName.XboxX,
	["rbxasset://textures/ui/Controls/DefaultController/ButtonY@2x.png"] = IconName.XboxY,
	["rbxasset://textures/ui/Controls/XboxController/ButtonX@2x.png"] = IconName.XboxX,
	["rbxasset://textures/ui/Controls/XboxController/ButtonY@2x.png"] = IconName.XboxY,
	["rbxasset://textures/ui/Controls/PlayStationController/ButtonSquare@2x.png"] = IconName.PsSquare,
	["rbxasset://textures/ui/Controls/PlayStationController/ButtonTriangle@2x.png"] = IconName.PsTriagle
}

local function getIsSwitchServerButtonHidden(p1): boolean
	-- upvalues: GetSwitchServerStoreFunction (copy)
	return not GetSwitchServerStoreFunction(p1).shouldEnableSwitchServer(p1)
end

local function createRespawnButtonConfig(SessionActionBindings, GetShortcutIcon, SetShortcutIcon)
	-- upvalues: IconName (copy), EnumsModule (copy), ButtonWidth (copy)
	return {
		name = "RespawnButton",
		label = "CoreScripts.InGameMenu.QuickActions.Respawn",
		keyboardIcon = IconName.SquareTextR,
		gamepadKeyCode = Enum.KeyCode.ButtonY,
		getShortcutIcon = GetShortcutIcon,
		setShortcutIcon = SetShortcutIcon,
		getOnActivated = SessionActionBindings[EnumsModule.ActionBinding.Respawn].getOnActivated,
		getIsEnabled = SessionActionBindings[EnumsModule.ActionBinding.Respawn].getIsEnabled,
		width = ButtonWidth.Full
	}
end

local function createLeaveButtonConfig(SessionActionBindings, GetShortcutIcon, SetShortcutIcon, p1)
	-- upvalues: ConstantsModule (copy), IconName (copy), EnumsModule (copy), ButtonWidth (copy)
	return {
		name = "LeaveButton",
		label = if p1 then ConstantsModule.LocalizationKeys.QuitButton else "CoreScripts.InGameMenu.LeaveGame",
		keyboardIcon = IconName.SquareTextL,
		gamepadKeyCode = Enum.KeyCode.ButtonX,
		getShortcutIcon = GetShortcutIcon,
		setShortcutIcon = SetShortcutIcon,
		getOnActivated = SessionActionBindings[EnumsModule.ActionBinding.Leave].getOnActivated,
		getIsEnabled = SessionActionBindings[EnumsModule.ActionBinding.Leave].getIsEnabled,
		width = if p1 then ButtonWidth.Half else ButtonWidth.Full
	}
end

local function _(p1)
	-- upvalues: ConstantsModule (copy), EnumsModule (copy), getIsSwitchServerButtonHidden (copy), ButtonWidth (copy)
	return {
		label = "CoreScripts.InGameMenu.PeoplePage.SwitchServer",
		name = ConstantsModule.SessionActionButtonNames.SwitchServer,
		getOnActivated = p1[EnumsModule.ActionBinding.SwitchServer].getOnActivated,
		getIsEnabled = p1[EnumsModule.ActionBinding.SwitchServer].getIsEnabled,
		getIsHidden = getIsSwitchServerButtonHidden,
		width = ButtonWidth.Half
	}
end

return function()
	-- upvalues: GetActionBindingsStoreModule (copy), IsPioneerLaunchFunction (copy), SignalsModule (copy), createRespawnButtonConfig (copy), ConstantsModule (copy), EnumsModule (copy), getIsSwitchServerButtonHidden (copy), ButtonWidth (copy), createLeaveButtonConfig (copy), GetInputModeStoreFunction (copy), Input (copy), UserInputService (copy), config (copy)
	local SessionActionBindings = GetActionBindingsStoreModule().sessionActionBindings
	local IsPioneerLaunch = IsPioneerLaunchFunction()
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local List = {
		(createRespawnButtonConfig(SessionActionBindings, Signal1, Signal2_1))
	}
	
	if IsPioneerLaunch then
		table.insert(List, {
			label = "CoreScripts.InGameMenu.PeoplePage.SwitchServer",
			name = ConstantsModule.SessionActionButtonNames.SwitchServer,
			getOnActivated = SessionActionBindings[EnumsModule.ActionBinding.SwitchServer].getOnActivated,
			getIsEnabled = SessionActionBindings[EnumsModule.ActionBinding.SwitchServer].getIsEnabled,
			getIsHidden = getIsSwitchServerButtonHidden,
			width = ButtonWidth.Half
		})
	end
	table.insert(List, (createLeaveButtonConfig(SessionActionBindings, Signal, Signal2, IsPioneerLaunch)))
	local GamepadConnectedConnection = nil
	local Effect = SignalsModule.createEffect(function(p1)
		-- upvalues: GetInputModeStoreFunction (upval), GamepadConnectedConnection (ref), Input (upval), List (copy), UserInputService (upval), config (upval)
		local LastInputType = GetInputModeStoreFunction(p1).getLastInputType(p1)
		
		if GamepadConnectedConnection then
			GamepadConnectedConnection:Disconnect()
		end
		if LastInputType == Input.Directional then
			local function setGamepadIcons()
				-- upvalues: List (upval), UserInputService (upval), config (upval)
				for _, RespawnButtonConfig in List do
					if RespawnButtonConfig.setShortcutIcon and RespawnButtonConfig.gamepadKeyCode then
						RespawnButtonConfig.setShortcutIcon(config[UserInputService:GetImageForKeyCode(RespawnButtonConfig.gamepadKeyCode)])
					end
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
			for _, RespawnButtonConfig in List do
				if RespawnButtonConfig.keyboardIcon and RespawnButtonConfig.setShortcutIcon then
					RespawnButtonConfig.setShortcutIcon(RespawnButtonConfig.keyboardIcon)
				end
			end
			return
		else
			for _, value in List do
				if value.setShortcutIcon then
					value.setShortcutIcon(nil)
				end
			end
		end
	end)
	
	return {
		sessionActionButtonConfigs = List,
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