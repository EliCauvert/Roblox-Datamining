local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local counterModule = require(purchasePrompt.Enums.Counter)
local sendCounterModule = require(purchasePrompt.Thunks.sendCounter)
local networkModule = require(purchasePrompt.Services.Network)
local analyticsModule = require(purchasePrompt.Services.Analytics)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local thunkModule = require(purchasePrompt.Thunk)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local list = { analyticsModule, networkModule, externalSettingsModule }

return function()
	-- upvalues: thunkModule (ref), list (ref), promptStateModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), sendCounterModule (ref), counterModule (ref)
	return thunkModule.new(script.Name, list, function(p1, _)
		-- upvalues: promptStateModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), sendCounterModule (copy), counterModule (copy)
		if p1:getState().promptState == promptStateModule.BlackbirdUpsellInProgress then
			return
		end
		p1:dispatch(errorOccurredModule(purchaseErrorModule.InvalidFundsUnknown))
		p1:dispatch(sendCounterModule(counterModule.UpsellFailedNativePurchase))
	end)
end