local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local textInput = foundationModule.TextInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local fFlagShareSheetPeoplePickerEnabledModule = require(shareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)

return function(p1)
	-- upvalues: reactModule (ref), view (ref), fFlagShareSheetPeoplePickerEnabledModule (ref), textInput (ref), inputSize (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var1
	local var2, var3 = reactModule.useState("")
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var2 (ref)
		p1.onActivated(var2)
	end, { var2, p1.onActivated })
	local createElement = reactModule.createElement
	local t = { testId = "share-send-row" }
	local t_1 = { ["col gap-medium size-full-0 auto-y"] = true }
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		var1 = p1.hasHorizontalPadding ~= false
		var1 = nil
	else
		var1 = true
	end
	t_1["padding-x-xlarge padding-bottom-medium"] = var1
	t.tag = t_1
	t.LayoutOrder = p1.LayoutOrder
	
	return createElement(view, t, {
		MessageInput = reactModule.createElement(textInput, {
			label = "",
			LayoutOrder = 1,
			testId = "share-message-input",
			isDisabled = p1.isLoading,
			onChanged = var3,
			onFocusGained = p1.onFocusGained,
			placeholder = p1.messagePlaceholder,
			size = inputSize.Medium,
			text = var2,
			width = UDim.new(1, 0)
		}),
		SendButton = reactModule.createElement(button, {
			LayoutOrder = 2,
			testId = "share-send-button",
			text = p1.label,
			variant = buttonVariant.Emphasis,
			fillBehavior = if fFlagShareSheetPeoplePickerEnabledModule and p1.shouldFillButton == false then nil else fillBehavior.Fill,
			isLoading = p1.isLoading,
			size = inputSize.Medium,
			onActivated = var4,
			width = UDim.new(1, 0)
		})
	})
end