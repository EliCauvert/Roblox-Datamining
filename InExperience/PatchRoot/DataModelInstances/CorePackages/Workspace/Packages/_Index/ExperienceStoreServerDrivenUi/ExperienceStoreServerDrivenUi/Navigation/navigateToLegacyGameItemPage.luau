local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local DataHydrationModule = require(Parent.DataHydration)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local GameItemDetailsLegacySubscriptionCreatorMissingCounterModule = require(ExperienceStoreServerDrivenUi.Events.GameItemDetailsLegacySubscriptionCreatorMissingCounter)
local GameItemTypeModule = require(ExperienceStoreServerDrivenUi.Utils.GameItemType)
local LogCounterModule = require(ExperienceStoreServerDrivenUi.Utils.logCounter)
local RefreshStoreForGameItemModule = require(ExperienceStoreServerDrivenUi.Utils.refreshStoreForGameItem)
local FFlagSduiSubscriptionCellPostPurchaseSync = require(Parent.SharedFlags).FFlagSduiSubscriptionCellPostPurchaseSync

local function getCreatorInfo(UniverseId)
	-- upvalues: DataHydrationModule (copy)
	local DataResult = DataHydrationModule.Game.getGameInfoStore(false).getGameInfo(UniverseId).data(false)
	
	return if DataResult == nil or DataResult.creatorType == nil or DataResult.creatorId == nil then nil else DataHydrationModule.Creator.getCreatorInfoStore(false).getCreatorInfo(`{DataResult.creatorType}_{DataResult.creatorId}`).data(false)
end

local function openSubscriptionPurchasePage(p1, p2): string?
	-- upvalues: DataHydrationModule (copy), getCreatorInfo (copy), LogCounterModule (copy), GameItemDetailsLegacySubscriptionCreatorMissingCounterModule (copy), AppPage (copy), FFlagSduiSubscriptionCellPostPurchaseSync (copy)
	local ItemId = p2.itemId
	local DataResult = DataHydrationModule.Game.getGameSubscriptionStore(false).getGameSubscriptionInfo(ItemId).data(false)
	
	if DataResult == nil then
		return "Subscription isn't hydrated"
	end
	if (tonumber(DataResult.priceInRobux) or 0) <= 0 and (tonumber(DataResult.priceTier) or 0) <= 0 then
		return "Subscription price isn't hydrated"
	end
	local CreatorInfo = getCreatorInfo(p2.universeId)
	local CreatorName = CreatorInfo and CreatorInfo.creatorName or ""
	
	if CreatorName == "" then
		LogCounterModule(GameItemDetailsLegacySubscriptionCreatorMissingCounterModule)
	end
	local Number: number? = tonumber(DataResult.imageAssetId)
	local IsIsSubscribed = DataResult.isSubscribed == true
	p1.dependencies.getNavigation().push(AppPage.SubscriptionPurchase, {
		extraProps = {
			subscriptionPurchaseProductInfo = {
				isForSale = true,
				name = DataResult.name or "",
				description = DataResult.description or "",
				iconImageAssetId = Number or 0,
				subscriptionPeriod = DataResult.periodType or "",
				displayPrice = DataResult.priceDisplay or "",
				priceInRobux = tonumber(DataResult.priceInRobux),
				priceTier = tonumber(DataResult.priceTier) or 0,
				subscriptionProviderName = CreatorName,
				subscriptionProviderId = p2.universeId,
				subscriptionTargetKey = ItemId
			},
			thumbnailString = if Number then `rbxthumb://type=Asset&id={Number}&w=420&h=420` else "",
			isSubScribed = IsIsSubscribed,
			isSubscribed = IsIsSubscribed,
			creatorName = CreatorInfo and CreatorInfo.creatorName,
			creatorVerified = CreatorInfo and CreatorInfo.isVerified,
			onPurchaseSuccess = if FFlagSduiSubscriptionCellPostPurchaseSync then function()
				-- upvalues: DataHydrationModule (upval), ItemId (copy), DataResult (copy)
				DataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfo(ItemId, { isSubscribed = true, id = DataResult.id })
			end else nil
		}
	})
	
	return nil
end

local function openLink(p1, p2, p3): string?
	-- upvalues: GetSduiActionHandlerRegistryFunction (copy), SduiActionType (copy), GameItemTypeModule (copy), UrlBuilder (copy), RefreshStoreForGameItemModule (copy)
	local ActionHandlerConfig = GetSduiActionHandlerRegistryFunction().getActionHandlerConfig(SduiActionType.Link)
	
	if ActionHandlerConfig == nil or ActionHandlerConfig.handler == nil then
		return "Link action isn't registered"
	else
		ActionHandlerConfig.handler({
			actionType = SduiActionType.Link,
			actionParams = {
				url = if p3.itemType == GameItemTypeModule.GamePass then UrlBuilder.game.info.pass({ passId = p3.itemId }) else UrlBuilder.economy.info.developerProduct({ universeId = p3.universeId, productId = p3.itemId }),
				onWebviewClose = function()
					-- upvalues: RefreshStoreForGameItemModule (upval), p3 (copy)
					RefreshStoreForGameItemModule(p3)
				end
			}
		}, p2, p1)
		
		return nil
	end
end

return function(p1, p2, p3)
	-- upvalues: GameItemTypeModule (copy), openSubscriptionPurchasePage (copy), openLink (copy)
	return if p3.itemType == GameItemTypeModule.Subscription then openSubscriptionPurchasePage(p1, p3) else openLink(p1, p2, p3)
end