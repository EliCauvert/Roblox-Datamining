local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local inputLabelSizeModule = require(foundation.Enums.InputLabelSize)
local medium = inputLabelSizeModule.Medium

return reactModule.memo(function(p1)
	-- upvalues: medium (ref), reactModule (ref), inputLabelSizeModule (ref), textModule (ref)
	local size = p1.size or medium
	
	return reactModule.createElement(textModule, {
		Text = p1.text,
		tag = reactModule.useMemo(function()
			-- upvalues: p1 (ref), size (ref), inputLabelSizeModule (copy)
			return {
				["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
				["content-muted"] = p1.isDisabled,
				["content-default"] = not p1.isDisabled,
				["text-caption-small"] = if size ~= inputLabelSizeModule.Small then size == inputLabelSizeModule.XSmall else true,
				["text-caption-medium"] = if size ~= inputLabelSizeModule.Medium then size == inputLabelSizeModule.Large else true
			}
		end, { p1.isDisabled, size }),
		testId = p1.testId,
		LayoutOrder = p1.LayoutOrder,
		padding = p1.padding
	})
end)