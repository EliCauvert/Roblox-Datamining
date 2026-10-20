local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Providers.Style.Tokens)

return function(p1, p2): UDim2
	-- upvalues: InputSizeModule (copy)
	local Entry = ({
		[InputSizeModule.XSmall] = p1.Size.Size_300,
		[InputSizeModule.Small] = p1.Size.Size_400,
		[InputSizeModule.Medium] = p1.Size.Size_500,
		[InputSizeModule.Large] = p1.Size.Size_600
	})[p2]
	
	return UDim2.fromOffset(Entry, Entry)
end