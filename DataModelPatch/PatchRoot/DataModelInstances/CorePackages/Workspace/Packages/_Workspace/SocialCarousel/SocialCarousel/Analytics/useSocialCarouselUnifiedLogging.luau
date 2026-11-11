local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ImpressionsModule = require(Parent.Impressions)
local Tile = require(SocialCarousel.Common.Enums).Tile
local TopicContentsReducer = require(Parent.TopicContentsRodux).TopicContentsReducer
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseCollectionImpressionsSignalFunction = require(Parent.CollectionViews).useCollectionImpressionsSignal
local ScreenSizeImpressionsTracker = ImpressionsModule.ScreenSizeImpressionsTracker
local FrameBoundsImpressionsTracker = ImpressionsModule.FrameBoundsImpressionsTracker
local ImpressionsTagUtility = ImpressionsModule.ImpressionsTagUtility
local SendItemImpressions = require(Parent.UnifiedLogging).SendItemImpressions
local FFlagLuaAppUseFrameBoundsImpressions = require(Parent.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions

return function(p1, p2, p3, p4, p5)
	-- upvalues: UseCollectionImpressionsSignalFunction (copy), ReactModule (copy), CryoModule (copy), Tile (copy), SendItemImpressions (copy), UseSelectorFunction (copy), TopicContentsReducer (copy), ImpressionsTagUtility (copy), FFlagLuaAppUseFrameBoundsImpressions (copy), FrameBoundsImpressionsTracker (copy), ScreenSizeImpressionsTracker (copy)
	if p4 and p4.tiles and p3 then
		local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction(p3.scrollViewPositionChangedSignal)
		local UseResult = ReactModule.useCallback(function(p6)
			-- upvalues: CryoModule (upval), p4 (copy), Tile (upval), SendItemImpressions (upval), p2 (copy), p1 (copy), p3 (copy)
			SendItemImpressions.sendFromFriendsCarousel(p2, p1, p6, CryoModule.Dictionary.map(p4.tiles, function(p7)
				-- upvalues: CryoModule (upval), Tile (upval)
				return CryoModule.Dictionary.join(p7, { isFriend = p7.tileType == Tile.Friend })
			end), p3.appPage, p3.sortIndex, p3.sortId, p3.impressionTag)
		end, {
			p2, p1, p4.tiles, p3.appPage, p3.sortIndex, p3.sortId, p3.impressionTag
		})
		local UseSelectorResult = UseSelectorFunction(function(p6)
			-- upvalues: p3 (copy), TopicContentsReducer (upval)
			return if p3.sortId then p6.Personalization and (p6.Personalization[TopicContentsReducer.key] and (p6.Personalization[TopicContentsReducer.key][p3.sortId] and p6.Personalization[TopicContentsReducer.key][p3.sortId].updatedTimestamp)) else nil
		end)
		ReactModule.useEffect(function()
			-- upvalues: UseSelectorResult (copy), p5 (copy)
			if UseSelectorResult then
				p5.current = UseSelectorResult
			end
		end, { UseSelectorResult })
		
		return {
			onCollectionViewabilityChanged = UseCollectionImpressionsSignalResult2,
			tagTileForImpressions = ReactModule.useCallback(function(p6, p7)
				-- upvalues: ImpressionsTagUtility (upval), p3 (copy)
				ImpressionsTagUtility.AddTag(p6, p3.impressionTag, p7)
				
				return function()
					-- upvalues: ImpressionsTagUtility (upval), p6 (copy), p3 (upval), p7 (copy)
					ImpressionsTagUtility.RemoveTag(p6, p3.impressionTag, p7)
				end
			end, { p3.impressionTag }),
			renderImpressionsTrackerComponent = ReactModule.useCallback(function(ParentRef)
				-- upvalues: ReactModule (upval), FFlagLuaAppUseFrameBoundsImpressions (upval), FrameBoundsImpressionsTracker (upval), ScreenSizeImpressionsTracker (upval), p3 (copy), UseCollectionImpressionsSignalResult (copy), UseResult (copy), p5 (copy)
				return ReactModule.createElement(if FFlagLuaAppUseFrameBoundsImpressions then FrameBoundsImpressionsTracker else ScreenSizeImpressionsTracker, {
					pageContext = p3.appPage,
					parentRef = ParentRef,
					impressionsTag = p3.impressionTag,
					scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
					sendImpressions = UseResult,
					dataUpdatedTimestamp = p5.current
				})
			end, {
				p3.impressionTag,
				UseCollectionImpressionsSignalResult,
				p3.appPage,
				UseResult
			})
		}
	else
		return nil
	end
end