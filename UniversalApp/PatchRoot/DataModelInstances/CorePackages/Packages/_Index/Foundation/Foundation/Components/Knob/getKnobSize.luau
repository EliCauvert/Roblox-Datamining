local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Providers.Style.Tokens)
local flagsModule = require(foundation.Utility.Flags)

return function(p0, p1) --[[ line: 10 | named "getKnobSize" ]]
	-- upvalues: flagsModule (ref), inputSizeModule (ref)
	local var3 = (if flagsModule.FoundationToggleVisualUpdate then {
		[inputSizeModule.XSmall] = p0.Size.Size_300,
		[inputSizeModule.Small] = p0.Size.Size_400,
		[inputSizeModule.Medium] = p0.Size.Size_500,
		[inputSizeModule.Large] = p0.Size.Size_600
	} else {
		[inputSizeModule.XSmall] = p0.Size.Size_200,
		[inputSizeModule.Small] = p0.Size.Size_300,
		[inputSizeModule.Medium] = p0.Size.Size_400,
		[inputSizeModule.Large] = p0.Size.Size_700
	})[p1]
	
	return UDim2.fromOffset(var3, var3)
end