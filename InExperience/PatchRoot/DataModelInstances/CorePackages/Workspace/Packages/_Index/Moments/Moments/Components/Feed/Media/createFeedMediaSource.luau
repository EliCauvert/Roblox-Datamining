local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.Signals)
local _ = require(Parent.MomentsCommon)
local _ = require(Moments.Components.Feed.FeedTypes)
local FFlagMomentsModeratedMomentPageModule = require(Moments.Flags.FFlagMomentsModeratedMomentPage)
local FFlagMomentsRenderAvatarPostsInFeed = require(Parent.SharedFlags).FFlagMomentsRenderAvatarPostsInFeed
local FFlagMomentsServeEDPVideos = require(Parent.SharedFlags).FFlagMomentsServeEDPVideos
local GameGetPlayabilityStoreModule = if FFlagMomentsServeEDPVideos then require(Parent.DataHydration.GameGetPlayabilityStore) else nil
local IsVideoEligibleForPlayability = if FFlagMomentsServeEDPVideos then require(Parent.VideoUtils).isVideoEligibleForPlayability else nil
local ToMediaItemModule = require(script.Parent.toMediaItem)

local function _(p1): boolean
	-- upvalues: FFlagMomentsRenderAvatarPostsInFeed (copy)
	if FFlagMomentsRenderAvatarPostsInFeed and p1.kind == "avatarMoment" then
		return p1.moment.metadata ~= nil
	elseif p1.kind == "moment" then
		local Moment = p1.moment
		
		return Moment ~= nil and Moment.metadata ~= nil
	else
		return false
	end
end

return function(p1, GetPlaybackActive, GetCanAutoPlay)
	-- upvalues: FFlagMomentsServeEDPVideos (copy), FFlagMomentsRenderAvatarPostsInFeed (copy), GameGetPlayabilityStoreModule (copy), IsVideoEligibleForPlayability (copy), ToMediaItemModule (copy), FFlagMomentsModeratedMomentPageModule (copy)
	local T = if FFlagMomentsServeEDPVideos then {} else nil
	local Callback = if FFlagMomentsServeEDPVideos then function(p2, p3)
		-- upvalues: FFlagMomentsRenderAvatarPostsInFeed (upval), T (copy), GameGetPlayabilityStoreModule (upval), IsVideoEligibleForPlayability (upval)
		local HasMetadata = nil
		if FFlagMomentsRenderAvatarPostsInFeed and p2.kind == "avatarMoment" then
			HasMetadata = p2.moment.metadata ~= nil
		elseif p2.kind == "moment" then
			local Moment = p2.moment
			HasMetadata = Moment ~= nil and Moment.metadata ~= nil
		else
			HasMetadata = false
		end
		if not HasMetadata then
			return false
		end
		local Moment = p2.moment
		
		if Moment.entityType ~= "edpVideo" then
			return true
		end
		local UniverseId: number = Moment.metadata.universeId
		
		if UniverseId == nil or UniverseId <= 0 then
			return false
		end
		local Text = tostring(UniverseId)
		local Entry = T[Text]
		
		if Entry == nil then
			Entry = GameGetPlayabilityStoreModule(false).getPlayability(Text)
			T[Text] = Entry
		end
		return IsVideoEligibleForPlayability(Entry.status(p3) == "Ready", Entry.data(p3))
	end else nil
	
	local function v14(p2): number
		-- upvalues: p1 (copy), FFlagMomentsServeEDPVideos (upval), Callback (copy), FFlagMomentsRenderAvatarPostsInFeed (upval)
		local Items = p1.getItems(p2)
		local CurrentIndex: number = p1.getCurrentIndex(p2)
		local Count = 0
		
		for i = 1, math.min(CurrentIndex - 1, #Items) do
			local CallbackResult = nil
			if FFlagMomentsServeEDPVideos then
				CallbackResult = Callback(Items[i], p2)
			else
				local Item1 = Items[i]
				
				if FFlagMomentsRenderAvatarPostsInFeed and Item1.kind == "avatarMoment" then
					CallbackResult = Item1.moment.metadata ~= nil
				elseif Item1.kind == "moment" then
					local Moment = Item1.moment
					CallbackResult = Moment ~= nil and Moment.metadata ~= nil
				else
					CallbackResult = false
				end
			end
			if CallbackResult then
				Count += 1
			end
		end
		local Item = Items[CurrentIndex]
		
		if Item ~= nil then
			local CallbackResult = nil
			if FFlagMomentsServeEDPVideos then
				CallbackResult = Callback(Item, p2)
			elseif FFlagMomentsRenderAvatarPostsInFeed and Item.kind == "avatarMoment" then
				CallbackResult = Item.moment.metadata ~= nil
			elseif Item.kind == "moment" then
				local Moment = Item.moment
				CallbackResult = Moment ~= nil and Moment.metadata ~= nil
			else
				CallbackResult = false
			end
			if CallbackResult then
				return Count + 1
			end
		end
		return Count + 0.5
	end
	
	return {
		getActiveIndex = if FFlagMomentsModeratedMomentPageModule or FFlagMomentsServeEDPVideos then v14 else p1.getCurrentIndex,
		getItems = function(p3)
			-- upvalues: p1 (copy), FFlagMomentsServeEDPVideos (upval), Callback (copy), ToMediaItemModule (upval)
			local List = {}
			
			for _, value in p1.getItems(p3) do
				local Inverted: boolean = FFlagMomentsServeEDPVideos and not Callback(value, p3)
				local MediaItemModule = nil
				
				if not Inverted then
					MediaItemModule = ToMediaItemModule(value, { includeLocalTts = true })
					Inverted = MediaItemModule == nil
				end
				if not Inverted then
					table.insert(List, MediaItemModule)
				end
			end
			return List
		end,
		getPlaybackActive = GetPlaybackActive,
		getCanAutoPlay = GetCanAutoPlay
	}
end