local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ProgressBarModule = require(script.Parent.ProgressBar)
local ProgressCircleModule = require(script.Parent.ProgressCircle)
local ProgressShapeModule = require(Foundation.Enums.ProgressShape)
local _ = require(Foundation.Enums.ProgressSize)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Providers.Style.Tokens)
local config = { testId = "--foundation-progress" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ProgressShapeModule (copy), ReactModule (copy), ProgressCircleModule (copy), ProgressBarModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	WithDefaultsModuleResult.ref = Ref
	
	return if WithDefaultsModuleResult.shape == ProgressShapeModule.Circle then ReactModule.createElement(ProgressCircleModule, WithDefaultsModuleResult) else ReactModule.createElement(ProgressBarModule, WithDefaultsModuleResult)
end))