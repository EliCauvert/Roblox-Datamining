local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes
local FFlagLuaAppPropagateFriendsCarouselHeader = require(Parent.SharedFlags).FFlagLuaAppPropagateFriendsCarouselHeader
local FFlagSearchOmniAutocompletePage = require(Parent.SharedFlags).FFlagSearchOmniAutocompletePage
local FFlagLuaAppAddRequestIdToRfySignalApportioning = require(Parent.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning
local FFlagLuaAppRfyRevealRows = require(Parent.SharedFlags).FFlagLuaAppRfyRevealRows
local FFlagEnableSduiV2HomeInterleave = require(Parent.SharedFlags).FFlagEnableSduiV2HomeInterleave
local FeedItemModelModule = {
	fromLocalData = function(OrderHint, TreatmentType, TreatmentProps, p1)
		-- upvalues: DiscoveryTypesModule (copy)
		return {
			orderHint = OrderHint,
			treatmentType = TreatmentType,
			treatmentProps = TreatmentProps,
			numberOfRows = p1 or 1,
			dataSource = DiscoveryTypesModule.DataSourceType.Local
		}
	end,
	fromGamesApi = function(SortIndex, SortName, TopicLayoutData)
		-- upvalues: OmniFeedTypes (copy), DiscoveryTypesModule (copy)
		return {
			numberOfRows = 1,
			treatmentType = OmniFeedTypes.Carousel,
			itemId = { sortName = SortName, sortIndex = SortIndex },
			treatmentProps = {
				isOmni = false,
				sortIndex = SortIndex,
				topicLayoutData = TopicLayoutData
			},
			dataSource = DiscoveryTypesModule.DataSourceType.GamesApi
		}
	end,
	fromExploreTopicInfo = function(SortIndex, p1, PageSection)
		-- upvalues: DiscoveryTypesModule (copy), OmniFeedTypes (copy)
		local config = {
			numberOfRows = 1,
			treatmentType = p1.treatmentType,
			itemId = { sortName = p1.name, sortIndex = SortIndex },
			dataSource = DiscoveryTypesModule.DataSourceType.ExploreApi,
			pageSection = PageSection
		}
		
		if p1.treatmentType == OmniFeedTypes.Pills then
			config.treatmentProps = {
				isOmni = false,
				sortIndex = SortIndex,
				gameSortId = p1.name,
				topicName = p1.displayName,
				topicLayoutData = p1.topicLayoutData
			}
			
			return config
		else
			config.treatmentProps = {
				isOmni = false,
				sortIndex = SortIndex,
				topicLayoutData = p1.topicLayoutData
			}
			
			return config
		end
	end,
	fromDiscoveryApi = function(SortIndex, TreatmentProps, p1)
		-- upvalues: DiscoveryTypesModule (copy), OmniFeedTypes (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (copy), FFlagLuaAppRfyRevealRows (copy), FFlagLuaAppPropagateFriendsCarouselHeader (copy), FFlagEnableSduiV2HomeInterleave (copy)
		local TreatmentType = TreatmentProps.treatmentType
		local config = {
			treatmentType = TreatmentType,
			numberOfRows = TreatmentProps.numberOfRows or 1,
			dataSource = DiscoveryTypesModule.DataSourceType.DiscoveryApi
		}
		
		if TreatmentType == OmniFeedTypes.Carousel or TreatmentType == OmniFeedTypes.AvatarCarousel then
			config.itemId = { topicId = TreatmentProps.topicId, sortIndex = SortIndex }
			config.treatmentProps = {
				isOmni = true,
				sortIndex = SortIndex,
				topicLayoutData = TreatmentProps.topicLayoutData
			}
			
			return config
		end
		if TreatmentType == OmniFeedTypes.HomeGameGrid then
			config.actualRenderedRows = -1
			config.itemId = { topicId = TreatmentProps.topicId, sortIndex = SortIndex }
			config.treatmentProps = {
				sortIndex = SortIndex,
				topicId = TreatmentProps.topicId,
				topicName = TreatmentProps.topic,
				topicLayoutData = TreatmentProps.topicLayoutData,
				numberOfRows = TreatmentProps.numberOfRows,
				recommendationsRequestId = if FFlagLuaAppAddRequestIdToRfySignalApportioning or FFlagLuaAppRfyRevealRows then p1 else nil
			}
			
			return config
		end
		if TreatmentType == OmniFeedTypes.JoinYourFriendsCarousel then
			config.treatmentProps = {
				topicId = TreatmentProps.topicId,
				topicLayoutData = TreatmentProps.topicLayoutData
			}
			
			return config
		end
		if TreatmentType == OmniFeedTypes.FriendCarousel then
			config.treatmentProps = {
				topic = if FFlagLuaAppPropagateFriendsCarouselHeader then TreatmentProps.topic else nil,
				topicId = TreatmentProps.topicId
			}
			
			return config
		end
		if TreatmentType == OmniFeedTypes.FriendRecommendationCarousel then
			config.treatmentProps = {
				sortIndex = SortIndex,
				carouselTitle = TreatmentProps.topic,
				topicId = TreatmentProps.topicId,
				topicLayoutData = TreatmentProps.topicLayoutData
			}
			
			return config
		end
		if TreatmentType == OmniFeedTypes.ServerDrivenUi or FFlagEnableSduiV2HomeInterleave and TreatmentType == OmniFeedTypes.ServerDrivenUiV2 then
			config.treatmentProps = {
				sortIndex = SortIndex,
				topicId = TreatmentProps.topicId,
				numberOfRows = TreatmentProps.numberOfRows,
				feedItemKey = TreatmentProps.feedItemKey
			}
			config.itemId = { topicId = TreatmentProps.topicId, sortIndex = SortIndex }
		end
		return config
	end,
	getUniqueNameForAnalytics = function(p1): string?
		-- upvalues: OmniFeedTypes (copy), FFlagEnableSduiV2HomeInterleave (copy)
		if not p1 then
			return nil
		end
		if not p1.treatmentType then
			return nil
		end
		if p1.treatmentType == OmniFeedTypes.Carousel then
			local ItemId = p1.itemId
			
			if ItemId.topicId then
				return "topicId:" .. ItemId.topicId .. "_" .. ItemId.sortIndex
			end
			if ItemId.sortName then
				return "sortId:" .. ItemId.sortName .. "_" .. ItemId.sortIndex
			end
		end
		if p1.treatmentType == OmniFeedTypes.HomeGameGrid then
			local ItemId = p1.itemId
			
			if ItemId.topicId then
				return "GameGrid_topicId:" .. ItemId.topicId .. "_" .. ItemId.sortIndex
			end
		end
		if p1.treatmentType == OmniFeedTypes.ServerDrivenUi then
			local ItemId = p1.itemId
			
			if ItemId.topicId then
				return "ServerDrivenUi_topicId:" .. ItemId.topicId .. "_" .. ItemId.sortIndex
			end
		end
		if FFlagEnableSduiV2HomeInterleave and p1.treatmentType == OmniFeedTypes.ServerDrivenUiV2 then
			local ItemId = p1.itemId
			
			if ItemId.topicId then
				return "ServerDrivenUiV2_topicId:" .. ItemId.topicId .. "_" .. ItemId.sortIndex
			end
		end
		return "type:" .. p1.treatmentType
	end
}

function FeedItemModelModule.getUniqueNameForFeed(p1)
	-- upvalues: FeedItemModelModule (copy)
	return FeedItemModelModule.getUniqueNameForAnalytics(p1)
end

function FeedItemModelModule.fromSearchApi(SearchUuid, TopicId, TreatmentType, SortIndex, TopicLayoutData)
	-- upvalues: DiscoveryTypesModule (copy), OmniFeedTypes (copy)
	local config = {
		treatmentType = TreatmentType,
		itemId = { topicId = TopicId, sortIndex = SortIndex },
		treatmentProps = {
			searchUuid = SearchUuid,
			topicId = TopicId,
			topicLayoutData = TopicLayoutData,
			sortIndex = SortIndex
		},
		dataSource = DiscoveryTypesModule.DataSourceType.SearchApi,
		numberOfRows = TopicLayoutData and TopicLayoutData.numOfRows or 1
	}
	
	if TreatmentType == OmniFeedTypes.SearchGameGrid or TreatmentType == OmniFeedTypes.UserSearchGrid then
		config.actualRenderedRows = -1
	end
	return config
end

if FFlagSearchOmniAutocompletePage then
	function FeedItemModelModule.fromOmniAutocompleteApi(SortIndex, TreatmentProps)
		-- upvalues: DiscoveryTypesModule (copy), OmniFeedTypes (copy)
		local TreatmentType = TreatmentProps.treatmentType
		local config = {
			treatmentType = TreatmentType,
			dataSource = DiscoveryTypesModule.DataSourceType.OmniAutocompleteApi,
			itemId = { topicId = TreatmentProps.sortId, sortIndex = SortIndex },
			numberOfRows = TreatmentProps.numberOfRows or 1
		}
		
		if TreatmentType == OmniFeedTypes.Carousel then
			config.treatmentProps = {
				isOmni = false,
				sortIndex = SortIndex,
				sortName = TreatmentProps.sortId,
				topicLayoutData = TreatmentProps.topicLayoutData
			}
			
			return config
		end
		if TreatmentType == OmniFeedTypes.SearchPillCarousel then
			config.treatmentProps = {
				isOmni = false,
				sortIndex = SortIndex,
				sortName = TreatmentProps.sortId,
				topicLayoutData = TreatmentProps.topicLayoutData
			}
		end
		return config
	end
end
function FeedItemModelModule.getNumberOfRows(p1)
	return if p1 then if p1.actualRenderedRows then if p1.actualRenderedRows >= 0 then p1.actualRenderedRows else nil else p1.numberOfRows else nil
end

return FeedItemModelModule