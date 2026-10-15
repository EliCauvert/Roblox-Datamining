local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local coachmark = foundationModule.Coachmark
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref), iconButton (ref), iconName (ref), inputSize (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-none auto-xy padding-y-xxsmall",
		LayoutOrder = p1.LayoutOrder
	}, {
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-caption-small text-no-wrap content-default",
			LayoutOrder = 1,
			Text = p1.text,
			testId = `{p1.testId}-note`
		}),
		Info = reactModule.createElement(iconButton, {
			LayoutOrder = 2,
			icon = iconName.CircleI,
			size = inputSize.XSmall,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var2 (ref)
				var2(function(p2)
					return not p2
				end)
			end, {}),
			ref = var3,
			testId = `{p1.testId}-info`
		}),
		Tooltip = reactModule.createElement(coachmark, {
			title = p1.tooltipTitle or "",
			text = p1.tooltipText,
			isOpen = var1,
			anchorRef = var3,
			onPressedOutside = reactModule.useCallback(function()
				-- upvalues: var2 (ref)
				var2(false)
			end, {}),
			side = popoverSide.Top,
			align = popoverAlign.Center,
			testId = `{p1.testId}-tooltip`
		})
	})
end)