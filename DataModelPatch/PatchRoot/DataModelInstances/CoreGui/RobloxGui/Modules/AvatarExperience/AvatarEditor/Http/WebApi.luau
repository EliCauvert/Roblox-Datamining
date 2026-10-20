local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UrlModule = require(Modules.LuaApp.Http.Url)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(CorePackages.Workspace.Packages.Http)
local GetFFlagAXEnableNewInventoryItemsListModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter
local FFlagAXInventoryIncludeUnavailableItems = AvatarExperienceFlagsModule.FFlagAXInventoryIncludeUnavailableItems
local FFlagAXOutfitDetailsV4 = AvatarExperienceFlagsModule.FFlagAXOutfitDetailsV4
local _ = require(Modules.AvatarExperience.Common.Types)

local function _(p1, p2): string
	-- upvalues: FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), UrlModule (copy)
	local FFlagAXModeratedItemsFlow1 = FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables
	
	return if FFlagAXModeratedItemsFlow1 and p2 then `{UrlModule.AVATAR_URL}/v3/outfits/{p1}/details{`?{UrlModule:makeQueryString(p2)}`}` else string.format("%s/v3/outfits/%s/details", UrlModule.AVATAR_URL, p1)
end

local config = {
	headColor = "headColor3",
	torsoColor = "torsoColor3",
	leftArmColor = "leftArmColor3",
	rightArmColor = "rightArmColor3",
	leftLegColor = "leftLegColor3",
	rightLegColor = "rightLegColor3"
}

local function remapV4OutfitDetailsToV3(p1)
	-- upvalues: config (copy)
	local OutfitModel = if typeof(p1) == "table" then p1.outfitModel else nil
	
	if typeof(OutfitModel) ~= "table" then
		return nil
	end
	local Copy = table.clone(OutfitModel)
	local BackgroundAsset = p1.outfitConfigurations and (p1.outfitConfigurations.background and p1.outfitConfigurations.background.backgroundAsset)
	
	if BackgroundAsset and BackgroundAsset.id ~= nil then
		Copy.profileConfiguration = { backgroundAssetId = BackgroundAsset.id }
	end
	local BodyColors = OutfitModel.bodyColors
	
	if typeof(BodyColors) == "table" then
		local BodyColor3s = {}
		
		for i, value in config do
			BodyColor3s[value] = BodyColors[i]
		end
		Copy.bodyColors = nil
		Copy.bodyColor3s = BodyColor3s
	end
	return Copy
end

