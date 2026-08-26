local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local view = foundationModule.View
local _ = require(onPlatformSurveys.Components.surveyPhaseSlots)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref), iconButton (ref), iconName (ref), buttonVariant (ref), buttonSize (ref), button (ref), fillBehavior (ref)
	local slots = p1.slots
	local primaryAction = slots.primaryAction
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-medium bg-surface-100"
	}, {
		Header = reactModule.createElement(view, {
			tag = "row align-y-center gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Leading = if slots.headerTitle then reactModule.createElement(text, {
				tag = "fill auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = slots.headerTitle
			}) else reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = 1 }),
			DismissButton = reactModule.createElement(iconButton, {
				isCircular = true,
				LayoutOrder = 2,
				icon = iconName.X,
				variant = buttonVariant.Utility,
				size = buttonSize.Small,
				onActivated = p1.onDismiss
			})
		}),
		Body = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, slots.body),
		Actions = primaryAction and reactModule.createElement(view, { tag = "row size-full-0 auto-y", LayoutOrder = 3 }, {
			PrimaryButton = reactModule.createElement(button, {
				text = primaryAction.text,
				variant = primaryAction.variant,
				fillBehavior = fillBehavior.Fill,
				isLoading = primaryAction.isLoading,
				isDisabled = primaryAction.isDisabled,
				onActivated = primaryAction.onActivated
			})
		}) or nil
	})
end)