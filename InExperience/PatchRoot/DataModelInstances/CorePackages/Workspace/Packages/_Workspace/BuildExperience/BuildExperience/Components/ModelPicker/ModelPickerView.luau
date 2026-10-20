local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.ModelPickerTypes)
local Chip = FoundationModule.Chip
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), View (copy), Text (copy), Chip (copy), Sheet (copy)
	local Element = nil
	
	if Frame.isOpen then
		local Elements = {}
		
		for LayoutOrder, option in Frame.data.options do
			local IsDisabled = Frame.isDisabled or not option.isAvailable
			local Description = if option.isAvailable then option.description else Frame.unavailableText
			Elements[option.id] = ReactModule.createElement(View, {
				LayoutOrder = LayoutOrder,
				onActivated = function()
					-- upvalues: Frame (copy), option (copy)
					Frame.onSelect(option.id)
				end,
				isDisabled = IsDisabled,
				selection = { Selectable = not IsDisabled },
				cursor = FoundationModule.Enums.CursorType.RoundedRectNoInset,
				GroupTransparency = if IsDisabled then 0.5 else 0,
				tag = {
					["col gap-xxsmall size-full-0 auto-y padding-medium stroke-standard radius-medium"] = true,
					["stroke-system-contrast"] = Frame.selectedId == option.id,
					["stroke-default"] = Frame.selectedId ~= option.id
				},
				testId = `ModelPicker.Option.{option.id}`
			}, {
				Label = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-label-small text-wrap text-align-x-left content-emphasis",
					Text = option.label
				}),
				Description = if Description then ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
					Text = Description
				}) else nil
			})
		end
		Element = if #Frame.data.options > 0 then ReactModule.createElement(View, {
			tag = "col items-stretch gap-medium size-full-0 auto-y padding-y-xsmall",
			testId = "ModelPicker.Options"
		}, Elements) else ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
			Text = Frame.unavailableText
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Chip = ReactModule.createElement(View, {
			tag = "auto-xy stroke-standard stroke-default radius-circle",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Control = ReactModule.createElement(Chip, {
				testId = "ModelPicker.Chip",
				text = Frame.label,
				trailing = FoundationModule.Enums.IconName.ChevronLargeDown,
				size = FoundationModule.Enums.ChipSize.Medium,
				variant = FoundationModule.Enums.ChipVariant.Utility,
				isDisabled = Frame.isDisabled,
				onActivated = Frame.onOpen
			})
		}),
		Sheet = if Frame.isOpen then ReactModule.createElement(Sheet.Root, {
			isOpen = true,
			preferCenterSheet = true,
			testId = "ModelPicker.Sheet",
			onClose = Frame.onClose,
			ref = Frame.focusRootRef
		}, {
			Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = Frame.hasCloseAffordance }, {
				Title = ReactModule.createElement(Text, {
					tag = "shrink auto-xy text-title-large text-wrap text-align-x-left content-emphasis",
					Text = Frame.title
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, nil, { Body = Element })
		}) else nil
	})
end