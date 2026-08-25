local parent = script.Parent.Parent
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local fitFrameOnAxisModule = require(script.Parent.FitFrameOnAxis)
local isRoact17Module = require(script.Parent.isRoact17)

return roactModule.forwardRef(function(p0, p1)
	-- upvalues: isRoact17Module (ref), roactModule (ref), cryoModule (ref), fitFrameOnAxisModule (ref)
	p0 = p0 or {}
	
	return roactModule.createElement(fitFrameOnAxisModule, cryoModule.Dictionary.join(p0, {
		axis = fitFrameOnAxisModule.Axis.Horizontal,
		minimumSize = UDim2.new(UDim.new(0, 0), p0.height),
		[if isRoact17Module() then "forwardedRef" else roactModule.Ref] = p1,
		height = cryoModule.None
	}))
end)