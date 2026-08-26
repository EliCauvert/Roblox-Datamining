local parent = script.Parent.Parent
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local fitFrameOnAxisModule = require(script.Parent.FitFrameOnAxis)
local isRoact17Module = require(script.Parent.isRoact17)

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: isRoact17Module (ref), roactModule (ref), cryoModule (ref), fitFrameOnAxisModule (ref)
	p1 = p1 or {}
	
	return roactModule.createElement(fitFrameOnAxisModule, cryoModule.Dictionary.join(p1, {
		axis = fitFrameOnAxisModule.Axis.Vertical,
		minimumSize = UDim2.new(p1.width, UDim.new(0, 0)),
		[if isRoact17Module() then "forwardedRef" else roactModule.Ref] = p2,
		width = cryoModule.None
	}))
end)