local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local DateTimePickerBetaModule = require(script.Parent.DateTimePickerBeta)
local _ = require(script.Parent.DateTimePickerProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-date-time-picker",
	variant = require(Foundation.Enums.DateTimePickerVariant).Single
}

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), DateTimePickerBetaModule (copy), WithDefaultsModule (copy), config (copy)
	return ReactModule.createElement(DateTimePickerBetaModule, WithDefaultsModule(p1, config))
end)