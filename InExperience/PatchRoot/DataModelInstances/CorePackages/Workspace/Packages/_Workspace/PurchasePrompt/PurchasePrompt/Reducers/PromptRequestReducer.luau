local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local HttpService = game:GetService("HttpService")
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local FFlagStableIdempotencyKeyForProductAndGamePassModule = require(PurchasePrompt.Flags.FFlagStableIdempotencyKeyForProductAndGamePass)
local config = { requestType = RequestTypeModule.None }

return (require(Parent.PurchasePromptDeps).Rodux.createReducer(config, {
	[require(PurchasePrompt.Actions.RequestAssetPurchase).name] = function(_, p1) --[[ Line: 33 ]]
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
	[require(PurchasePrompt.Actions.RequestGamepassPurchase).name] = function(_, p1) --[[ Line: 52 ]]
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
	[require(PurchasePrompt.Actions.RequestProductPurchase).name] = function(_, p1) --[[ Line: 68 ]]
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
	[require(PurchasePrompt.Actions.RequestBundlePurchase).name] = function(_, p1) --[[ Line: 84 ]]
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
	[require(PurchasePrompt.Actions.RequestPremiumPurchase).name] = function(_, _) --[[ Line: 102 ]]
		-- upvalues: RequestTypeModule (copy)
		return { requestType = RequestTypeModule.Premium }
	end,
	[require(PurchasePrompt.Actions.RequestSubscriptionPurchase).name] = function(_, p1) --[[ Line: 107 ]]
		-- upvalues: RequestTypeModule (copy)
		return {
			id = p1.id,
			requestType = RequestTypeModule.Subscription
		}
	end,
	[require(PurchasePrompt.Actions.RequestAvatarCreationFeePurchase).name] = function(_, p1) --[[ Line: 113 ]]
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.AvatarCreationFee,
			humanoidModel = p1.humanoidModel,
			id = p1.guid
		}
	end,
	[require(PurchasePrompt.Actions.RequestExperiencePurchase).name] = function(_, p1) --[[ Line: 120 ]]
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.Experience,
			universeId = p1.universeId
		}
	end,
	[require(PurchasePrompt.Actions.RequestLookPurchase).name] = function(_, p1) --[[ Line: 126 ]]
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.Look,
			lookId = p1.lookId
		}
	end,
	[require(PurchasePrompt.Actions.RequestRobuxUpsellPurchase).name] = if require(Parent.SharedFlags).FFlagAXMISWithBlackbird then function(_, _) --[[ Line: 133 ]]
		-- upvalues: RequestTypeModule (copy)
		return { requestType = RequestTypeModule.RobuxUpsell }
	end else nil,
	[require(PurchasePrompt.Actions.RequestDeveloperSubscriptionPurchase).name] = function(_, p1) --[[ Line: 139 ]]
		-- upvalues: RequestTypeModule (copy)
		return {
			requestType = RequestTypeModule.DeveloperSubscription,
			subscriptionId = p1.subscriptionId,
			expectedPrice = p1.expectedPrice
		}
	end,
	[require(PurchasePrompt.Actions.RequestVIPServerPurchase).name] = function(_, _) --[[ Line: 146 ]]
		-- upvalues: RequestTypeModule (copy)
		return { requestType = RequestTypeModule.VIPServer }
	end,
	[require(PurchasePrompt.Actions.RefreshExpectedPrice).name] = function(Tbl, p1) --[[ Line: 151 ]]
		local Copy = table.clone(Tbl)
		Copy.expectedPrice = p1.expectedPrice
		
		return Copy
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ Line: 156 ]]
		-- upvalues: config (copy)
		return config
	end
}))