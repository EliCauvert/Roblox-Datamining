local Parent = script:FindFirstAncestor("BuildExperience").Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local DeveloperSubscriptionModule = require(Parent.DataHydration.DeveloperSubscription)
local PromiseModule = require(Parent.Promise)
local _ = require(script.Parent.chatTypes)
local _ = require(script.Parent.localToolOverlay)
local CreateManageSubscriptionStoreModule = require(script.Parent.createManageSubscriptionStore)
local CreateMonetizationToolControllerModule = require(script.Parent.createMonetizationToolController)
local ProductStatusType = DeveloperSubscriptionModule.ProductStatusType
local config = {
	consumable = DeveloperSubscriptionModule.DeveloperSubscriptionProductType.Consumable,
	currency = DeveloperSubscriptionModule.DeveloperSubscriptionProductType.Currency,
	durable = DeveloperSubscriptionModule.DeveloperSubscriptionProductType.Durable
}
local v1 = nil

local function _()
	-- upvalues: v1 (ref), CreateManageSubscriptionStoreModule (copy)
	if v1 == nil then
		v1 = CreateManageSubscriptionStoreModule()
	end
	return v1
end

local function deletionResult(Id, p1)
	-- upvalues: ProductStatusType (copy)
	return if p1 == nil or p1.productStatusType == ProductStatusType.Deleted then { deleted = true, id = Id } else {
		deleted = false,
		deletionAccepted = true,
		id = Id,
		productStatusType = p1.productStatusType
	}
end

local config1 = {
	itemKind = "subscription",
	resultKey = "subscription",
	tool = if require(Parent.SharedFlags).FFlagBuildExperienceManageMonetizationTool then CreatorAgentChatModule.StudioManageMonetizationTool.forKind("subscription") else CreatorAgentChatModule.StudioManageSubscriptionTool,
	list = function(p1)
		-- upvalues: v1 (ref), CreateManageSubscriptionStoreModule (copy), PromiseModule (copy)
		if v1 == nil then
			v1 = CreateManageSubscriptionStoreModule()
		end
		return v1.list(p1):andThen(function(Result)
			return {
				count = #Result.developerSubscriptions,
				subscriptions = Result.developerSubscriptions,
				nextCursor = Result.nextCursor,
				truncated = Result.isIncomplete == true
			}
		end, function(p2)
			-- upvalues: PromiseModule (upval)
			return if typeof(p2) == "table" and p2.code == "IncompleteDeveloperSubscriptionList" then {
				truncated = true,
				count = #p2.developerSubscriptions,
				subscriptions = p2.developerSubscriptions,
				nextCursor = p2.nextCursor,
				truncatedReason = p2.message
			} else PromiseModule.reject(p2)
		end)
	end,
	mutate = function(p1, p2)
		-- upvalues: v1 (ref), CreateManageSubscriptionStoreModule (copy), config (copy), DeveloperSubscriptionModule (copy), deletionResult (copy), PromiseModule (copy)
		local SubscriptionId = p2.subscriptionId
		
		if p2.action == "create" then
			if v1 == nil then
				v1 = CreateManageSubscriptionStoreModule()
			end
			return v1.create(p1, {
				isRegionalPricingEnabled = true,
				name = p2.name,
				description = p2.description,
				productType = config[p2.productType],
				currencyType = DeveloperSubscriptionModule.CurrencyType.Robux,
				priceInRobux = p2.priceInRobux,
				imageAssetId = p2.imageAssetId
			})
		elseif p2.action == "update" then
			if v1 == nil then
				v1 = CreateManageSubscriptionStoreModule()
			end
			return v1.update(p1, SubscriptionId, {
				description = p2.description,
				currencyType = if p2.priceInRobux == nil then nil else DeveloperSubscriptionModule.CurrencyType.Robux,
				priceInRobux = p2.priceInRobux,
				isRegionalPricingEnabled = p2.priceInRobux ~= nil or nil,
				imageAssetId = p2.imageAssetId
			})
		elseif p2.action == "activate" then
			if v1 == nil then
				v1 = CreateManageSubscriptionStoreModule()
			end
			return v1.activate(p1, SubscriptionId)
		elseif p2.action == "deactivate" then
			if v1 == nil then
				v1 = CreateManageSubscriptionStoreModule()
			end
			return v1.deactivate(p1, SubscriptionId, p2.cancelRenewals == true)
		else
			if p2.action ~= "delete" then
				return PromiseModule.reject({
					errorMessage = ("Unsupported action '%s'."):format((tostring(p2.action)))
				})
			end
			if v1 == nil then
				v1 = CreateManageSubscriptionStoreModule()
			end
			return v1.delete(p1, SubscriptionId):andThen(function(Result)
				-- upvalues: deletionResult (upval), SubscriptionId (copy)
				return (deletionResult(SubscriptionId, Result))
			end)
		end
	end,
	itemIdOf = function(p1)
		return p1.subscriptionId
	end,
	cardFields = function(p1)
		return {
			productType = p1.productType,
			cancelRenewals = p1.cancelRenewals,
			imageAssetId = p1.imageAssetId
		}
	end
}

return function(p1, p2, p3, p4)
	-- upvalues: CreateMonetizationToolControllerModule (copy), config1 (copy)
	return CreateMonetizationToolControllerModule(config1, p1, p2, p3, p4)
end