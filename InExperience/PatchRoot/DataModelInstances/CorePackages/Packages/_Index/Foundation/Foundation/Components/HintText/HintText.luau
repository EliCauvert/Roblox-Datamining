local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 20 | Named "HintText" ]]
	-- upvalues: ReactModule (copy), TextModule (copy), WithCommonPropsModule (copy)
	return ReactModule.createElement(TextModule, WithCommonPropsModule(p1, {
		Text = p1.text,
		tag = {
			["size-full-0 auto-y text-caption-small text-align-x-left text-align-y-top text-wrap"] = true,
			["content-action-alert"] = p1.hasError,
			["content-muted"] = p1.isDisabled and not p1.hasError,
			["content-default"] = not p1.isDisabled and not p1.hasError
		},
		ref = Ref
	}))
end))