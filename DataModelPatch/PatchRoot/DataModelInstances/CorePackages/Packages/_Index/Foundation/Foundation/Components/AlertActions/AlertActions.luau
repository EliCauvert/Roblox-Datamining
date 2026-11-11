local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ButtonModule = require(Foundation.Components.Button)
local InputSizeModule = require(Foundation.Enums.InputSize)
local LoggerModule = require(Foundation.Utility.Logger)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local MAXACTIONCOUNT = require(script.Parent.AlertConstants).MAX_ACTION_COUNT
local config = { testId = "--foundation-alert-actions" }

return ReactModule.memo(function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), MAXACTIONCOUNT (copy), LoggerModule (copy), DashModule (copy), InputSizeModule (copy), ButtonModule (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), MAXACTIONCOUNT (upval), LoggerModule (upval)
		if WithDefaultsModuleResult.actions and MAXACTIONCOUNT < #WithDefaultsModuleResult.actions then
			LoggerModule:warning(`Alert components only support up to {MAXACTIONCOUNT} actions`)
		end
	end, { WithDefaultsModuleResult.actions })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), MAXACTIONCOUNT (upval), DashModule (upval), InputSizeModule (upval), ReactModule (upval), ButtonModule (upval)
		if not WithDefaultsModuleResult.actions or #WithDefaultsModuleResult.actions <= 0 then
			return nil
		end
		local Elements = {}
		
		for LayoutOrder, action in WithDefaultsModuleResult.actions do
			if MAXACTIONCOUNT < LayoutOrder then break end
			Elements["ActionButton" .. LayoutOrder] = ReactModule.createElement(ButtonModule, (DashModule.join(action, {
				LayoutOrder = LayoutOrder,
				size = InputSizeModule.Small,
				testId = `{WithDefaultsModuleResult.testId}--action-{LayoutOrder}`
			})))
		end
		return Elements
	end, {
		WithDefaultsModuleResult.actions,
		WithDefaultsModuleResult.testId
	})
	
	return if UseMemoResult then ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = WithDefaultsModuleResult.tag or "auto-xy row gap-small",
		padding = WithDefaultsModuleResult.padding
	}), UseMemoResult) else nil
end)