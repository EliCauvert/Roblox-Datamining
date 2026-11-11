local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local ResultModule = require(Parent.Result)
local CryoModule = require(Parent.Cryo)
local GameInfoModel = require(Parent.GameModels).GameInfoModel
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local OmniRecommendationsContentType = DiscoveryTypesModule.OmniRecommendationsContentType
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes
local OmniRecommendationsPageType = require(Parent.DiscoveryUtils).OmniRecommendationsPageType
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagLuaAppAddSubIdToHomeEvents = require(Parent.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents
local FFlagEnableSduiV2HomeInterleave = require(Parent.SharedFlags).FFlagEnableSduiV2HomeInterleave
local OmniRecommendationsModule = {
	new = function()
		return {}
	end
}

function OmniRecommendationsModule.mock()
	-- upvalues: OmniRecommendationsModule (copy), AppPage (copy), GameInfoModel (copy), OmniRecommendationsContentType (copy), OmniFeedTypes (copy)
	local NewOmniRecommendations = OmniRecommendationsModule.new()
	NewOmniRecommendations.pageType = AppPage.Home
	NewOmniRecommendations.nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0="
	NewOmniRecommendations.isSessionExpired = false
	NewOmniRecommendations.sorts = {
		{
			topic = "topic1",
			topicId = "100000003",
			numberOfRows = -1,
			recommendations = {
				{
					contentType = OmniRecommendationsContentType.Game,
					contentId = GameInfoModel.mock().universeId
				}
			},
			treatmentType = OmniFeedTypes.Carousel
		}
	}
	NewOmniRecommendations.recommendationsId = "3d14d9e6-cea3-4eec-bcdc-cfdc906f61cb"
	NewOmniRecommendations.omniSessionId = "d3240862-f901-419c-8780-5160e05d8473"
	
	return NewOmniRecommendations
end

function OmniRecommendationsModule.mockEndpointResponse(p1)
	-- upvalues: OmniRecommendationsContentType (copy), OmniFeedTypes (copy), OmniRecommendationsPageType (copy)
	local config = {
		rootPlaceId = "10395446",
		universeId = "149757",
		name = "test",
		totalUpVotes = 10970,
		totalDownVotes = 2564,
		playerCount = 5,
		under9 = true,
		under13 = false,
		friendActivityTitle = "Friend Activity",
		minimumAge = 0,
		ageRecommendationDisplayName = "All Ages",
		friendVisitedString = "1 Friend visited",
		primaryWideAssetId = "12046435434",
		friendVisits = { { userId = "1894536079" } },
		defaultLayoutData = {
			footer = { type = "TextLabel", textLiteral = "This is footer text" }
		},
		layoutDataBySort = {
			["500000000"] = {
				footer = {
					type = "TextLabel",
					textLiteral = "This is a sort-level footer text"
				}
			}
		}
	}
	
	return {
		requestId = "123avcd3-1431-35bd-24db-452abcde65abf35",
		nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0=",
		isSessionExpired = false,
		contentMetadata = {
			[OmniRecommendationsContentType.Game] = { [config.universeId] = config }
		},
		sorts = {
			{
				topic = "Friends",
				topicId = 600000000,
				recommendationList = {},
				treatmentType = OmniFeedTypes.FriendCarousel
			},
			{
				topicId = 100000003,
				topic = p1 or "topic123",
				recommendationList = {
					{
						contentType = OmniRecommendationsContentType.Game,
						contentId = config.universeId
					}
				},
				treatmentType = OmniFeedTypes.Carousel
			}
		},
		pageType = OmniRecommendationsPageType.OmniRecommendationsPageType.PAGE_TYPE_HOME
	}
end

function OmniRecommendationsModule.fromJsonData(p1, p2)
	-- upvalues: OmniRecommendationsPageType (copy), ResultModule (copy), CryoModule (copy), FFlagLuaAppAddSubIdToHomeEvents (copy), FFlagEnableSduiV2HomeInterleave (copy)
	local t = {}
	local AppPage = OmniRecommendationsPageType.toAppPage(p1.pageType)
	
	if not AppPage then
		return ResultModule.error(`pageType {AppPage} for OmniRecommedations is not supported.`)
	end
	assert(AppPage, "always exists for linter")
	t.pageType = AppPage
	
	if p1.sortsRefreshInterval and p1.sortsRefreshInterval > 0 then
		t.sortsExpirationTime = tick() + p1.sortsRefreshInterval
	end
	t.nextPageToken = p1.nextPageToken
	t.isSessionExpired = p1.isSessionExpired
	t.recommendationsId = p1.requestId
	t.omniSessionId = p2 or "Invalid_OmniSessionId"
	t.sorts = CryoModule.List.map(p1.sorts, function(p3)
		-- upvalues: FFlagLuaAppAddSubIdToHomeEvents (upval), CryoModule (upval)
		return {
			topic = p3.topic,
			topicId = if p3.topicId then tostring(p3.topicId) else nil,
			subtitle = p3.subtitle,
			sortSubId = if FFlagLuaAppAddSubIdToHomeEvents then p3.subId else nil,
			analyticsData = p3.analyticsData,
			recommendations = if p3.recommendationList then CryoModule.List.map(p3.recommendationList, function(p4)
				return {
					contentType = p4.contentType,
					contentId = p4.contentId,
					contentStringId = p4.contentStringId,
					contentMetadata = p4.contentMetadata,
					analyticsData = p4.analyticsData
				}
			end) else nil,
			treatmentType = p3.treatmentType,
			numberOfRows = p3.numberOfRows and p3.numberOfRows or -1,
			topicLayoutData = p3.topicLayoutData,
			feedItemKey = p3.feedItemKey
		}
	end)
	t.globalLayoutData = p1.globalLayoutData or {}
	t.sdui = p1.sdui
	t.sduiv2 = if FFlagEnableSduiV2HomeInterleave then p1.sduiv2 else nil
	
	return ResultModule.success(t)
end

return OmniRecommendationsModule