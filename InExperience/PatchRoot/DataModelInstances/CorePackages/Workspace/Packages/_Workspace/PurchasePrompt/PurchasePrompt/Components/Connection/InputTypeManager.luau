local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local userInputService = game:GetService("UserInputService")
local roact = require(parent.PurchasePromptDeps).Roact
local mouseIconOverrideService = require(parent.CoreScriptsCommon).MouseIconOverrideService
local setGamepadEnabledModule = require(purchasePrompt.Actions.SetGamepadEnabled)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local connectToStoreModule = require(purchasePrompt.connectToStore)
local externalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local t = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true
}
local inputTypeManager = roact.Component:extend("InputTypeManager")

function inputTypeManager.init(p1)
	-- upvalues: t (ref)
	local setGamepadEnabled = p1.props.setGamepadEnabled
	
	function p0.dispatchOnChange(p2)
		-- upvalues: t (copy), p1 (ref), setGamepadEnabled (ref)
		local var1 = if t[p2] then true else false
		
		if var1 == p1.props.gamepadEnabled then
			return
		end
		setGamepadEnabled(var1)
	end
	
	p1.cursorOverridden = false
end

function inputTypeManager.render(p1)
	-- upvalues: roact (ref), externalEventConnectionModule (ref), userInputService (ref)
	return roact.createElement(externalEventConnectionModule, {
		event = userInputService.LastInputTypeChanged,
		callback = p1.dispatchOnChange
	})
end

function inputTypeManager.didUpdate(p1, p2, _)
	-- upvalues: promptStateModule (ref), mouseIconOverrideService (ref)
	local var1 = p2.promptState == promptStateModule.None and p1.props.promptState ~= promptStateModule.None
	local var2 = p2.promptState ~= promptStateModule.None and p1.props.promptState == promptStateModule.None
	local var3 = if p1.props.gamepadEnabled then Enum.OverrideMouseIconBehavior.ForceHide else Enum.OverrideMouseIconBehavior.ForceShow
	
	if p1.props.promptState ~= promptStateModule.None and p2.gamepadEnabled ~= p1.props.gamepadEnabled then
		if p1.cursorOverridden then
			mouseIconOverrideService.pop("PurchasePromptOverrideKey")
		end
		mouseIconOverrideService.push("PurchasePromptOverrideKey", var3)
		p1.cursorOverridden = true
		
		return
	elseif var1 then
		mouseIconOverrideService.push("PurchasePromptOverrideKey", var3)
		p1.cursorOverridden = true
		
		return
	elseif var2 then
		mouseIconOverrideService.pop("PurchasePromptOverrideKey")
		p1.cursorOverridden = false
	end
end

return connectToStoreModule(function(p1)
	return {
		promptState = p1.promptState,
		gamepadEnabled = p1.gamepadEnabled
	}
end, function(p1)
	-- upvalues: setGamepadEnabledModule (ref)
	return {
		setGamepadEnabled = function(value)
			-- upvalues: p1 (ref), setGamepadEnabledModule (copy)
			p1(setGamepadEnabledModule(value))
		end
	}
end)(inputTypeManager)