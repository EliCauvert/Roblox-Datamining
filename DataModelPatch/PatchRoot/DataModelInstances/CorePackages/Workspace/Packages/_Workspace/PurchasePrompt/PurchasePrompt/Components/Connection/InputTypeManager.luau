local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local UserInputService = game:GetService("UserInputService")
local Roact = require(Parent.PurchasePromptDeps).Roact
local MouseIconOverrideService = require(Parent.CoreScriptsCommon).MouseIconOverrideService
local SetGamepadEnabledModule = require(PurchasePrompt.Actions.SetGamepadEnabled)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local ConnectToStoreModule = require(PurchasePrompt.connectToStore)
local ExternalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local config = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true
}
local InputTypeManager = Roact.Component:extend("InputTypeManager")

function InputTypeManager.init(p1)
	-- upvalues: config (copy)
	local SetGamepadEnabledFunction = p1.props.setGamepadEnabled
	
	function p1.dispatchOnChange(p2)
		-- upvalues: config (upval), p1 (copy), SetGamepadEnabledFunction (copy)
		local GamepadEnabled: boolean = if config[p2] then true else false
		
		if GamepadEnabled ~= p1.props.gamepadEnabled then
			SetGamepadEnabledFunction(GamepadEnabled)
			
			return
		end
	end
	
	p1.cursorOverridden = false
end

function InputTypeManager.render(p1)
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), UserInputService (copy)
	return Roact.createElement(ExternalEventConnectionModule, {
		event = UserInputService.LastInputTypeChanged,
		callback = p1.dispatchOnChange
	})
end

function InputTypeManager.didUpdate(p1, p2, _)
	-- upvalues: PromptStateModule (copy), MouseIconOverrideService (copy)
	local IsNotPromptStateMatch: boolean = p2.promptState == PromptStateModule.None and p1.props.promptState ~= PromptStateModule.None
	local IsPromptStateMatch: boolean = p2.promptState ~= PromptStateModule.None and p1.props.promptState == PromptStateModule.None
	local ForceHide = p1.props.gamepadEnabled and Enum.OverrideMouseIconBehavior.ForceHide or Enum.OverrideMouseIconBehavior.ForceShow
	
	if p1.props.promptState ~= PromptStateModule.None and p2.gamepadEnabled ~= p1.props.gamepadEnabled then
		if p1.cursorOverridden then
			MouseIconOverrideService.pop("PurchasePromptOverrideKey")
		end
		MouseIconOverrideService.push("PurchasePromptOverrideKey", ForceHide)
		p1.cursorOverridden = true
		
		return
	elseif IsNotPromptStateMatch then
		MouseIconOverrideService.push("PurchasePromptOverrideKey", ForceHide)
		p1.cursorOverridden = true
		
		return
	else
		if IsPromptStateMatch then
			MouseIconOverrideService.pop("PurchasePromptOverrideKey")
			p1.cursorOverridden = false
		end
	end
end

return (ConnectToStoreModule(function(p1)
	return {
		promptState = p1.promptState,
		gamepadEnabled = p1.gamepadEnabled
	}
end, function(Callback)
	-- upvalues: SetGamepadEnabledModule (copy)
	return {
		setGamepadEnabled = function(p1)
			-- upvalues: Callback (copy), SetGamepadEnabledModule (upval)
			Callback(SetGamepadEnabledModule(p1))
		end
	}
end)(InputTypeManager))