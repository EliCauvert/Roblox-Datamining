local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local _ = require(ExperienceStoreServerDrivenUi.Parent.DataHydration)
local GameItemDetailsMissingFieldCounterModule = require(ExperienceStoreServerDrivenUi.Events.GameItemDetailsMissingFieldCounter)
local GameItemTypeModule = require(ExperienceStoreServerDrivenUi.Utils.GameItemType)
local LogCounterModule = require(ExperienceStoreServerDrivenUi.Utils.logCounter)

local function getRequiredFields(p1, p2)
	-- upvalues: GameItemTypeModule (copy)
	local HydrationData = p2.hydration_data
	
	if HydrationData == nil then
		return nil
	end
	if p1.itemType == GameItemTypeModule.GamePass then
		local GamePass = HydrationData.gamePass
		local GamePassEntry = if GamePass then GamePass[p1.itemId] else nil
		
		if GamePassEntry == nil then
			return nil
		end
		local List = {
			{ name = "displayName", value = GamePassEntry.displayName },
			{
				name = "displayIconImageAssetId",
				value = GamePassEntry.displayIconImageAssetId
			}
		}
		
		if GamePassEntry.isPurchasable then
			table.insert(List, { name = "price", value = GamePassEntry.price })
		end
		return List
	else
		if p1.itemType ~= GameItemTypeModule.DeveloperProduct then
			local GameSubscription = HydrationData.gameSubscription
			local GameSubscriptionEntry = if GameSubscription then GameSubscription[p1.itemId] else nil
			
			return if GameSubscriptionEntry == nil then nil else {
				{ name = "name", value = GameSubscriptionEntry.name },
				{
					name = "imageAssetId",
					value = GameSubscriptionEntry.imageAssetId
				},
				{
					name = "priceDisplay",
					value = GameSubscriptionEntry.priceDisplay
				}
			}
		end
		local GameDeveloperProduct = HydrationData.gameDeveloperProduct
		local GameDeveloperProductEntry = if GameDeveloperProduct then GameDeveloperProduct[p1.itemId] else nil
		
		if GameDeveloperProductEntry == nil then
			return nil
		end
		local List = {
			{ name = "name", value = GameDeveloperProductEntry.name },
			{
				name = "imageAssetId",
				value = GameDeveloperProductEntry.imageAssetId
			}
		}
		
		if GameDeveloperProductEntry.isPurchasable then
			table.insert(List, {
				name = "priceInRobux",
				value = GameDeveloperProductEntry.priceInRobux
			})
		end
		return List
	end
end

local function _(p1): boolean
	return p1 == nil or (p1 == "" or (p1 == 0 or p1 == "0"))
end

local _ = function(ItemType, Field)
	-- upvalues: LogCounterModule (copy), GameItemDetailsMissingFieldCounterModule (copy)
	LogCounterModule(GameItemDetailsMissingFieldCounterModule, 1, { itemType = ItemType, field = Field })
end

return function(p1, p2)
	-- upvalues: getRequiredFields (copy), LogCounterModule (copy), GameItemDetailsMissingFieldCounterModule (copy)
	if p2 == nil then return end
	local RequiredFields = getRequiredFields(p1, p2)
	
	if RequiredFields == nil then
		LogCounterModule(GameItemDetailsMissingFieldCounterModule, 1, { field = "item", itemType = p1.itemType })
		
		return
	end
	for _, requiredField in RequiredFields do
		local Value = requiredField.value
		
		if Value == nil or (Value == "" or (Value == 0 or Value == "0")) then
			LogCounterModule(GameItemDetailsMissingFieldCounterModule, 1, { itemType = p1.itemType, field = requiredField.name })
		end
	end
end