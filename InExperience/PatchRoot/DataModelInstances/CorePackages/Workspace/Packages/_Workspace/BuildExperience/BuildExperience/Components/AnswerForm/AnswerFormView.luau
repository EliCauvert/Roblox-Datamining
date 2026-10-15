local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local list = foundationModule.List
local view = foundationModule.View
local text = foundationModule.Text
local divider = foundationModule.Divider
local iconButton = foundationModule.IconButton

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), view (ref), list (ref), text (ref), iconButton (ref), divider (ref)
	local t = {}
	
	for i, v in p1.options do
		t[v.id] = reactModule.createElement(view, {
			tag = "size-full-0 auto-y radius-medium",
			LayoutOrder = i,
			onActivated = v.onActivated,
			isDisabled = p1.isSubmitting,
			selection = { Selectable = not p1.isSubmitting }
		}, {
			Item = reactModule.createElement(list.Item, {
				title = v.title,
				description = v.description,
				LayoutOrder = i,
				testId = `AnswerForm.Option.{v.id}`,
				trailing = if p1.isMultiSelect then reactModule.createElement(foundationModule.Checkbox, {
					label = "",
					Selectable = false,
					isChecked = v.isSelected,
					isDisabled = p1.isSubmitting,
					onActivated = v.onActivated
				}) else nil
			})
		})
	end
	t.Custom = if p1.isCustom then reactModule.createElement(foundationModule.TextInput, {
		label = "",
		placeholder = "",
		testId = "AnswerForm.CustomInput",
		LayoutOrder = #p1.options + 1,
		text = p1.customText,
		onChanged = p1.onCustomChanged,
		isDisabled = p1.isSubmitting,
		width = UDim.new(1, 0),
		size = foundationModule.Enums.InputSize.Large,
		variant = foundationModule.Enums.InputVariant.Utility
	}) else reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-large",
		testId = "AnswerForm.Custom",
		LayoutOrder = #p1.options + 1,
		onActivated = p1.onCustomActivated,
		isDisabled = p1.isSubmitting
	}, {
		Label = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-title-small text-wrap text-align-x-left content-emphasis",
			Text = p1.customLabel
		})
	})
	
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large bg-surface-0",
		testId = "AnswerForm",
		LayoutOrder = p1.LayoutOrder
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "AnswerForm.Header",
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-large padding-y-small"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = p1.title
			}),
			Close = reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				testId = "AnswerForm.Close",
				icon = foundationModule.Enums.IconName.X,
				size = foundationModule.Enums.InputSize.Small,
				variant = foundationModule.Enums.ButtonVariant.Utility,
				onActivated = p1.onStop
			})
		}),
		HeaderDivider = reactModule.createElement(divider, { LayoutOrder = 2 }),
		Body = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col size-full-0 auto-y",
			testId = "AnswerForm.Body"
		}, {
			Options = reactModule.createElement(list.Root, {
				LayoutOrder = 1,
				hasDivider = { hasDivider = true, isInset = false },
				isContained = { isContained = false, hasMargin = true }
			}, t)
		}),
		Error = if p1.errorText ~= nil then nil else reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y padding-x-large text-body-small text-wrap text-align-x-left content-alert",
			testId = "AnswerForm.Error",
			Text = p1.errorText
		}),
		FooterDivider = reactModule.createElement(divider, { LayoutOrder = 5 }),
		Footer = reactModule.createElement(view, {
			LayoutOrder = 6,
			testId = "AnswerForm.Actions",
			tag = "size-full-1600"
		}, {
			Progress = reactModule.createElement(text, {
				tag = "position-center-center anchor-center-center auto-xy text-body-medium content-default",
				Text = p1.progressText
			}),
			Forward = if p1.showForward then reactModule.createElement(iconButton, {
				isCircular = true,
				testId = "AnswerForm.Forward",
				icon = {
					name = foundationModule.Enums.IconName.ArrowMediumRight,
					variant = foundationModule.Enums.IconVariant.Filled
				},
				size = foundationModule.Enums.InputSize.Small,
				variant = if p1.isForwardDisabled then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
				Position = UDim2.new(1, -p1.footerInset, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				isDisabled = p1.isForwardDisabled,
				onActivated = p1.onForward
			}) else nil
		})
	})
end