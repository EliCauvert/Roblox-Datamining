local Parent = script.Parent.Parent
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Roact)
local FitFrameOnAxisModule = require(script.Parent.FitFrameOnAxis)
local IsRoact17Module = require(script.Parent.isRoact17)

return RoactModule.forwardRef(function(p1, p2) --[[ Line: 10 ]]
	-- upvalues: IsRoact17Module (copy), RoactModule (copy), CryoModule (copy), FitFrameOnAxisModule (copy)
	local P0 = p1 or {}
	
	return RoactModule.createElement(FitFrameOnAxisModule, (CryoModule.Dictionary.join(P0, {
		axis = FitFrameOnAxisModule.Axis.Vertical,
		minimumSize = UDim2.new(P0.width, UDim.new(0, 0)),
		[if IsRoact17Module() then "forwardedRef" else RoactModule.Ref] = p2,
		width = CryoModule.None
	})))
end)