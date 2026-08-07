local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 20 | named "HintText" ]]
	-- upvalues: reactModule (ref), textModule (ref), withCommonPropsModule (ref)
	return reactModule.createElement(textModule, withCommonPropsModule(p0, {
		Text = p0.text,
		tag = {
			["size-full-0 auto-y text-caption-small text-align-x-left text-align-y-top text-wrap"] = true,
			["content-action-alert"] = p0.hasError,
			["content-muted"] = p0.isDisabled and not p0.hasError,
			["content-default"] = not p0.isDisabled and not p0.hasError
		},
		ref = p1
	}))
end))