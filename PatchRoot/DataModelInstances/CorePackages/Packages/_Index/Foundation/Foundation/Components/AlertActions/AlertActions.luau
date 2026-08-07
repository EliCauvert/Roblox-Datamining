-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local buttonModule = require(foundation.Components.Button)
local inputSizeModule = require(foundation.Enums.InputSize)
local loggerModule = require(foundation.Utility.Logger)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local MAX_ACTION_COUNT = require(script.Parent.AlertConstants).MAX_ACTION_COUNT
local t = { testId = "--foundation-alert-actions" }

return reactModule.memo(function(p0) --[[ line: 33 | named "AlertActions" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), MAX_ACTION_COUNT (ref), loggerModule (ref), dashModule (ref), inputSizeModule (ref), buttonModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var10 = withDefaultsModule(p0, t)
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: var10 (ref), MAX_ACTION_COUNT (copy), loggerModule (copy)
		if var10.actions and MAX_ACTION_COUNT < #var10.actions then
			loggerModule:warning(`Alert components only support up to {MAX_ACTION_COUNT} actions`)
		end
	end, { var10.actions })
	local var11 = reactModule.useMemo(function() --[[ line: 41 ]]
		-- upvalues: var10 (ref), MAX_ACTION_COUNT (copy), dashModule (copy), inputSizeModule (copy), reactModule (copy), buttonModule (copy)
		if not var10.actions or #var10.actions <= 0 then
			return nil
		end
		local t = {}
		
		for i, v in var10.actions do
			if MAX_ACTION_COUNT < i then break end
			t["ActionButton" .. i] = reactModule.createElement(buttonModule, dashModule.join(v, {
				LayoutOrder = i,
				size = inputSizeModule.Small,
				testId = `{var10.testId}--action-{i}`
			}))
		end
		return t
	end, { var10.actions, var10.testId })
	
	return if var11 then reactModule.createElement(viewModule, withCommonPropsModule(var10, {
		tag = var10.tag or "auto-xy row gap-small",
		padding = var10.padding
	}), var11) else nil
end)