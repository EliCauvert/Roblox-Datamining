local Parent = script:FindFirstAncestor("Schools").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local Chip = FoundationModule.Chip
local Sheet = FoundationModule.Sheet
local RadioGroup = FoundationModule.RadioGroup
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local View = FoundationModule.View
local ChipSize = FoundationModule.Enums.ChipSize
local InputSize = FoundationModule.Enums.InputSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName

return function(p1)
	-- upvalues: ReactModule (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), RadioGroup (copy), Chip (copy), IconName (copy), ChipSize (copy), Sheet (copy), Text (copy), View (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p1.value)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		if p1.value ~= nil and p1.value ~= p1.defaultValue then
			for _, option in p1.options do
				if option.id == p1.value then
					return option.text, true
				end
			end
		end
		return p1.label, false
	end, { p1.options, p1.value, p1.label, p1.defaultValue })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), p1 (copy), UseStateResult2 (copy)
		UseStateResult2_1(p1.value)
		UseStateResult2(true)
	end, { p1.value })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	UseFocusNavigableSurfaceRegistryConnectionFunction(UseStateResult3, FocusNavigableSurfaceIdentifierEnum.CentralOverlay, UseStateResult)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Chip = ReactModule.createElement(Chip, {
			text = UseMemoResult,
			trailing = IconName.ChevronLargeDown,
			isChecked = UseMemoResult2,
			size = ChipSize.Small,
			onActivated = UseResult,
			LayoutOrder = p1.layoutOrder
		}),
		PickerSheet = ReactModule.createElement(Sheet.Root, {
			preferCenterSheet = true,
			isOpen = UseStateResult,
			onClose = UseResult1,
			ref = UseStateResult2_2
		}, {
			Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
				Title = ReactModule.createElement(Text, {
					tag = "fill auto-y text-title-large text-align-x-left content-emphasis",
					Text = p1.sheetTitle
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, { Selectable = false }, {
				Options = ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, {
					Group = ReactModule.createElement(RadioGroup.Root, {
						value = UseStateResult1,
						onValueChanged = UseStateResult2_1
					}, (ReactModule.useMemo(function()
						-- upvalues: p1 (copy), ReactModule (upval), RadioGroup (upval)
						local Elements = {}
						
						for LayoutOrder, option in p1.options do
							Elements[`item_{option.id}`] = ReactModule.createElement(RadioGroup.Item, {
								value = option.id,
								label = option.label or option.text,
								LayoutOrder = LayoutOrder
							})
						end
						return Elements
					end, { p1.options })))
				})
			}),
			Actions = ReactModule.createElement(Sheet.Actions, nil, {
				Apply = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = p1.applyText,
					size = InputSize.Large,
					variant = ButtonVariant.Emphasis,
					fillBehavior = FillBehavior.Fill,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseStateResult2 (copy), UseStateResult1 (copy), p1 (copy)
						UseStateResult2(false)
						
						if UseStateResult1 ~= nil then
							p1.onChanged(UseStateResult1)
						end
					end, { UseStateResult1, p1.onChanged })
				})
			})
		})
	})
end