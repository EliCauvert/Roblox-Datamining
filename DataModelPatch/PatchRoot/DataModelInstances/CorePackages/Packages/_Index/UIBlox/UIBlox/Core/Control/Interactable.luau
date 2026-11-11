local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local FoundationModule = require(Parent2.Foundation)
local ControlStateModule = require(Parent.Control.Enum.ControlState)
local _ = require(Parent.Control.Hooks.useGuiControlState)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

return (ReactModule.forwardRef(function(Tbl, Ref)
	-- upvalues: ImageSetComponentModule (copy), StateLayer (copy), ReactModule (copy), ControlStateModule (copy), FoundationModule (copy)
	local Copy = table.clone(Tbl)
	Copy.isDisabled = Copy.isDisabled or Copy.userInteractionEnabled == false
	Copy.userInteractionEnabled = nil
	Copy.ref = Ref
	Copy.component = Copy.component or ImageSetComponentModule.Button
	Copy.stateLayer = StateLayer
	local UseRefResult = ReactModule.useRef(ControlStateModule.Initialize)
	
	if Tbl.onStateChanged then
		function Copy.onStateChanged(Current)
			-- upvalues: ControlStateModule (upval), Tbl (copy), UseRefResult (copy)
			local ControlStateModuleEntry = ControlStateModule[Current]
			Tbl.onStateChanged(UseRefResult.current, ControlStateModuleEntry)
			UseRefResult.current = ControlStateModuleEntry
		end
	end
	return ReactModule.createElement(FoundationModule.UNSTABLE.Interactable, Copy)
end))