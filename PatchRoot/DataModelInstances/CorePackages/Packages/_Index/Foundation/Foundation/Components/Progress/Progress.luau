-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local progressBarModule = require(script.Parent.ProgressBar)
local progressCircleModule = require(script.Parent.ProgressCircle)
local progressShapeModule = require(foundation.Enums.ProgressShape)
local _ = require(foundation.Enums.ProgressSize)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Providers.Style.Tokens)
local t = { testId = "--foundation-progress" }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 29 | named "Progress" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), progressShapeModule (ref), reactModule (ref), progressCircleModule (ref), progressBarModule (ref)
	local var7 = withDefaultsModule(p0, t)
	var7.ref = p1
	
	return if var7.shape == progressShapeModule.Circle then reactModule.createElement(progressCircleModule, var7) else reactModule.createElement(progressBarModule, var7)
end))