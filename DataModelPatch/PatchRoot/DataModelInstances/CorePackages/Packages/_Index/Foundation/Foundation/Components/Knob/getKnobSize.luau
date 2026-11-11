local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Providers.Style.Tokens)
local FlagsModule = require(Foundation.Utility.Flags)

return function(p1, p2): UDim2
	-- upvalues: FlagsModule (copy), InputSizeModule (copy)
	local Entry = (if FlagsModule.FoundationToggleVisualUpdate then {
		[InputSizeModule.XSmall] = p1.Size.Size_300,
		[InputSizeModule.Small] = p1.Size.Size_400,
		[InputSizeModule.Medium] = p1.Size.Size_500,
		[InputSizeModule.Large] = p1.Size.Size_600
	} else {
		[InputSizeModule.XSmall] = p1.Size.Size_200,
		[InputSizeModule.Small] = p1.Size.Size_300,
		[InputSizeModule.Medium] = p1.Size.Size_400,
		[InputSizeModule.Large] = p1.Size.Size_700
	})[p2]
	
	return UDim2.fromOffset(Entry, Entry)
end