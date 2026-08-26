local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local textInput = foundationModule.TextInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), view (ref), textInput (ref), inputSize (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var1, var2 = reactModule.useState("")
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-x-xlarge padding-bottom-medium",
		testId = "share-send-row",
		LayoutOrder = p1.LayoutOrder
	}, {
		MessageInput = reactModule.createElement(textInput, {
			label = "",
			LayoutOrder = 1,
			testId = "share-message-input",
			isDisabled = p1.isLoading,
			onChanged = var2,
			onFocusGained = p1.onFocusGained,
			placeholder = p1.messagePlaceholder,
			size = inputSize.Medium,
			text = var1,
			width = UDim.new(1, 0)
		}),
		SendButton = reactModule.createElement(button, {
			LayoutOrder = 2,
			testId = "share-send-button",
			text = p1.label,
			variant = buttonVariant.Emphasis,
			fillBehavior = fillBehavior.Fill,
			isLoading = p1.isLoading,
			size = inputSize.Medium,
			onActivated = reactModule.useCallback(function()
				-- upvalues: p1 (ref), var1 (ref)
				p1.onActivated(var1)
			end, { var1, p1.onActivated }),
			width = UDim.new(1, 0)
		})
	})
end