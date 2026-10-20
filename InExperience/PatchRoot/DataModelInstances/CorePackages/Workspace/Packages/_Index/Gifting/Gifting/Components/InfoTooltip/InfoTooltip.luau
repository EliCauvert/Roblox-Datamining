local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Coachmark = FoundationModule.Coachmark
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), IconButton (copy), IconName (copy), InputSize (copy), Coachmark (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-none auto-xy padding-y-xxsmall",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "auto-xy text-caption-small text-no-wrap content-default",
			LayoutOrder = 1,
			Text = Frame.text,
			testId = `{Frame.testId}-note`
		}),
		Info = ReactModule.createElement(IconButton, {
			LayoutOrder = 2,
			icon = IconName.CircleI,
			size = InputSize.XSmall,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(function(p1): boolean
					return not p1
				end)
			end, {}),
			ref = UseRefResult,
			testId = `{Frame.testId}-info`
		}),
		Tooltip = ReactModule.createElement(Coachmark, {
			title = Frame.tooltipTitle or "",
			text = Frame.tooltipText,
			isOpen = UseStateResult,
			anchorRef = UseRefResult,
			onPressedOutside = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end, {}),
			side = PopoverSide.Top,
			align = PopoverAlign.Center,
			testId = `{Frame.testId}-tooltip`
		})
	})
end)