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
local fFlagLuaAppUseFrameBoundsImpressions = sharedFlagsModule.FFlagLuaAppUseFrameBoundsImpressions

return function(p0, p1, p2, p3, p4) --[[ line: 29 ]]
	-- upvalues: useCollectionImpressionsSignal (ref), reactModule (ref), cryoModule (ref), tile (ref), sendItemImpressions (ref), useSelector (ref), topicContentsReducer (ref), impressionsTagUtility (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref)
	if p3 and p3.tiles and p2 then
		local var8, var9 = useCollectionImpressionsSignal(p2.scrollViewPositionChangedSignal)
		local var10 = reactModule.useCallback(function(p5) --[[ line: 44 ]]
			-- upvalues: cryoModule (copy), p3 (ref), tile (copy), sendItemImpressions (copy), p1 (ref), p0 (ref), p2 (ref)
			sendItemImpressions.sendFromFriendsCarousel(p1, p0, p5, cryoModule.Dictionary.map(p3.tiles, function(p6) --[[ line: 45 ]]
				-- upvalues: cryoModule (copy), tile (copy)
				return cryoModule.Dictionary.join(p6, { isFriend = p6.tileType == tile.Friend })
			end), p2.appPage, p2.sortIndex, p2.sortId, p2.impressionTag)
		end, {
			p1, p0, p3.tiles, p2.appPage, p2.sortIndex, p2.sortId, p2.impressionTag
		})
		local var11 = useSelector(function(p7) --[[ line: 71 ]]
			-- upvalues: p2 (ref), topicContentsReducer (copy)
			return if p2.sortId then p7.Personalization and (p7.Personalization[topicContentsReducer.key] and (p7.Personalization[topicContentsReducer.key][p2.sortId] and p7.Personalization[topicContentsReducer.key][p2.sortId].updatedTimestamp)) else nil
		end)
		reactModule.useEffect(function() --[[ line: 82 ]]
			-- upvalues: var11 (ref), p4 (ref)
			if var11 then
				p4.current = var11
			end
		end, { var11 })
		
		return {
			onCollectionViewabilityChanged = var9,
			tagTileForImpressions = reactModule.useCallback(function(p8, p9) --[[ line: 88 ]]
				-- upvalues: impressionsTagUtility (copy), p2 (ref)
				impressionsTagUtility.AddTag(p8, p2.impressionTag, p9)
				
				return function() --[[ line: 91 ]]
					-- upvalues: impressionsTagUtility (copy), p8 (ref), p2 (copy), p9 (ref)
					impressionsTagUtility.RemoveTag(p8, p2.impressionTag, p9)
				end
			end, { p2.impressionTag }),
			renderImpressionsTrackerComponent = reactModule.useCallback(function(p10) --[[ line: 99 ]]
				-- upvalues: reactModule (copy), fFlagLuaAppUseFrameBoundsImpressions (copy), frameBoundsImpressionsTracker (copy), screenSizeImpressionsTracker (copy), p2 (ref), var8 (ref), var10 (ref), p4 (ref)
				return reactModule.createElement(if fFlagLuaAppUseFrameBoundsImpressions then frameBoundsImpressionsTracker else screenSizeImpressionsTracker, {
					pageContext = p2.appPage,
					parentRef = p10,
					impressionsTag = p2.impressionTag,
					scrollViewPositionChangedSignal = var8,
					sendImpressions = var10,
					dataUpdatedTimestamp = p4.current
				})
			end, { p2.impressionTag, var8, p2.appPage, var10 })
		}
	end
	return nil
end