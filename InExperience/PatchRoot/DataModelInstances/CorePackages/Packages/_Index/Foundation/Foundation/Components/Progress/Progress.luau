local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ProgressBarModule = require(script.Parent.ProgressBar)
local ProgressCircleModule = require(script.Parent.ProgressCircle)
local ProgressShapeModule = require(Foundation.Enums.ProgressShape)
local _ = require(Foundation.Enums.ProgressSize)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Providers.Style.Tokens)
local config = { testId = "--foundation-progress" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ProgressShapeModule (copy), ReactModule (copy), ProgressCircleModule (copy), DashModule (copy), ProgressBarModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	return if WithDefaultsModuleResult.shape == ProgressShapeModule.Circle then ReactModule.createElement(ProgressCircleModule, DashModule.join(WithDefaultsModuleResult, { ref = Ref })) else ReactModule.createElement(ProgressBarModule, DashModule.join(WithDefaultsModuleResult, { ref = Ref }))
end))