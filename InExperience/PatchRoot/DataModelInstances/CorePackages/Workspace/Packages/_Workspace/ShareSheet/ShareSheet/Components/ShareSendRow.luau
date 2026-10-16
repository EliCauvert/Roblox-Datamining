local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local FFlagShareSheetPeoplePickerEnabledModule = require(ShareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)

return function(Frame) --[[ Line: 27 | Named "ShareSendRow" ]]
	-- upvalues: ReactModule (copy), View (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), TextInput (copy), InputSize (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	
	return ReactModule.createElement(View, {
		testId = "share-send-row",
		tag = {
			["col gap-medium size-full-0 auto-y"] = true,
			["padding-x-xlarge padding-bottom-medium"] = not FFlagShareSheetPeoplePickerEnabledModule or Frame.hasHorizontalPadding ~= false
		},
		LayoutOrder = Frame.LayoutOrder
	}, {
		MessageInput = ReactModule.createElement(TextInput, {
			label = "",
			LayoutOrder = 1,
			testId = "share-message-input",
			isDisabled = Frame.isLoading,
			onChanged = UseStateResult2,
			onFocusGained = Frame.onFocusGained,
			placeholder = Frame.messagePlaceholder,
			size = InputSize.Medium,
			text = UseStateResult,
			width = UDim.new(1, 0)
		}),
		SendButton = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			testId = "share-send-button",
			text = Frame.label,
			variant = ButtonVariant.Emphasis,
			fillBehavior = if FFlagShareSheetPeoplePickerEnabledModule and Frame.shouldFillButton == false then nil else FillBehavior.Fill,
			isLoading = Frame.isLoading,
			size = InputSize.Medium,
			onActivated = ReactModule.useCallback(function() --[[ Line: 29 ]]
				-- upvalues: Frame (copy), UseStateResult (copy)
				Frame.onActivated(UseStateResult)
			end, { UseStateResult, Frame.onActivated }),
			width = UDim.new(1, 0)
		})
	})
end