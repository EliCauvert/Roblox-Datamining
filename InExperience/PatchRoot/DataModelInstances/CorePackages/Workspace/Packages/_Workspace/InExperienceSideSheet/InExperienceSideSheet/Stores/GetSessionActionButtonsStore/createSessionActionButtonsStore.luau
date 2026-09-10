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
local _ = require(inExperienceSideSheet.Common.Types)
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
local getSwitchServerStore = require(parent.SwitchServer).GetSwitchServerStore
local getActionBindingsStoreModule = require(inExperienceSideSheet.Stores.GetActionBindingsStore)
local fFlagShowSwitchServerButton = require(parent.SharedFlags).FFlagShowSwitchServerButton
local buttonWidth = enumsModule.ButtonWidth
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

local function createRespawnButtonConfig(p1, p2, p3)
	-- upvalues: iconName (ref), enumsModule (ref), buttonWidth (ref)
	return {
		name = "RespawnButton",
		label = "CoreScripts.InGameMenu.QuickActions.Respawn",
		keyboardIcon = iconName.SquareTextR,
		gamepadKeyCode = Enum.KeyCode.ButtonY,
		getShortcutIcon = p2,
		setShortcutIcon = p3,
		getOnActivated = p1[enumsModule.ActionBinding.Respawn].getOnActivated,
		getIsEnabled = p1[enumsModule.ActionBinding.Respawn].getIsEnabled,
		width = buttonWidth.Full
	}
end

local function createLeaveButtonConfig(p1, p2, p3, p4)
	-- upvalues: constantsModule (ref), iconName (ref), enumsModule (ref), buttonWidth (ref)
	return {
		name = "LeaveButton",
		label = if p4 then constantsModule.LocalizationKeys.QuitButton else "CoreScripts.InGameMenu.LeaveGame",
		keyboardIcon = iconName.SquareTextL,
		gamepadKeyCode = Enum.KeyCode.ButtonX,
		getShortcutIcon = p2,
		setShortcutIcon = p3,
		getOnActivated = p1[enumsModule.ActionBinding.Leave].getOnActivated,
		getIsEnabled = p1[enumsModule.ActionBinding.Leave].getIsEnabled,
		width = if p4 then buttonWidth.Half else buttonWidth.Full
	}
end

local function _(p1)
	-- upvalues: constantsModule (ref), enumsModule (ref), getIsSwitchServerButtonHidden (ref), buttonWidth (ref)
	return {
		label = "CoreScripts.InGameMenu.PeoplePage.SwitchServer",
		name = constantsModule.SessionActionButtonNames.SwitchServer,
		getOnActivated = p1[enumsModule.ActionBinding.SwitchServer].getOnActivated,
		getIsEnabled = p1[enumsModule.ActionBinding.SwitchServer].getIsEnabled,
		getIsHidden = getIsSwitchServerButtonHidden,
		width = buttonWidth.Half
	}
end

return function()
	-- upvalues: getActionBindingsStoreModule (ref), isPioneerLaunch (ref), signalsModule (ref), createRespawnButtonConfig (ref), fFlagShowSwitchServerButton (ref), constantsModule (ref), enumsModule (ref), getIsSwitchServerButtonHidden (ref), buttonWidth (ref), createLeaveButtonConfig (ref), getInputModeStore (ref), input (ref), userInputService (ref), t (ref)
	local sessionActionBindings = getActionBindingsStoreModule().sessionActionBindings
	local var1 = isPioneerLaunch()
	local var2, var3 = signalsModule.createSignal(nil)
	local var4, var5 = signalsModule.createSignal(nil)
	local list = {
		createRespawnButtonConfig(sessionActionBindings, var4, var5)
	}
	
	if var1 and fFlagShowSwitchServerButton then
		table.insert(list, {
			label = "CoreScripts.InGameMenu.PeoplePage.SwitchServer",
			name = constantsModule.SessionActionButtonNames.SwitchServer,
			getOnActivated = sessionActionBindings[enumsModule.ActionBinding.SwitchServer].getOnActivated,
			getIsEnabled = sessionActionBindings[enumsModule.ActionBinding.SwitchServer].getIsEnabled,
			getIsHidden = getIsSwitchServerButtonHidden,
			width = buttonWidth.Half
		})
	end
	table.insert(list, createLeaveButtonConfig(sessionActionBindings, var2, var3, var1))
	local var6 = nil
	local var7 = signalsModule.createEffect(function(p1)
		-- upvalues: getInputModeStore (copy), var6 (write), input (copy), list (ref), userInputService (copy), t (copy)
		local lastInputType = getInputModeStore(p1).getLastInputType(p1)
		
		if var6 then
			var6:Disconnect()
		end
		if lastInputType == input.Directional then
			local function setGamepadIcons()
				-- upvalues: list (copy), userInputService (copy), t (copy)
				for i, v in list do
					if v.setShortcutIcon and v.gamepadKeyCode then
						v.setShortcutIcon(t[userInputService:GetImageForKeyCode(v.gamepadKeyCode)])
					end
				end
			end
			
			var6 = userInputService.GamepadConnected:Connect(function(_)
				-- upvalues: setGamepadIcons (ref)
				setGamepadIcons()
			end)
			setGamepadIcons()
			
			return
		elseif lastInputType == input.Pointer then
			for i, v in list do
				if v.keyboardIcon and v.setShortcutIcon then
					v.setShortcutIcon(v.keyboardIcon)
				end
			end
			return
		else
			for i, v in list do
				if v.setShortcutIcon then
					v.setShortcutIcon(nil)
				end
			end
		end
	end)
	
	return {
		sessionActionButtonConfigs = list,
		cleanUp = function()
			-- upvalues: var6 (write), var7 (ref)
			if var6 then
				var6:Disconnect()
			end
			if var7 then
				var7()
			end
		end
	}
end