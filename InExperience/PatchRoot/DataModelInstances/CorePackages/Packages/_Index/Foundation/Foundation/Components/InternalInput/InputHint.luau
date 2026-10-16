local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local InputLabelSizeModule = require(Foundation.Enums.InputLabelSize)
local Medium = InputLabelSizeModule.Medium

return ReactModule.memo(function(Frame) --[[ Line: 23 | Named "InputHint" ]]
	-- upvalues: Medium (copy), ReactModule (copy), InputLabelSizeModule (copy), TextModule (copy)
	local Size = Frame.size or Medium
	
	return ReactModule.createElement(TextModule, {
		Text = Frame.text,
		tag = ReactModule.useMemo(function() --[[ Line: 26 ]]
			-- upvalues: Frame (copy), Size (copy), InputLabelSizeModule (upval)
			return {
				["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
				["content-muted"] = Frame.isDisabled,
				["content-default"] = not Frame.isDisabled,
				["text-caption-small"] = Size == InputLabelSizeModule.Small or Size == InputLabelSizeModule.XSmall,
				["text-caption-medium"] = Size == InputLabelSizeModule.Medium or Size == InputLabelSizeModule.Large
			}
		end, { Frame.isDisabled, Size }),
		testId = Frame.testId,
		LayoutOrder = Frame.LayoutOrder,
		padding = Frame.padding
	})
end)