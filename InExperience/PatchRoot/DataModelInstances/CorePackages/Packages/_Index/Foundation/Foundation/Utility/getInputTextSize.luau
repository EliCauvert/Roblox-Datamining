local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local InputLabelSizeModule = require(Foundation.Enums.InputLabelSize)
local config = {
	[InputSizeModule.Large] = InputLabelSizeModule.Large,
	[InputSizeModule.Medium] = InputLabelSizeModule.Medium,
	[InputSizeModule.Small] = InputLabelSizeModule.Small,
	[InputSizeModule.XSmall] = InputLabelSizeModule.XSmall
}

return function(p1) --[[ Line: 19 | Named "getInputTextSize" ]]
	-- upvalues: config (copy)
	return config[p1]
end