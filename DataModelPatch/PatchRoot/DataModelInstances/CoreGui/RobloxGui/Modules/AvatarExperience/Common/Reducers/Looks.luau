local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local DashModule = require(CorePackages.Packages.Dash)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local GetFFlagEnableLookFavoritingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableLookFavoriting)
local _ = require(Modules.AvatarExperience.Common.Types)
local t = {}

local function _(List)
	local t = {}
	
	if List then
		for _, value in List do
			t[tostring(value.id)] = value
		end
	end
	return t
end

return require(CorePackages.Packages.Rodux).createReducer(t, {
	[require(Modules.AvatarExperience.Common.Actions.AddLookDetails).name] = function(p1, p2)
		-- upvalues: t (copy), GetFFlagEnableLookFavoritingModule (copy), CryoModule (copy)
		local T = if p1 then p1 else t
		local t1 = {}
		local LookId = p2.lookId
		local config = {
			lookType = p2.lookType,
			totalValue = p2.totalValue,
			totalPrice = p2.totalPrice,
			totalPremiumPrice = p2.totalPremiumPrice
		}
		local LookAssetInfos = p2.lookAssetInfos
		local LookAssetInfos1 = {}
		
		if LookAssetInfos then
			for _, lookAssetInfo in LookAssetInfos do
				LookAssetInfos1[tostring(lookAssetInfo.id)] = lookAssetInfo
			end
		end
		config.lookAssetInfos = LookAssetInfos1
		local LookBundleInfos = p2.lookBundleInfos
		local LookBundleInfos1 = {}
		
		if LookBundleInfos then
			for _, lookBundleInfo in LookBundleInfos do
				LookBundleInfos1[tostring(lookBundleInfo.id)] = lookBundleInfo
			end
		end
		config.lookBundleInfos = LookBundleInfos1
		config.curator = p2.curator
		config.description = p2.description
		config.moderationStatus = p2.moderationStatus
		config.name = p2.name
		config.displayProperties = p2.displayProperties
		config.favoriteCount = if GetFFlagEnableLookFavoritingModule() then p2.favoriteCount else nil
		config.isFavorited = if GetFFlagEnableLookFavoritingModule() then p2.isFavorited else nil
		config.lookDiscounts = p2.lookDiscounts
		t1[LookId] = config
		
		return CryoModule.Dictionary.join(T, t1)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetLookFavorite).name] = function(p3, p4)
		-- upvalues: t (copy), CryoModule (copy)
		local T = if p3 then p3 else t
		local Entry = T[p4.lookId] or {}
		
		return CryoModule.Dictionary.join(T, {
			[p4.lookId] = CryoModule.Dictionary.join(Entry, {
				favoriteCount = Entry.favoriteCount,
				isFavorited = p4.isFavorited
			})
		})
	end,
	[require(Modules.AvatarExperience.Common.Actions.UpdateLookDetails).name] = function(p3, p4)
		-- upvalues: t (copy), CryoModule (copy)
		local T = if p3 then p3 else t
		
		return CryoModule.Dictionary.join(T, {
			[p4.lookId] = CryoModule.Dictionary.join(T[p4.lookId] or {}, p4.lookDetails)
		})
	end,
	[require(Modules.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase).name] = function(p3, p4)
		-- upvalues: t (copy), DashModule (copy), CryoModule (copy)
		local T = if p3 then p3 else t
		local v1 = if p3 then p3[p4.lookId] else nil
		
		if v1 == nil then
			return T
		end
		assert(v1, "")
		local TotalPrice = v1.totalPrice or 0
		local TotalPremiumPrice = v1.totalPremiumPrice or 0
		local LookAssetInfos = v1.lookAssetInfos
		local LookBundleInfos = v1.lookBundleInfos
		
		if LookAssetInfos == nil then
			warn("Looks asset info does not exist")
			
			return T
		end
		for _, purchasedAssetId in p4.purchasedAssetIds do
			local Text = tostring(purchasedAssetId)
			local LookAssetInfo = LookAssetInfos[Text]
			
			if LookAssetInfo == nil then
				warn("Looks reducer could not find asset with id", Text)
			else
				LookAssetInfos[Text].quantityOwned = LookAssetInfo.quantityOwned + 1
				TotalPrice -= LookAssetInfo.priceInRobux or 0
				TotalPremiumPrice -= LookAssetInfo.premiumPriceInRobux or 0
			end
		end
		if LookBundleInfos and p4.purchasedBundleIds then
			for _, purchasedBundleId in p4.purchasedBundleIds do
				local Text = tostring(purchasedBundleId)
				local LookBundleInfo = LookBundleInfos[Text]
				
				if LookBundleInfo == nil then
					warn("Looks reducer could not find bundle with id", Text)
				else
					LookBundleInfos[Text].quantityOwned = LookBundleInfo.quantityOwned + 1
					TotalPrice -= LookBundleInfo.priceInRobux or 0
				end
			end
		end
		if TotalPrice < 0 then
			warn("Looks total price is below 0 after manual calculation")
			TotalPrice = 0
		end
		if TotalPremiumPrice < 0 then
			warn("Looks total premium price is below 0 after manual calculation")
			TotalPremiumPrice = 0
		end
		local config = {
			[p4.lookId] = {
				totalPrice = TotalPrice,
				totalPremiumPrice = TotalPremiumPrice,
				lookAssetInfos = LookAssetInfos,
				lookBundleInfos = LookBundleInfos
			}
		}
		local IsOwnedAfterPurchase = p4.isOwnedAfterPurchase
		
		if IsOwnedAfterPurchase then
			config[p4.lookId].owned = IsOwnedAfterPurchase
		end
		return CryoModule.Dictionary.join(T, {
			[p4.lookId] = DashModule.joinDeep(v1, config[p4.lookId])
		})
	end,
	[require(Modules.AvatarExperience.Common.Actions.RemoveLook).name] = function(p5, p6)
		-- upvalues: t (copy)
		local Copy = table.clone(if p5 then p5 else t)
		Copy[p6.lookId] = nil
		
		return Copy
	end
})