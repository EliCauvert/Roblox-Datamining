local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local httpService = game:GetService("HttpService")
local sharedFlagsModule = require(parent.SharedFlags)
local rodux = require(parent.PurchasePromptDeps).Rodux
local requestAssetPurchaseModule = require(purchasePrompt.Actions.RequestAssetPurchase)
local requestBundlePurchaseModule = require(purchasePrompt.Actions.RequestBundlePurchase)
local requestGamepassPurchaseModule = require(purchasePrompt.Actions.RequestGamepassPurchase)
local requestProductPurchaseModule = require(purchasePrompt.Actions.RequestProductPurchase)
local requestPremiumPurchaseModule = require(purchasePrompt.Actions.RequestPremiumPurchase)
local requestSubscriptionPurchaseModule = require(purchasePrompt.Actions.RequestSubscriptionPurchase)
local requestAvatarCreationFeePurchaseModule = require(purchasePrompt.Actions.RequestAvatarCreationFeePurchase)
local requestExperiencePurchaseModule = require(purchasePrompt.Actions.RequestExperiencePurchase)
local requestLookPurchaseModule = require(purchasePrompt.Actions.RequestLookPurchase)
local requestRobuxUpsellPurchaseModule = require(purchasePrompt.Actions.RequestRobuxUpsellPurchase)
local requestDeveloperSubscriptionPurchaseModule = require(purchasePrompt.Actions.RequestDeveloperSubscriptionPurchase)
local completeRequestModule = require(purchasePrompt.Actions.CompleteRequest)
local refreshExpectedPriceModule = require(purchasePrompt.Actions.RefreshExpectedPrice)
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local t = { requestType = requestTypeModule.None }

return rodux.createReducer(t, {
	[requestAssetPurchaseModule.name] = function(_, p1)
		-- upvalues: httpService (ref), requestTypeModule (ref)
		local idempotencyKey = p1.idempotencyKey
		
		if idempotencyKey == nil or idempotencyKey == "" then
			idempotencyKey = httpService:GenerateGUID(false)
		end
		return {
			id = p1.id,
			infoType = Enum.InfoType.Asset,
			requestType = requestTypeModule.Asset,
			equipIfPurchased = p1.equipIfPurchased,
			isRobloxPurchase = p1.isRobloxPurchase,
			idempotencyKey = idempotencyKey,
			purchaseAuthToken = p1.purchaseAuthToken or "",
			collectibleItemId = p1.collectibleItemId or "",
			collectibleItemInstanceId = p1.collectibleItemInstanceId or "",
			collectibleProductId = p1.collectibleProductId or "",
			expectedPrice = p1.expectedPrice or 0
		}
	end,
	[requestGamepassPurchaseModule.name] = function(_, p1)
		-- upvalues: requestTypeModule (ref)
		return {
			isRobloxPurchase = false,
			id = p1.id,
			infoType = Enum.InfoType.GamePass,
			requestType = requestTypeModule.GamePass
		}
	end,
	[requestProductPurchaseModule.name] = function(_, p1)
		-- upvalues: requestTypeModule (ref)
		return {
			isRobloxPurchase = false,
			id = p1.id,
			infoType = Enum.InfoType.Product,
			requestType = requestTypeModule.Product
		}
	end,
	[requestBundlePurchaseModule.name] = function(_, p1)
		-- upvalues: httpService (ref), requestTypeModule (ref)
		local idempotencyKey = p1.idempotencyKey
		
		if idempotencyKey == nil or idempotencyKey == "" then
			idempotencyKey = httpService:GenerateGUID(false)
		end
		return {
			isRobloxPurchase = true,
			id = p1.id,
			infoType = Enum.InfoType.Bundle,
			requestType = requestTypeModule.Bundle,
			idempotencyKey = idempotencyKey,
			purchaseAuthToken = p1.purchaseAuthToken or "",
			collectibleItemId = p1.collectibleItemId or "",
			collectibleItemInstanceId = p1.collectibleItemInstanceId or "",
			collectibleProductId = p1.collectibleProductId or "",
			expectedPrice = p1.expectedPrice or 0
		}
	end,
	[requestPremiumPurchaseModule.name] = function(_, _)
		-- upvalues: requestTypeModule (ref)
		return { requestType = requestTypeModule.Premium }
	end,
	[requestSubscriptionPurchaseModule.name] = function(_, p1)
		-- upvalues: requestTypeModule (ref)
		return { id = p1.id, requestType = requestTypeModule.Subscription }
	end,
	[requestAvatarCreationFeePurchaseModule.name] = function(_, p1)
		-- upvalues: requestTypeModule (ref)
		return {
			requestType = requestTypeModule.AvatarCreationFee,
			humanoidModel = p1.humanoidModel,
			id = p1.guid
		}
	end,
	[requestExperiencePurchaseModule.name] = function(_, p1)
		-- upvalues: requestTypeModule (ref)
		return {
			requestType = requestTypeModule.Experience,
			universeId = p1.universeId
		}
	end,
	[requestLookPurchaseModule.name] = function(_, p1)
		-- upvalues: requestTypeModule (ref)
		return { requestType = requestTypeModule.Look, lookId = p1.lookId }
	end,
	[requestRobuxUpsellPurchaseModule.name] = if sharedFlagsModule.FFlagAXMISWithBlackbird then function(_, _)
		-- upvalues: requestTypeModule (ref)
		return { requestType = requestTypeModule.RobuxUpsell }
	end else nil,
	[requestDeveloperSubscriptionPurchaseModule.name] = function(_, p1)
		-- upvalues: requestTypeModule (ref)
		return {
			requestType = requestTypeModule.DeveloperSubscription,
			subscriptionId = p1.subscriptionId,
			expectedPrice = p1.expectedPrice
		}
	end,
	[refreshExpectedPriceModule.name] = function(p1, p2)
		local cloned = table.clone(p1)
		cloned.expectedPrice = p2.expectedPrice
		
		return cloned
	end,
	[completeRequestModule.name] = function(_, _)
		-- upvalues: t (ref)
		return t
	end
})