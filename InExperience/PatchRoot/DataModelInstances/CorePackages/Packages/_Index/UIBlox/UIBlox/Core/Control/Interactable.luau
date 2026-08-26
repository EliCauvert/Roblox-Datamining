local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local foundationModule = require(parent_2.Foundation)
local controlStateModule = require(parent.Control.Enum.ControlState)
local _ = require(parent.Control.Hooks.useGuiControlState)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: imageSetComponentModule (ref), t (ref), reactModule (ref), controlStateModule (ref), foundationModule (ref)
	local cloned = table.clone(p1)
	cloned.isDisabled = cloned.isDisabled or cloned.userInteractionEnabled == false
	cloned.userInteractionEnabled = nil
	cloned.ref = p2
	cloned.component = cloned.component or imageSetComponentModule.Button
	cloned.stateLayer = t
	local var1 = reactModule.useRef(controlStateModule.Initialize)
	
	if p1.onStateChanged then
		function cloned.onStateChanged(p3)
			-- upvalues: controlStateModule (copy), p1 (ref), var1 (ref)
			local var2 = controlStateModule[p3]
			p1.onStateChanged(var1.current, var2)
			var1.current = var2
		end
	end
	return reactModule.createElement(foundationModule.UNSTABLE.Interactable, cloned)
end)