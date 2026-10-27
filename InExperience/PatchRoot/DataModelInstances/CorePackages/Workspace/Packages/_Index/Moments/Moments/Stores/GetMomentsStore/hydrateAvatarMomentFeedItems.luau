local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local FFlagMomentsRenderAvatarPostsInFeed = require(Parent.SharedFlags).FFlagMomentsRenderAvatarPostsInFeed
local _ = require(Moments.Components.Feed.FeedTypes)
local DeriveMomentFromPostModule = require(Moments.Utils.deriveMomentFromPost)
local Analytics = require(Parent.MomentsCommon).Analytics

local function getAvatarPostPayload(DataResult)
	local v1 = nil
	local v2: number? = nil
	local Tracks = DataResult.tracks or {}
	for _, track in Tracks do
		local Slots = track.slots or {}
		for _, slot in Slots do
			local Content = slot.content
			
			if Content ~= nil then
				if Content.type == "avatar_annotation" then
					local OutfitId: number = Content.value.outfit_id
					
					if typeof(OutfitId) == "number" and OutfitId > 0 then
						v2 = OutfitId
					end
				elseif Content.type == "visual" then
					local Content1 = Content.value.content
					
					if Content1 ~= nil and Content1.type == "scene" then
						local RbxmData = Content1.value.rbxm_data
						
						if typeof(RbxmData) == "buffer" and buffer.len(RbxmData) > 0 then
							v1 = RbxmData
						end
					end
				end
			end
		end
	end
	return v1, v2
end

local function classifyPost(Item, DataResult, RbxmData, Id)
	-- upvalues: DeriveMomentFromPostModule (copy)
	local DeriveMomentFromPostModuleResult = DeriveMomentFromPostModule(Item.moment, DataResult) or Item.moment
	
	if DeriveMomentFromPostModuleResult == Item.moment then
		local Metadata = DataResult.metadata
		
		if Metadata ~= nil and typeof(Metadata.caption) == "string" and Metadata.caption ~= "" then
			DeriveMomentFromPostModuleResult = table.clone(DeriveMomentFromPostModuleResult)
			DeriveMomentFromPostModuleResult.metadata = table.clone(Item.moment.metadata)
			DeriveMomentFromPostModuleResult.metadata.description = Metadata.caption
		end
	end
	return {
		kind = "avatarMoment",
		moment = DeriveMomentFromPostModuleResult,
		outfit = { source = { type = "outfit", id = Id } },
		rbxmData = RbxmData
	}
end

local function hydrateAvatarMomentFeedItemsImpl(Tbl, p1)
	-- upvalues: Analytics (copy), getAvatarPostPayload (copy), classifyPost (copy)
	local Copy = table.clone(Tbl)
	local t = {}
	
	for i, Item in Tbl do
		if Item.kind == "moment" then
			local PostAsset = Item.moment.postAsset
			
			if PostAsset ~= nil and PostAsset.isAvatar == true then
				local PostAssetId: number = PostAsset.postAssetId
				
				if typeof(PostAssetId) == "number" and PostAssetId > 0 then
					Copy[i] = nil
					local Success, Result = pcall(p1.getAndFetchPostAsset, PostAssetId)
					
					if Success then
						t[i] = { item = Item, postAssetId = PostAssetId, result = Result }
					else
						Analytics.fireAnalyticsEvent(Analytics.EventNames.AvatarMomentLoadFailed, {
							stage = "fetchPostAsset",
							momentId = Item.moment.momentId,
							feedItemId = Item.moment.recommendationMetadata.feedItemId,
							postAssetId = tostring(PostAssetId)
						})
					end
				else
					Analytics.fireAnalyticsEvent(Analytics.EventNames.AvatarMomentLoadFailed, {
						stage = "validatePostAssetId",
						momentId = Item.moment.momentId,
						feedItemId = Item.moment.recommendationMetadata.feedItemId
					})
				end
			end
		end
	end
	for i1, value in t do
		local Item1 = value.item
		local PostAssetId = value.postAssetId
		local Result1 = value.result
		local Stage = "loadPostAsset"
		local Success1, Result2 = pcall(function()
			-- upvalues: Result1 (copy), Stage (ref), getAvatarPostPayload (upval), classifyPost (upval), Item1 (copy)
			local StatusResult = Result1.status(false)
			while StatusResult == "NotReady" do
				task.wait()
				StatusResult = Result1.status(false)
			end
			local DataResult = Result1.data(false)
			
			if DataResult == nil then
				return nil
			end
			Stage = "extractAvatarPostPayload"
			local AvatarPostPayload, AvatarPostPayload2 = getAvatarPostPayload(DataResult)
			
			if AvatarPostPayload == nil then
				Stage = "findInlineScene"
				
				return nil
			elseif AvatarPostPayload2 == nil then
				Stage = "findOutfitAnnotation"
				
				return nil
			else
				Stage = "classifyAvatarPost"
				
				return (classifyPost(Item1, DataResult, AvatarPostPayload, AvatarPostPayload2))
			end
		end)
		
		if Success1 and Result2 ~= nil then
			Copy[i1] = Result2
		else
			Analytics.fireAnalyticsEvent(Analytics.EventNames.AvatarMomentLoadFailed, {
				stage = Stage,
				momentId = Item1.moment.momentId,
				feedItemId = Item1.moment.recommendationMetadata.feedItemId,
				postAssetId = tostring(PostAssetId)
			})
		end
	end
	local List = {}
	
	for i2 = 1, #Tbl do
		local Entry = Copy[i2]
		
		if Entry ~= nil then
			table.insert(List, Entry)
		end
	end
	return List
end

return function(p2, p3)
	-- upvalues: FFlagMomentsRenderAvatarPostsInFeed (copy), hydrateAvatarMomentFeedItemsImpl (copy)
	return if FFlagMomentsRenderAvatarPostsInFeed then hydrateAvatarMomentFeedItemsImpl(p2, p3) else p2
end