local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local inputLabelSizeModule = require(foundation.Enums.InputLabelSize)
local t = {
	[inputSizeModule.Large] = inputLabelSizeModule.Large,
	[inputSizeModule.Medium] = inputLabelSizeModule.Medium,
	[inputSizeModule.Small] = inputLabelSizeModule.Small,
	[inputSizeModule.XSmall] = if require(foundation.Utility.Flags).FoundationInternalInputBeta then inputLabelSizeModule.XSmall else inputLabelSizeModule.Small
}

return function(p0)
	-- upvalues: t (ref)
	return t[p0]
end