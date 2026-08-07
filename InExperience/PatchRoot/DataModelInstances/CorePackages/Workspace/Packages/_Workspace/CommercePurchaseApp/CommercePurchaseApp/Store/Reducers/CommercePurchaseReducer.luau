local parent = script:FindFirstAncestor("CommercePurchaseApp").Parent

return require(parent.Rodux).combineReducers({
	commercePurchaseState = require(script.Parent.PromptStateReducer),
	currentToastMessages = require(parent.ToastLite).Reducers.CurrentToastMessagesReducer
})