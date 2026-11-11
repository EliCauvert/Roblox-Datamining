local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local TelemetryService = game:GetService("TelemetryService")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactAnalyticsCommonGameEvents = require(Parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local ContentType = require(Parent.UnifiedLogging).ContentType
local CryoModule = require(Parent.Cryo)
local SquareCollectionGridViewModule = require(ProfilePlatform.BaseComponents.CollectionGridViews.SquareCollectionGridView)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseRenderExperienceTileModule = require(ProfilePlatform.Hooks.Tiles.useRenderExperienceTile)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local FormatExperienceDetailsForImpressionsModule = require(ProfilePlatform.Hooks.formatExperienceDetailsForImpressions)
local UseGenerateImpressionsTagModule = require(ProfilePlatform.Hooks.useGenerateImpressionsTag)
local UseSendItemImpressionsModule = require(ProfilePlatform.Hooks.useSendItemImpressions)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local _ = require(ProfilePlatform.Common.Types)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseTextSizeOffsetFunction = require(Parent.Foundation).Hooks.useTextSizeOffset
local CommunityProfileAffiliatedExperienceTelemetryThrottlePermyriad = game:DefineFastInt("CommunityProfileAffiliatedExperienceTelemetryThrottlePermyriad", 0)

local function _(p1)
	return function(p2: number): number
		-- upvalues: p1 (copy)
		return p2 + 80 + p1 * 3
	end
end

return function(p1)
	-- upvalues: UseTextSizeOffsetFunction (copy), ReactModule (copy), UseProfileAnalyticsContextModule (copy), UseProfileWrapperContextModule (copy), UseRoactServiceFunction (copy), RoactAnalyticsCommonGameEvents (copy), UseGenerateImpressionsTagModule (copy), EnumsModule (copy), FormatExperienceDetailsForImpressionsModule (copy), UseSendItemImpressionsModule (copy), ContentType (copy), EventNamesModule (copy), CommunityProfileAffiliatedExperienceTelemetryThrottlePermyriad (copy), TelemetryService (copy), AppPage (copy), UseRenderExperienceTileModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), CryoModule (copy), SquareCollectionGridViewModule (copy)
	local ExperienceDetails = p1.experienceDetails
	local UseTextSizeOffsetResult = nil
	UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTextSizeOffsetResult (ref)
		local UseTextSizeOffsetResult1 = UseTextSizeOffsetResult
		
		return function(p2: number): number
			-- upvalues: UseTextSizeOffsetResult1 (copy)
			return p2 + 80 + UseTextSizeOffsetResult1 * 3
		end
	end, { UseTextSizeOffsetResult })
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalyticsCommonGameEvents)
	local UseGenerateImpressionsTagModuleResult = UseGenerateImpressionsTagModule(EnumsModule.Components.Experiences)
	local UseSendItemImpressionsModuleResult = UseSendItemImpressionsModule(ReactModule.useMemo(function()
		-- upvalues: FormatExperienceDetailsForImpressionsModule (upval), ExperienceDetails (copy)
		return FormatExperienceDetailsForImpressionsModule(ExperienceDetails)
	end, { ExperienceDetails }), 3, ContentType.Game, p1.layoutOrder, EnumsModule.Components.Experiences)
	local ProfileExperienceTile = UseRenderExperienceTileModule(UseGenerateImpressionsTagModuleResult, "ProfileExperienceTile", ReactModule.useCallback(function(p2, PositionInComponent, p3)
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), CommunityProfileAffiliatedExperienceTelemetryThrottlePermyriad (upval), UseProfileWrapperContextModuleResult (copy), TelemetryService (upval), ExperienceDetails (copy), UseRoactServiceResult (copy), AppPage (upval), p1 (copy)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ExperienceOpened, {
			experienceId = p2.experienceId,
			positionInComponent = PositionInComponent
		})
		TelemetryService:LogEvent({
			eventName = "communityAffiliatedExperienceClick",
			description = "Event fired from the client every time an experience is clicked from a community profile",
			links = "https://github.rbx.com/Roblox/proto-schemas/pull/6250",
			backends = { "EventIngest" },
			throttlingPercentage = CommunityProfileAffiliatedExperienceTelemetryThrottlePermyriad,
			lastUpdated = { 25, 6, 5 }
		}, {
			customFields = {
				affiliationType = "owner",
				community_id = UseProfileWrapperContextModuleResult.profileId,
				place_id = p2.rootPlaceId,
				universe_id = p2.experienceId
			}
		})
		UseRoactServiceResult.reportOpenGameDetailFromProfile(p2.rootPlaceId, PositionInComponent, if ExperienceDetails then #ExperienceDetails else 0, p2.experienceId, AppPage.ProfilePlatform, p1.layoutOrder, p3 or 1, nil)
	end, {
		UseProfileAnalyticsContextModuleResult,
		ExperienceDetails,
		UseRoactServiceResult,
		p1.layoutOrder
	}), true)
	local UseLocalizationResult = UseLocalizationFunction({ title = TextKeysModule.Experiences })
	
	return if ExperienceDetails and not CryoModule.isEmpty(ExperienceDetails) then ReactModule.createElement(SquareCollectionGridViewModule, {
		hideHeaderButton = true,
		maxNumRows = 1,
		getItemHeight = UseMemoResult,
		items = ExperienceDetails,
		layoutOrder = p1.layoutOrder,
		renderItem = ProfileExperienceTile,
		title = UseLocalizationResult.title,
		impressionsTag = UseGenerateImpressionsTagModuleResult,
		sendImpressions = UseSendItemImpressionsModuleResult,
		overrides = { numColumns = 3 }
	}) else nil
end