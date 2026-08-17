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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 31 | named "Progress" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), progressShapeModule (ref), reactModule (ref), progressCircleModule (ref), dashModule (ref), progressBarModule (ref)
	local var9 = withDefaultsModule(p0, t)
	
	if not flagsModule.FoundationProgressBarBetaUpdate then
		var9.ref = p1
	end
	return if var9.shape == progressShapeModule.Circle then reactModule.createElement(progressCircleModule, if flagsModule.FoundationProgressBarBetaUpdate then dashModule.join(var9, { ref = p1 }) else var9) else reactModule.createElement(progressBarModule, if flagsModule.FoundationProgressBarBetaUpdate then dashModule.join(var9, { ref = p1 }) else var9)
end))