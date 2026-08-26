local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local progressBarModule = require(script.Parent.ProgressBar)
local progressCircleModule = require(script.Parent.ProgressCircle)
local progressShapeModule = require(foundation.Enums.ProgressShape)
local _ = require(foundation.Enums.ProgressSize)
local flagsModule = require(foundation.Utility.Flags)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Providers.Style.Tokens)
local t = { testId = "--foundation-progress" }

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), progressShapeModule (ref), reactModule (ref), progressCircleModule (ref), dashModule (ref), progressBarModule (ref)
	local var1 = withDefaultsModule(p1, t)
	
	if not flagsModule.FoundationProgressBarBetaUpdate then
		var1.ref = p2
	end
	return if var1.shape == progressShapeModule.Circle then reactModule.createElement(progressCircleModule, if flagsModule.FoundationProgressBarBetaUpdate then dashModule.join(var1, { ref = p2 }) else var1) else reactModule.createElement(progressBarModule, if flagsModule.FoundationProgressBarBetaUpdate then dashModule.join(var1, { ref = p2 }) else var1)
end))