local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local inputLabelSizeModule = require(foundation.Enums.InputLabelSize)
local t = {
	[inputSizeModule.Large] = inputLabelSizeModule.Large,
	[inputSizeModule.Medium] = inputLabelSizeModule.Medium,
	[inputSizeModule.Small] = inputLabelSizeModule.Small,
	[inputSizeModule.XSmall] = inputLabelSizeModule.Small
}

return function(p0) --[[ line: 19 | named "getInputTextSize" ]]
	-- upvalues: t (ref)
	return t[p0]
end