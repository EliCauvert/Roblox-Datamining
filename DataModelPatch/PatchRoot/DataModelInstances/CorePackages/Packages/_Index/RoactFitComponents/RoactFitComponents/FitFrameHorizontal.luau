local Parent = script.Parent.Parent
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Roact)
local FitFrameOnAxisModule = require(script.Parent.FitFrameOnAxis)
local IsRoact17Module = require(script.Parent.isRoact17)

return RoactModule.forwardRef(function(p1, p2)
	-- upvalues: IsRoact17Module (copy), RoactModule (copy), CryoModule (copy), FitFrameOnAxisModule (copy)
	local P0 = p1 or {}
	
	return RoactModule.createElement(FitFrameOnAxisModule, (CryoModule.Dictionary.join(P0, {
		axis = FitFrameOnAxisModule.Axis.Horizontal,
		minimumSize = UDim2.new(UDim.new(0, 0), P0.height),
		[if IsRoact17Module() then "forwardedRef" else RoactModule.Ref] = p2,
		height = CryoModule.None
	})))
end)