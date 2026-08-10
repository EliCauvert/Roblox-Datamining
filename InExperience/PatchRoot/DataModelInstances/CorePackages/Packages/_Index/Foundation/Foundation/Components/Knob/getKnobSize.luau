local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Providers.Style.Tokens)

return function(p0, p1) --[[ line: 9 | named "getKnobSize" ]]
	-- upvalues: inputSizeModule (ref)
	local var2 = ({
		[inputSizeModule.XSmall] = p0.Size.Size_300,
		[inputSizeModule.Small] = p0.Size.Size_400,
		[inputSizeModule.Medium] = p0.Size.Size_500,
		[inputSizeModule.Large] = p0.Size.Size_600
	})[p1]
	
	return UDim2.fromOffset(var2, var2)
end