local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.Orientation)
local optionSelectorGroupContextModule = require(script.Parent.OptionSelectorGroupContext)

return function()
	-- upvalues: reactModule (ref), optionSelectorGroupContextModule (ref)
	return reactModule.useContext(optionSelectorGroupContextModule)
end