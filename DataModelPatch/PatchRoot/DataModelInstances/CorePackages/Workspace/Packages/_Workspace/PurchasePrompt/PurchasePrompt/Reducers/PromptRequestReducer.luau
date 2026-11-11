local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local HttpService = game:GetService("HttpService")
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local config = { requestType = RequestTypeModule.None }

return (require(Parent.PurchasePromptDeps).Rodux.createReducer(config, {
	[require(PurchasePrompt.Actions.RequestAssetPurchase).name] = function(_, p1)
		-- upvalues: HttpService (copy), RequestTypeModule (copy)
		local IdempotencyKey = p1.idempotencyKey
		
		if IdempotencyKey == nil or IdempotencyKey == "" then
			IdempotencyKey = HttpService:GenerateGUID(false)
		end
		return {
			id = p1.id,
			infoType = Enum.InfoType.Asset,
			requestType = RequestTypeModule.Asset,
			equipIfPurchased = p1.equipIfPurchased,
			isRobloxPurchase = p1.isRobloxPurchase,
			idempotencyKey = IdempotencyKey,
			purchaseAuthToken = p1.purchaseAuthToken or "",
			collectibleItemId = p1.collectibleItemId or "",
			collectibleItemInstanceId = p1.collectibleItemInstanceId or "",
			collectibleProductId = p1.collectibleProductId or "",
			expectedPrice = p1.expectedPrice or 0
		}
	end,
	[require(PurchasePrompt.Actions.RequestGamepassPurchase).name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			isRobloxPurchase = false,
			id = p1.id,
			infoType = Enum.InfoType.GamePass,
			requestType = RequestTypeModule.GamePass
		}
	end,
	[require(PurchasePrompt.Actions.RequestProductPurchase).name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			isRobloxPurchase = false,
			id = p1.id,
			infoType = Enum.InfoType.Product,
			requestType = RequestTypeModule.Product
		}
	end,
	[require(PurchasePrompt.Actions.RequestBundlePurchase).name] = function(_, p1)
		-- upvalues: HttpService (copy), RequestTypeModule (copy)
		local IdempotencyKey = p1.idempotencyKey
		
		if IdempotencyKey == nil or IdempotencyKey == "" then
			IdempotencyKey = HttpService:GenerateGUID(false)
		end
		return {
			isRobloxPurchase = true,
			id = p1.id,
			infoType = Enum.InfoType.Bundle,
			requestType = RequestTypeModule.Bundle,
			idempotencyKey = IdempotencyKey,
			purchaseAuthToken = p1.purchaseAuthToken or "",
			collectibleItemId = p1.collectibleItemId or "",
			collectibleItemInstanceId = p1.collectibleItemInstanceId or "",
			collectibleProductId = p1.collectibleProductId or "",
			expectedPrice = p1.expectedPrice or 0
		}
	end,
	[require(PurchasePrompt.Actions.RequestPremiumPurchase).name] = function(_, _)
		-- upvalues: RequestTypeModule (copy)
		return { requestType = RequestTypeModule.Premium }
	end,
	[require(PurchasePrompt.Actions.RequestSubscriptionPurchase).name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			id = p1.id,
			requestType = RequestTypeModule.Subscription
		}
	end,
	[require(PurchasePrompt.Actions.RequestAvatarCreationFeePurchase).name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.AvatarCreationFee,
			humanoidModel = p1.humanoidModel,
			id = p1.guid
		}
	end,
	[require(PurchasePrompt.Actions.RequestExperiencePurchase).name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.Experience,
			universeId = p1.universeId
		}
	end,
	[require(PurchasePrompt.Actions.RequestLookPurchase).name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.Look,
			lookId = p1.lookId
		}
	end,
	[require(PurchasePrompt.Actions.RequestRobuxUpsellPurchase).name] = if require(Parent.SharedFlags).FFlagAXMISWithBlackbird then function(_, _)
		-- upvalues: RequestTypeModule (copy)
		return { requestType = RequestTypeModule.RobuxUpsell }
	end else nil,
	[require(PurchasePrompt.Actions.RequestDeveloperSubscriptionPurchase).name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.DeveloperSubscription,
			subscriptionId = p1.subscriptionId,
			expectedPrice = p1.expectedPrice
		}
	end,
	[require(PurchasePrompt.Actions.RefreshExpectedPrice).name] = function(Tbl, p1)
		local Copy = table.clone(Tbl)
		Copy.expectedPrice = p1.expectedPrice
		
		return Copy
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		-- upvalues: config (copy)
		return config
	end
}))