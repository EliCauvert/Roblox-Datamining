local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local requestVIPServerPurchaseModule = require(purchasePrompt.Actions.RequestVIPServerPurchase)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local hasPendingRequestModule = require(purchasePrompt.Utils.hasPendingRequest)
local thunkModule = require(purchasePrompt.Thunk)
local list = { externalSettingsModule }

return function()
	-- upvalues: thunkModule (ref), list (ref), hasPendingRequestModule (ref), requestVIPServerPurchaseModule (ref), externalSettingsModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: hasPendingRequestModule (copy), requestVIPServerPurchaseModule (copy), externalSettingsModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy)
		if hasPendingRequestModule(p1:getState()) then
			return nil
		end
		p1:dispatch(requestVIPServerPurchaseModule())
		
		if p2[externalSettingsModule].isStudio() then
			p1:dispatch(errorOccurredModule(purchaseErrorModule.UnsupportedInStudio))
		end
		return nil
	end)
end