return {
	GetAvatarData = function(Callback, p2)
		-- upvalues: FFlagAXModeratedItemsFlow (copy), UrlModule (copy)
		return if FFlagAXModeratedItemsFlow and p2 then Callback(`{UrlModule.AVATAR_URL}/v2/avatar/avatar{`?{UrlModule:makeQueryString(p2)}`}`, "GET") else Callback(string.format("%s/v2/avatar/avatar", UrlModule.AVATAR_URL), "GET")
	end,
	GetOutfit = function(Callback, p2, p3)
		-- upvalues: FFlagAXOutfitDetailsV4 (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), UrlModule (copy), remapV4OutfitDetailsToV3 (copy)
		if FFlagAXOutfitDetailsV4 then
			local FFlagAXModeratedItemsFlow2 = FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables
			
			return Callback(if FFlagAXModeratedItemsFlow2 and p3 then `{UrlModule.AVATAR_URL}v4/outfits/{p2}/details?{UrlModule:makeQueryString(p3)}` else `{UrlModule.AVATAR_URL}v4/outfits/{p2}/details`, "GET"):andThen(function(Entry)
				-- upvalues: remapV4OutfitDetailsToV3 (upval)
				local RemapV4OutfitDetailsToVResult = remapV4OutfitDetailsToV3(if typeof(Entry) == "table" then Entry[1] else nil)
				
				if RemapV4OutfitDetailsToVResult == nil then
					error("WebApi.GetOutfit: v4 outfit-details response missing outfitModel")
				end
				return { RemapV4OutfitDetailsToVResult }
			end)
		else
			local FFlagAXModeratedItemsFlow1 = FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables
			
			return Callback(if FFlagAXModeratedItemsFlow1 and p3 then `{UrlModule.AVATAR_URL}/v3/outfits/{p2}/details{`?{UrlModule:makeQueryString(p3)}`}` else string.format("%s/v3/outfits/%s/details", UrlModule.AVATAR_URL, p2), "GET")
		end
	end,
	GetRecommendations = function(Callback, p2, p3, p4)
		-- upvalues: ConstantsModule (copy), UrlModule (copy)
		return Callback(string.format(if p3 then "%s/v2/recommendations/user-inventory?assetTypeId=%s&%s" else "%s/v2/recommendations/user-inventory?bundleTypeId=%s&%s", UrlModule.CATALOG_URL, p2, (UrlModule:makeQueryString({
			details = true,
			numItems = if p4 then p4 else ConstantsModule.NumRecommendedItems
		}))), "GET")
	end,
	GetMySharedAvatars = function(Callback, p2, p3)
		-- upvalues: UrlModule (copy)
		return Callback(string.format("%s/look-api/v1/users/%s/looks?limit=50&cursor=%s", UrlModule.APIS_URL, p2, p3 or ""), "GET")
	end,
	GetRemoteUpranked = function(Callback, p2, UnsavedItems)
		-- upvalues: UrlModule (copy)
		return Callback(`{UrlModule.AVATAR_URL}v1/users/{p2}/currently-wearing-outfits?{UrlModule:makeQueryString({ unsavedItems = UnsavedItems })}`, "GET")
	end,
	GetUserAvatarInventory = function(Callback, List, SortOption, PageLimit, PageToken, p2)
		-- upvalues: GetFFlagAXEnableNewInventoryItemsListModule (copy), FFlagAXInventoryDurablesExpiredFilter (copy), FFlagAXInventoryIncludeUnavailableItems (copy), UrlModule (copy)
		if GetFFlagAXEnableNewInventoryItemsListModule() then
			local config = {
				pageLimit = PageLimit,
				sortOption = SortOption,
				pageToken = PageToken,
				availabilityStatus = if FFlagAXInventoryDurablesExpiredFilter then p2 else nil,
				includeUnavailableItems = if FFlagAXInventoryIncludeUnavailableItems then true else nil
			}
			
			for i, value in List do
				local v1 = i - 1
				config[`itemCategories[{v1}].itemType`] = value.itemType
				config[`itemCategories[{v1}].itemSubType`] = tostring(value.itemSubType)
			end
			return Callback(`{UrlModule.AVATAR_URL}v1/avatar-inventory?{UrlModule:makeQueryString(config)}`, "GET")
		else
			local Text = ""
			
			for i1, value1 in List do
				local v2 = i1 - 1
				Text ..= `&itemCategories[{v2}].itemType={value1.itemType}` .. `&itemCategories[{v2}].itemSubType={value1.itemSubType}`
			end
			local IncludeUnavailableItemsTrue: string = if FFlagAXInventoryIncludeUnavailableItems then "&includeUnavailableItems=true" else ""
			
			return Callback(if FFlagAXInventoryDurablesExpiredFilter then `{UrlModule.AVATAR_URL}v1/avatar-inventory?pageLimit={PageLimit}&sortOption={SortOption}&pageToken={PageToken}{Text}{if p2 then `&availabilityStatus={p2}` else ""}{IncludeUnavailableItemsTrue}` else `{UrlModule.AVATAR_URL}v1/avatar-inventory?pageLimit={PageLimit}&sortOption={SortOption}&pageToken={PageToken}{Text}{IncludeUnavailableItemsTrue}`, "GET")
		end
	end,
	GetPreviewLook = function(Callback, Assets)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%slook-api/v1/looks/preview", UrlModule.APIS_URL), "POST", { postBody = HttpService:JSONEncode({ assets = Assets }) })
	end,
	CreateLook = function(Callback, Assets, p3)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%slook-api/v1/looks/create", UrlModule.APIS_URL), "POST", {
			postBody = HttpService:JSONEncode({
				assets = Assets,
				name = p3.name,
				description = p3.description,
				displayProperties = p3.displayProperties,
				avatarProperties = p3.avatarProperties
			})
		})
	end
}