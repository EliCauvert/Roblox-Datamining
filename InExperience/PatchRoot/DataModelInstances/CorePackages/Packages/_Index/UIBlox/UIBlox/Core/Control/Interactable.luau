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

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: imageSetComponentModule (ref), t (ref), reactModule (ref), controlStateModule (ref), foundationModule (ref)
	local cloned = table.clone(p0)
	cloned.isDisabled = cloned.isDisabled or cloned.userInteractionEnabled == false
	cloned.userInteractionEnabled = nil
	cloned.ref = p1
	cloned.component = cloned.component or imageSetComponentModule.Button
	cloned.stateLayer = t
	local var6 = reactModule.useRef(controlStateModule.Initialize)
	
	if p0.onStateChanged then
		function cloned.onStateChanged(p2)
			-- upvalues: controlStateModule (copy), p0 (ref), var6 (ref)
			local var7 = controlStateModule[p2]
			p0.onStateChanged(var6.current, var7)
			var6.current = var7
		end
	end
	return reactModule.createElement(foundationModule.UNSTABLE.Interactable, cloned)
end)