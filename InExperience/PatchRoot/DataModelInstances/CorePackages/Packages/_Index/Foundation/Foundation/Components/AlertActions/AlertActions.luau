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

return reactModule.memo(function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), MAX_ACTION_COUNT (ref), loggerModule (ref), dashModule (ref), inputSizeModule (ref), buttonModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), MAX_ACTION_COUNT (copy), loggerModule (copy)
		if var1.actions and MAX_ACTION_COUNT < #var1.actions then
			loggerModule:warning(`Alert components only support up to {MAX_ACTION_COUNT} actions`)
		end
	end, { var1.actions })
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), MAX_ACTION_COUNT (copy), dashModule (copy), inputSizeModule (copy), reactModule (copy), buttonModule (copy)
		if not var1.actions or #var1.actions <= 0 then
			return nil
		end
		local t = {}
		
		for i, v in var1.actions do
			if MAX_ACTION_COUNT < i then break end
			t["ActionButton" .. i] = reactModule.createElement(buttonModule, dashModule.join(v, {
				LayoutOrder = i,
				size = inputSizeModule.Small,
				testId = `{var1.testId}--action-{i}`
			}))
		end
		return t
	end, { var1.actions, var1.testId })
	
	return if var2 then reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = var1.tag or "auto-xy row gap-small",
		padding = var1.padding
	}), var2) else nil
end)