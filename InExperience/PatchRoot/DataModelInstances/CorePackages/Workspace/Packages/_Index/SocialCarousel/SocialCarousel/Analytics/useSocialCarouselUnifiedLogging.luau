local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local roactUtilsModule = require(parent.RoactUtils)
local collectionViewsModule = require(parent.CollectionViews)
local unifiedLoggingModule = require(parent.UnifiedLogging)
local impressionsModule = require(parent.Impressions)
local sharedFlagsModule = require(parent.SharedFlags)
local tile = require(socialCarousel.Common.Enums).Tile
local topicContentsReducer = require(parent.TopicContentsRodux).TopicContentsReducer
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useCollectionImpressionsSignal = collectionViewsModule.useCollectionImpressionsSignal
local screenSizeImpressionsTracker = impressionsModule.ScreenSizeImpressionsTracker
local frameBoundsImpressionsTracker = impressionsModule.FrameBoundsImpressionsTracker
local impressionsTagUtility = impressionsModule.ImpressionsTagUtility
local sendItemImpressions = unifiedLoggingModule.SendItemImpressions
local fFlagLuaAppHomeFriendsRemoveItemImpressions = sharedFlagsModule.FFlagLuaAppHomeFriendsRemoveItemImpressions
local fFlagLuaAppUseFrameBoundsImpressions = sharedFlagsModule.FFlagLuaAppUseFrameBoundsImpressions

return function(p1, p2, p3, p4, p5)
	-- upvalues: useCollectionImpressionsSignal (ref), reactModule (ref), fFlagLuaAppHomeFriendsRemoveItemImpressions (ref), cryoModule (ref), tile (ref), sendItemImpressions (ref), useSelector (ref), topicContentsReducer (ref), impressionsTagUtility (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref)
	if p4 and p4.tiles and p3 then
		local var1, var2 = useCollectionImpressionsSignal(p3.scrollViewPositionChangedSignal)
		local var3 = reactModule.useCallback(function(p6)
			-- upvalues: fFlagLuaAppHomeFriendsRemoveItemImpressions (copy), p3 (ref), cryoModule (copy), p4 (ref), tile (copy), sendItemImpressions (copy), p2 (ref), p1 (ref)
			if fFlagLuaAppHomeFriendsRemoveItemImpressions and p3.skipItemImpressionsLog then
				return
			end
			sendItemImpressions.sendFromFriendsCarousel(p2, p1, p6, cryoModule.Dictionary.map(p4.tiles, function(p7)
				-- upvalues: cryoModule (copy), tile (copy)
				return cryoModule.Dictionary.join(p7, { isFriend = p7.tileType == tile.Friend })
			end), p3.appPage, p3.sortIndex, p3.sortId, p3.impressionTag)
		end, {
			p2, p1, p4.tiles, p3.appPage, p3.sortIndex, p3.sortId, p3.impressionTag,
			if fFlagLuaAppHomeFriendsRemoveItemImpressions then p3.skipItemImpressionsLog else nil
		})
		local var4 = useSelector(function(p6)
			-- upvalues: p3 (ref), topicContentsReducer (copy)
			return if p3.sortId then p6.Personalization and (p6.Personalization[topicContentsReducer.key] and (p6.Personalization[topicContentsReducer.key][p3.sortId] and p6.Personalization[topicContentsReducer.key][p3.sortId].updatedTimestamp)) else nil
		end)
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), p5 (ref)
			if var4 then
				p5.current = var4
			end
		end, { var4 })
		
		return {
			onCollectionViewabilityChanged = var2,
			tagTileForImpressions = reactModule.useCallback(function(p6, p7)
				-- upvalues: impressionsTagUtility (copy), p3 (ref)
				impressionsTagUtility.AddTag(p6, p3.impressionTag, p7)
				
				return function()
					-- upvalues: impressionsTagUtility (copy), p6 (ref), p3 (copy), p7 (ref)
					impressionsTagUtility.RemoveTag(p6, p3.impressionTag, p7)
				end
			end, { p3.impressionTag }),
			renderImpressionsTrackerComponent = reactModule.useCallback(function(p6)
				-- upvalues: reactModule (copy), fFlagLuaAppUseFrameBoundsImpressions (copy), frameBoundsImpressionsTracker (copy), screenSizeImpressionsTracker (copy), p3 (ref), var1 (ref), var3 (ref), p5 (ref)
				return reactModule.createElement(if fFlagLuaAppUseFrameBoundsImpressions then frameBoundsImpressionsTracker else screenSizeImpressionsTracker, {
					pageContext = p3.appPage,
					parentRef = p6,
					impressionsTag = p3.impressionTag,
					scrollViewPositionChangedSignal = var1,
					sendImpressions = var3,
					dataUpdatedTimestamp = p5.current
				})
			end, { p3.impressionTag, var1, p3.appPage, var3 })
		}
	end
	return nil
end