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

function inputTypeManager.init(p0)
	-- upvalues: t (ref)
	local setGamepadEnabled = p0.props.setGamepadEnabled
	
	function p0.dispatchOnChange(p1)
		-- upvalues: t (copy), p0 (ref), setGamepadEnabled (ref)
		local var8 = if t[p1] then true else false
		
		if var8 == p0.props.gamepadEnabled then
			return
		end
		setGamepadEnabled(var8)
	end
	
	p0.cursorOverridden = false
end

function inputTypeManager.render(p2)
	-- upvalues: roact (ref), externalEventConnectionModule (ref), userInputService (ref)
	return roact.createElement(externalEventConnectionModule, {
		event = userInputService.LastInputTypeChanged,
		callback = p2.dispatchOnChange
	})
end

function inputTypeManager.didUpdate(p3, p4, _)
	-- upvalues: promptStateModule (ref), mouseIconOverrideService (ref)
	local var9 = p4.promptState == promptStateModule.None and p3.props.promptState ~= promptStateModule.None
	local var10 = p4.promptState ~= promptStateModule.None and p3.props.promptState == promptStateModule.None
	local var11 = if p3.props.gamepadEnabled then Enum.OverrideMouseIconBehavior.ForceHide else Enum.OverrideMouseIconBehavior.ForceShow
	
	if p3.props.promptState ~= promptStateModule.None and p4.gamepadEnabled ~= p3.props.gamepadEnabled then
		if p3.cursorOverridden then
			mouseIconOverrideService.pop("PurchasePromptOverrideKey")
		end
		mouseIconOverrideService.push("PurchasePromptOverrideKey", var11)
		p3.cursorOverridden = true
		
		return
	elseif var9 then
		mouseIconOverrideService.push("PurchasePromptOverrideKey", var11)
		p3.cursorOverridden = true
		
		return
	elseif var10 then
		mouseIconOverrideService.pop("PurchasePromptOverrideKey")
		p3.cursorOverridden = false
	end
end

return connectToStoreModule(function(p5)
	return {
		promptState = p5.promptState,
		gamepadEnabled = p5.gamepadEnabled
	}
end, function(p6)
	-- upvalues: setGamepadEnabledModule (ref)
	return {
		setGamepadEnabled = function(value)
			-- upvalues: p6 (ref), setGamepadEnabledModule (copy)
			p6(setGamepadEnabledModule(value))
		end
	}
end)(inputTypeManager)