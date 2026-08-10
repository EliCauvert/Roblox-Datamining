local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local inputLabelSizeModule = require(foundation.Enums.InputLabelSize)
local medium = inputLabelSizeModule.Medium

return reactModule.memo(function(p0) --[[ line: 23 | named "InputHint" ]]
	-- upvalues: medium (ref), reactModule (ref), inputLabelSizeModule (ref), textModule (ref)
	local size = p0.size or medium
	
	return reactModule.createElement(textModule, {
		Text = p0.text,
		tag = reactModule.useMemo(function() --[[ line: 26 ]]
			-- upvalues: p0 (ref), size (ref), inputLabelSizeModule (copy)
			return {
				["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
				["content-muted"] = p0.isDisabled,
				["content-default"] = not p0.isDisabled,
				["text-caption-small"] = if size ~= inputLabelSizeModule.Small then size == inputLabelSizeModule.XSmall else true,
				["text-caption-medium"] = if size ~= inputLabelSizeModule.Medium then size == inputLabelSizeModule.Large else true
			}
		end, { p0.isDisabled, size }),
		testId = p0.testId,
		LayoutOrder = p0.LayoutOrder,
		padding = p0.padding
	})
end)