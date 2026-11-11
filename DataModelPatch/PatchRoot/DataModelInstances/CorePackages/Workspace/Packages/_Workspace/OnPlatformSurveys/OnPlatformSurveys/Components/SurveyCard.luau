local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local Text = FoundationModule.Text
local View = FoundationModule.View
local _ = require(OnPlatformSurveys.Components.surveyPhaseSlots)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), ButtonSize (copy), Button (copy), FillBehavior (copy)
	local Slots = p1.slots
	local PrimaryAction = Slots.primaryAction
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-medium bg-surface-100"
	}, {
		Header = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Leading = if Slots.headerTitle then ReactModule.createElement(Text, {
				tag = "fill auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = Slots.headerTitle
			}) else ReactModule.createElement(View, { tag = "fill auto-y", LayoutOrder = 1 }),
			DismissButton = ReactModule.createElement(IconButton, {
				isCircular = true,
				LayoutOrder = 2,
				icon = IconName.X,
				variant = ButtonVariant.Utility,
				size = ButtonSize.Small,
				onActivated = p1.onDismiss
			})
		}),
		Body = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, Slots.body),
		Actions = PrimaryAction and ReactModule.createElement(View, { tag = "row size-full-0 auto-y", LayoutOrder = 3 }, {
			PrimaryButton = ReactModule.createElement(Button, {
				text = PrimaryAction.text,
				variant = PrimaryAction.variant,
				fillBehavior = FillBehavior.Fill,
				isLoading = PrimaryAction.isLoading,
				isDisabled = PrimaryAction.isDisabled,
				onActivated = PrimaryAction.onActivated
			})
		}) or nil
	})
end)