local Parent = script:FindFirstAncestor("ShareSheet").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), TextInput (copy), InputSize (copy), Button (copy), ButtonVariant (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		testId = "share-send-row"
	}, {
		MessageInput = ReactModule.createElement(TextInput, {
			label = "",
			LayoutOrder = 1,
			testId = "share-message-input",
			isDisabled = p1.isLoading,
			onChanged = UseStateResult2,
			onFocusGained = p1.onFocusGained,
			placeholder = p1.messagePlaceholder,
			size = InputSize.Medium,
			text = UseStateResult,
			width = UDim.new(1, 0)
		}),
		SendButton = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			testId = "share-send-button",
			text = p1.label,
			variant = ButtonVariant.Emphasis,
			isLoading = p1.isLoading,
			size = InputSize.Medium,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: p1 (copy), UseStateResult (copy)
				p1.onActivated(UseStateResult)
			end, { UseStateResult, p1.onActivated }),
			width = UDim.new(1, 0)
		})
	})
end