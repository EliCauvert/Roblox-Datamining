local Parent = script:FindFirstAncestor("CommercePurchaseApp").Parent

return require(Parent.Rodux).combineReducers({
	commercePurchaseState = require(script.Parent.PromptStateReducer),
	currentToastMessages = require(Parent.ToastLite).Reducers.CurrentToastMessagesReducer
})