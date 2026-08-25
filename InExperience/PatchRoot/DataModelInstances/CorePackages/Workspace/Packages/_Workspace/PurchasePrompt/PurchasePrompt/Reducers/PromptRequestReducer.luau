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
	[requestAssetPurchaseModule.name] = function(_, p0)
		-- upvalues: httpService (ref), requestTypeModule (ref)
		local idempotencyKey = p0.idempotencyKey
		
		if idempotencyKey == nil or idempotencyKey == "" then
			idempotencyKey = httpService:GenerateGUID(false)
		end
		return {
			id = p0.id,
			infoType = Enum.InfoType.Asset,
			requestType = requestTypeModule.Asset,
			equipIfPurchased = p0.equipIfPurchased,
			isRobloxPurchase = p0.isRobloxPurchase,
			idempotencyKey = idempotencyKey,
			purchaseAuthToken = p0.purchaseAuthToken or "",
			collectibleItemId = p0.collectibleItemId or "",
			collectibleItemInstanceId = p0.collectibleItemInstanceId or "",
			collectibleProductId = p0.collectibleProductId or "",
			expectedPrice = p0.expectedPrice or 0
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
	[requestProductPurchaseModule.name] = function(_, p2)
		-- upvalues: requestTypeModule (ref)
		return {
			isRobloxPurchase = false,
			id = p2.id,
			infoType = Enum.InfoType.Product,
			requestType = requestTypeModule.Product
		}
	end,
	[requestBundlePurchaseModule.name] = function(_, p3)
		-- upvalues: httpService (ref), requestTypeModule (ref)
		local idempotencyKey = p3.idempotencyKey
		
		if idempotencyKey == nil or idempotencyKey == "" then
			idempotencyKey = httpService:GenerateGUID(false)
		end
		return {
			isRobloxPurchase = true,
			id = p3.id,
			infoType = Enum.InfoType.Bundle,
			requestType = requestTypeModule.Bundle,
			idempotencyKey = idempotencyKey,
			purchaseAuthToken = p3.purchaseAuthToken or "",
			collectibleItemId = p3.collectibleItemId or "",
			collectibleItemInstanceId = p3.collectibleItemInstanceId or "",
			collectibleProductId = p3.collectibleProductId or "",
			expectedPrice = p3.expectedPrice or 0
		}
	end,
	[requestPremiumPurchaseModule.name] = function(_, _)
		-- upvalues: requestTypeModule (ref)
		return { requestType = requestTypeModule.Premium }
	end,
	[requestSubscriptionPurchaseModule.name] = function(_, p4)
		-- upvalues: requestTypeModule (ref)
		return { id = p4.id, requestType = requestTypeModule.Subscription }
	end,
	[requestAvatarCreationFeePurchaseModule.name] = function(_, p5)
		-- upvalues: requestTypeModule (ref)
		return {
			requestType = requestTypeModule.AvatarCreationFee,
			humanoidModel = p5.humanoidModel,
			id = p5.guid
		}
	end,
	[requestExperiencePurchaseModule.name] = function(_, p6)
		-- upvalues: requestTypeModule (ref)
		return {
			requestType = requestTypeModule.Experience,
			universeId = p6.universeId
		}
	end,
	[requestLookPurchaseModule.name] = function(_, p7)
		-- upvalues: requestTypeModule (ref)
		return { requestType = requestTypeModule.Look, lookId = p7.lookId }
	end,
	[requestRobuxUpsellPurchaseModule.name] = if sharedFlagsModule.FFlagAXMISWithBlackbird then function(_, _)
		-- upvalues: requestTypeModule (ref)
		return { requestType = requestTypeModule.RobuxUpsell }
	end else nil,
	[requestDeveloperSubscriptionPurchaseModule.name] = function(_, p8)
		-- upvalues: requestTypeModule (ref)
		return {
			requestType = requestTypeModule.DeveloperSubscription,
			subscriptionId = p8.subscriptionId,
			expectedPrice = p8.expectedPrice
		}
	end,
	[refreshExpectedPriceModule.name] = function(p9, p10)
		local cloned = table.clone(p9)
		cloned.expectedPrice = p10.expectedPrice
		
		return cloned
	end,
	[completeRequestModule.name] = function(_, _)
		-- upvalues: t (ref)
		return t
	end
})