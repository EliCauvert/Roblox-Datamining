local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local HttpService = game:GetService("HttpService")
local SharedFlagsModule = require(Parent.SharedFlags)
local RequestAssetPurchaseModule = require(PurchasePrompt.Actions.RequestAssetPurchase)
local RequestBundlePurchaseModule = require(PurchasePrompt.Actions.RequestBundlePurchase)
local RequestGamepassPurchaseModule = require(PurchasePrompt.Actions.RequestGamepassPurchase)
local RequestProductPurchaseModule = require(PurchasePrompt.Actions.RequestProductPurchase)
local RequestSubscriptionPurchaseModule = require(PurchasePrompt.Actions.RequestSubscriptionPurchase)
local RequestAvatarCreationFeePurchaseModule = require(PurchasePrompt.Actions.RequestAvatarCreationFeePurchase)
local RequestExperiencePurchaseModule = require(PurchasePrompt.Actions.RequestExperiencePurchase)
local RequestLookPurchaseModule = require(PurchasePrompt.Actions.RequestLookPurchase)
local RequestRobuxUpsellPurchaseModule = require(PurchasePrompt.Actions.RequestRobuxUpsellPurchase)
local RequestDeveloperSubscriptionPurchaseModule = require(PurchasePrompt.Actions.RequestDeveloperSubscriptionPurchase)
local RequestVIPServerPurchaseModule = require(PurchasePrompt.Actions.RequestVIPServerPurchase)
local CompleteRequestModule = require(PurchasePrompt.Actions.CompleteRequest)
local RefreshExpectedPriceModule = require(PurchasePrompt.Actions.RefreshExpectedPrice)
local VIPServerCreatedModule = require(PurchasePrompt.Actions.VIPServerCreated)
local VIPServerRenamedModule = require(PurchasePrompt.Actions.VIPServerRenamed)
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local FFlagAXMISWithBlackbird = SharedFlagsModule.FFlagAXMISWithBlackbird
local FFlagLuaAppsEnablePromptVIPServerPurchase = SharedFlagsModule.FFlagLuaAppsEnablePromptVIPServerPurchase
local FFlagStableIdempotencyKeyForProductAndGamePassModule = require(PurchasePrompt.Flags.FFlagStableIdempotencyKeyForProductAndGamePass)
local config = { requestType = RequestTypeModule.None }

return (require(Parent.PurchasePromptDeps).Rodux.createReducer(config, {
	[RequestAssetPurchaseModule.name] = function(_, p1)
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
	[RequestGamepassPurchaseModule.name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy), FFlagStableIdempotencyKeyForProductAndGamePassModule (copy), HttpService (copy)
		local config = {
			isRobloxPurchase = false,
			id = p1.id,
			infoType = Enum.InfoType.GamePass,
			requestType = RequestTypeModule.GamePass
		}
		
		if FFlagStableIdempotencyKeyForProductAndGamePassModule then
			local IdempotencyKey = p1.idempotencyKey
			
			if IdempotencyKey == nil or IdempotencyKey == "" then
				IdempotencyKey = HttpService:GenerateGUID(false)
			end
			config.idempotencyKey = IdempotencyKey
		end
		return config
	end,
	[RequestProductPurchaseModule.name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy), FFlagStableIdempotencyKeyForProductAndGamePassModule (copy), HttpService (copy)
		local config = {
			isRobloxPurchase = false,
			id = p1.id,
			infoType = Enum.InfoType.Product,
			requestType = RequestTypeModule.Product
		}
		
		if FFlagStableIdempotencyKeyForProductAndGamePassModule then
			local IdempotencyKey = p1.idempotencyKey
			
			if IdempotencyKey == nil or IdempotencyKey == "" then
				IdempotencyKey = HttpService:GenerateGUID(false)
			end
			config.idempotencyKey = IdempotencyKey
		end
		return config
	end,
	[RequestBundlePurchaseModule.name] = function(_, p1)
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
	[RequestSubscriptionPurchaseModule.name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return { id = p1.id, requestType = RequestTypeModule.Subscription }
	end,
	[RequestAvatarCreationFeePurchaseModule.name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.AvatarCreationFee,
			humanoidModel = p1.humanoidModel,
			id = p1.guid
		}
	end,
	[RequestExperiencePurchaseModule.name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.Experience,
			universeId = p1.universeId
		}
	end,
	[RequestLookPurchaseModule.name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.Look,
			lookId = p1.lookId
		}
	end,
	[RequestRobuxUpsellPurchaseModule.name] = if FFlagAXMISWithBlackbird then function(_, _)
		-- upvalues: RequestTypeModule (copy)
		return { requestType = RequestTypeModule.RobuxUpsell }
	end else nil,
	[RequestDeveloperSubscriptionPurchaseModule.name] = function(_, p1)
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.DeveloperSubscription,
			subscriptionId = p1.subscriptionId,
			expectedPrice = p1.expectedPrice
		}
	end,
	[RequestVIPServerPurchaseModule.name] = function(_, _)
		-- upvalues: RequestTypeModule (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), HttpService (copy)
		local config = { requestType = RequestTypeModule.VIPServer }
		
		if FFlagLuaAppsEnablePromptVIPServerPurchase then
			config.idempotencyKey = HttpService:GenerateGUID(false)
		end
		return config
	end,
	[RefreshExpectedPriceModule.name] = function(Tbl, p1)
		local Copy = table.clone(Tbl)
		Copy.expectedPrice = p1.expectedPrice
		
		return Copy
	end,
	[VIPServerCreatedModule.name] = if FFlagLuaAppsEnablePromptVIPServerPurchase then function(Tbl, p1)
		local Copy = table.clone(Tbl)
		Copy.vipServerId = p1.vipServerId
		Copy.vipServerName = p1.vipServerName
		Copy.vipServerAccessCode = p1.vipServerAccessCode
		
		return Copy
	end else nil,
	[VIPServerRenamedModule.name] = if FFlagLuaAppsEnablePromptVIPServerPurchase then function(Tbl, p1)
		local Copy = table.clone(Tbl)
		Copy.vipServerName = p1.vipServerName
		
		return Copy
	end else nil,
	[CompleteRequestModule.name] = function(_, _)
		-- upvalues: config (copy)
		return config
	end
}))