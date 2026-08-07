local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local textInput = foundationModule.TextInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 22 | named "ShareSendRow" ]]
	-- upvalues: reactModule (ref), view (ref), textInput (ref), inputSize (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var2, var3 = reactModule.useState("")
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-x-xlarge padding-bottom-medium",
		testId = "share-send-row",
		LayoutOrder = p0.LayoutOrder
	}, {
		MessageInput = reactModule.createElement(textInput, {
			label = "",
			LayoutOrder = 1,
			testId = "share-message-input",
			isDisabled = p0.isLoading,
			onChanged = var3,
			placeholder = p0.messagePlaceholder,
			size = inputSize.Medium,
			text = var2,
			width = UDim.new(1, 0)
		}),
		SendButton = reactModule.createElement(button, {
			LayoutOrder = 2,
			testId = "share-send-button",
			text = p0.label,
			variant = buttonVariant.Emphasis,
			fillBehavior = fillBehavior.Fill,
			isLoading = p0.isLoading,
			size = inputSize.Medium,
			onActivated = reactModule.useCallback(function() --[[ line: 24 ]]
				-- upvalues: p0 (ref), var2 (ref)
				p0.onActivated(var2)
			end, { var2, p0.onActivated }),
			width = UDim.new(1, 0)
		})
	})
end