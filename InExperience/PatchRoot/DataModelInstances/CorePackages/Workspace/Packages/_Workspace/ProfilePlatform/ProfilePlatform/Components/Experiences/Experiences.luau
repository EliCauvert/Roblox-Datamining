local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local telemetryService = game:GetService("TelemetryService")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactAnalyticsCommonGameEvents = require(parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local contentType = require(parent.UnifiedLogging).ContentType
local cryoModule = require(parent.Cryo)
local squareCollectionGridViewModule = require(profilePlatform.BaseComponents.CollectionGridViews.SquareCollectionGridView)
local enumsModule = require(profilePlatform.Common.Enums)
local useRenderExperienceTileModule = require(profilePlatform.Hooks.Tiles.useRenderExperienceTile)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local formatExperienceDetailsForImpressionsModule = require(profilePlatform.Hooks.formatExperienceDetailsForImpressions)
local useGenerateImpressionsTagModule = require(profilePlatform.Hooks.useGenerateImpressionsTag)
local useSendItemImpressionsModule = require(profilePlatform.Hooks.useSendItemImpressions)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local _ = require(profilePlatform.Common.Types)
local appPage = require(parent.RobloxAppEnums).AppPage
local useTextSizeOffset = require(parent.Foundation).Hooks.useTextSizeOffset
local communityProfileAffiliatedExperienceTelemetryThrottlePermyriad = game:DefineFastInt("CommunityProfileAffiliatedExperienceTelemetryThrottlePermyriad", 0)

local function _(p0)
	return function(p1)
		-- upvalues: p0 (ref)
		return p1 + 80 + p0 * 3
	end
end

return function(p2)
	-- upvalues: useTextSizeOffset (ref), reactModule (ref), useProfileAnalyticsContextModule (ref), useProfileWrapperContextModule (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), useGenerateImpressionsTagModule (ref), enumsModule (ref), formatExperienceDetailsForImpressionsModule (ref), useSendItemImpressionsModule (ref), contentType (ref), eventNamesModule (ref), communityProfileAffiliatedExperienceTelemetryThrottlePermyriad (ref), telemetryService (ref), appPage (ref), useRenderExperienceTileModule (ref), useLocalization (ref), textKeysModule (ref), cryoModule (ref), squareCollectionGridViewModule (ref)
	local experienceDetails = p2.experienceDetails
	local _ = nil
	local _ = nil
	local var15 = useTextSizeOffset()
	local var16 = reactModule.useMemo(function()
		-- upvalues: var15 (write)
		return function(p3)
			-- upvalues: var15 (ref)
			return p3 + 80 + var15 * 3
		end
	end, { var15 })
	local var17 = useProfileAnalyticsContextModule()
	local var18 = useProfileWrapperContextModule()
	local var19 = useRoactService(roactAnalyticsCommonGameEvents)
	local var20 = useGenerateImpressionsTagModule(enumsModule.Components.Experiences)
	
	return if experienceDetails and not cryoModule.isEmpty(experienceDetails) then reactModule.createElement(squareCollectionGridViewModule, {
		hideHeaderButton = true,
		maxNumRows = 1,
		getItemHeight = var16,
		items = experienceDetails,
		layoutOrder = p2.layoutOrder,
		renderItem = useRenderExperienceTileModule(var20, "ProfileExperienceTile", reactModule.useCallback(function(p4, p5, p6)
			-- upvalues: var17 (ref), eventNamesModule (copy), communityProfileAffiliatedExperienceTelemetryThrottlePermyriad (copy), var18 (ref), telemetryService (copy), experienceDetails (ref), var19 (ref), appPage (copy), p2 (ref)
			var17.fireAnalyticsEvent(eventNamesModule.ExperienceOpened, { experienceId = p4.experienceId, positionInComponent = p5 })
			telemetryService:LogEvent({
				eventName = "communityAffiliatedExperienceClick",
				description = "Event fired from the client every time an experience is clicked from a community profile",
				links = "https://github.rbx.com/Roblox/proto-schemas/pull/6250",
				backends = { "EventIngest" },
				throttlingPercentage = communityProfileAffiliatedExperienceTelemetryThrottlePermyriad,
				lastUpdated = { 25, 6, 5 }
			}, {
				customFields = {
					affiliationType = "owner",
					community_id = var18.profileId,
					place_id = p4.rootPlaceId,
					universe_id = p4.experienceId
				}
			})
			var19.reportOpenGameDetailFromProfile(p4.rootPlaceId, p5, if experienceDetails then #experienceDetails else 0, p4.experienceId, appPage.ProfilePlatform, p2.layoutOrder, p6 or 1, nil)
		end, { var17, experienceDetails, var19, p2.layoutOrder }), true),
		title = useLocalization({ title = textKeysModule.Experiences }).title,
		impressionsTag = var20,
		sendImpressions = useSendItemImpressionsModule(reactModule.useMemo(function()
			-- upvalues: formatExperienceDetailsForImpressionsModule (copy), experienceDetails (ref)
			return formatExperienceDetailsForImpressionsModule(experienceDetails)
		end, { experienceDetails }), 3, contentType.Game, p2.layoutOrder, enumsModule.Components.Experiences),
		overrides = { numColumns = 3 }
	}) else nil
end