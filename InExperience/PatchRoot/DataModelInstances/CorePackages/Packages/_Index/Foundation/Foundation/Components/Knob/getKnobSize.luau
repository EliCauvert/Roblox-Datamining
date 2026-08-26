local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Providers.Style.Tokens)

return function(p1, p2)
	-- upvalues: inputSizeModule (ref)
	local var1 = ({
		[inputSizeModule.XSmall] = p1.Size.Size_300,
		[inputSizeModule.Small] = p1.Size.Size_400,
		[inputSizeModule.Medium] = p1.Size.Size_500,
		[inputSizeModule.Large] = p1.Size.Size_600
	})[p2]
	
	return UDim2.fromOffset(var1, var1)
end