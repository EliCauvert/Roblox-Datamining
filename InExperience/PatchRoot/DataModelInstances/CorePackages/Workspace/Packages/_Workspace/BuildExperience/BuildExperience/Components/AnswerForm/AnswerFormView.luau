local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local List = FoundationModule.List
local View = FoundationModule.View
local Text = FoundationModule.Text
local Divider = FoundationModule.Divider
local IconButton = FoundationModule.IconButton

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), View (copy), List (copy), Text (copy), IconButton (copy), Divider (copy)
	local IsIsReadOnly = Frame.isReadOnly == true
	local IsSubmitting = Frame.isSubmitting or IsIsReadOnly
	local Elements = {}
	
	for LayoutOrder, option in Frame.options do
		Elements[option.id] = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y radius-medium",
			LayoutOrder = LayoutOrder,
			onActivated = option.onActivated,
			isDisabled = IsSubmitting,
			selection = { Selectable = not IsSubmitting }
		}, {
			Item = ReactModule.createElement(List.Item, {
				title = option.title,
				description = option.description,
				LayoutOrder = LayoutOrder,
				testId = `AnswerForm.Option.{option.id}`,
				trailing = if Frame.isMultiSelect then ReactModule.createElement(FoundationModule.Checkbox, {
					label = "",
					Selectable = false,
					isChecked = option.isSelected,
					isDisabled = IsSubmitting,
					onActivated = option.onActivated
				}) else nil
			})
		})
	end
	Elements.Custom = if Frame.isCustom then ReactModule.createElement(FoundationModule.TextInput, {
		label = "",
		placeholder = "",
		testId = "AnswerForm.CustomInput",
		LayoutOrder = #Frame.options + 1,
		text = Frame.customText,
		onChanged = Frame.onCustomChanged,
		isDisabled = IsSubmitting,
		width = UDim.new(1, 0),
		size = FoundationModule.Enums.InputSize.Large,
		variant = FoundationModule.Enums.InputVariant.Utility
	}) else ReactModule.createElement(View, {
		tag = "size-full-0 auto-y padding-large",
		testId = "AnswerForm.Custom",
		LayoutOrder = #Frame.options + 1,
		onActivated = Frame.onCustomActivated,
		isDisabled = IsSubmitting
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-title-small text-wrap text-align-x-left content-emphasis",
			Text = Frame.customLabel
		})
	})
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large bg-surface-0",
		testId = "AnswerForm",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			testId = "AnswerForm.Header",
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-large padding-y-small"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = Frame.title
			}),
			Close = ReactModule.createElement(IconButton, {
				LayoutOrder = 2,
				testId = "AnswerForm.Close",
				icon = FoundationModule.Enums.IconName.X,
				size = FoundationModule.Enums.InputSize.Small,
				variant = FoundationModule.Enums.ButtonVariant.Utility,
				isDisabled = IsIsReadOnly,
				onActivated = Frame.onStop
			})
		}),
		HeaderDivider = ReactModule.createElement(Divider, { LayoutOrder = 2 }),
		Body = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "col size-full-0 auto-y",
			testId = "AnswerForm.Body"
		}, {
			Options = ReactModule.createElement(List.Root, {
				LayoutOrder = 1,
				hasDivider = { hasDivider = true, isInset = false },
				isContained = { isContained = false, hasMargin = true }
			}, Elements)
		}),
		Error = if Frame.errorText == nil then nil else ReactModule.createElement(Text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y padding-x-large text-body-small text-wrap text-align-x-left content-alert",
			testId = "AnswerForm.Error",
			Text = Frame.errorText
		}),
		FooterDivider = ReactModule.createElement(Divider, { LayoutOrder = 5 }),
		Footer = ReactModule.createElement(View, {
			LayoutOrder = 6,
			testId = "AnswerForm.Actions",
			tag = "size-full-1600"
		}, {
			Progress = ReactModule.createElement(Text, {
				tag = "position-center-center anchor-center-center auto-xy text-body-medium content-default",
				Text = Frame.progressText
			}),
			Forward = if Frame.showForward then ReactModule.createElement(IconButton, {
				isCircular = true,
				testId = "AnswerForm.Forward",
				icon = {
					name = FoundationModule.Enums.IconName.ArrowMediumRight,
					variant = FoundationModule.Enums.IconVariant.Filled
				},
				size = FoundationModule.Enums.InputSize.Small,
				variant = if Frame.isForwardDisabled then FoundationModule.Enums.ButtonVariant.Standard else FoundationModule.Enums.ButtonVariant.Emphasis,
				Position = UDim2.new(1, -Frame.footerInset, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				isDisabled = Frame.isForwardDisabled,
				onActivated = Frame.onForward
			}) else nil
		})
	})
end