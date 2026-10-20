local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.Orientation)
local OptionSelectorGroupContextModule = require(script.Parent.OptionSelectorGroupContext)

return function()
	-- upvalues: ReactModule (copy), OptionSelectorGroupContextModule (copy)
	return ReactModule.useContext(OptionSelectorGroupContextModule)
end