local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), textModule (ref), withCommonPropsModule (ref)
	return reactModule.createElement(textModule, withCommonPropsModule(p1, {
		Text = p1.text,
		tag = {
			["size-full-0 auto-y text-caption-small text-align-x-left text-align-y-top text-wrap"] = true,
			["content-action-alert"] = p1.hasError,
			["content-muted"] = p1.isDisabled and not p1.hasError,
			["content-default"] = not p1.isDisabled and not p1.hasError
		},
		ref = p2
	}))
end))