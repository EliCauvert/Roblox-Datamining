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

local function _(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		return p2 + 80 + p1 * 3
	end
end

return function(p1)
	-- upvalues: useTextSizeOffset (ref), reactModule (ref), useProfileAnalyticsContextModule (ref), useProfileWrapperContextModule (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), useGenerateImpressionsTagModule (ref), enumsModule (ref), formatExperienceDetailsForImpressionsModule (ref), useSendItemImpressionsModule (ref), contentType (ref), eventNamesModule (ref), communityProfileAffiliatedExperienceTelemetryThrottlePermyriad (ref), telemetryService (ref), appPage (ref), useRenderExperienceTileModule (ref), useLocalization (ref), textKeysModule (ref), cryoModule (ref), squareCollectionGridViewModule (ref)
	local experienceDetails = p1.experienceDetails
	local _ = nil
	local _ = nil
	local var1 = useTextSizeOffset()
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (write)
		return function(p2)
			-- upvalues: var1 (ref)
			return p2 + 80 + var1 * 3
		end
	end, { var1 })
	local var3 = useProfileAnalyticsContextModule()
	local var4 = useProfileWrapperContextModule()
	local var5 = useRoactService(roactAnalyticsCommonGameEvents)
	local var6 = useGenerateImpressionsTagModule(enumsModule.Components.Experiences)
	
	return if experienceDetails and not cryoModule.isEmpty(experienceDetails) then reactModule.createElement(squareCollectionGridViewModule, {
		hideHeaderButton = true,
		maxNumRows = 1,
		getItemHeight = var2,
		items = experienceDetails,
		layoutOrder = p1.layoutOrder,
		renderItem = useRenderExperienceTileModule(var6, "ProfileExperienceTile", reactModule.useCallback(function(p2, p3, p4)
			-- upvalues: var3 (ref), eventNamesModule (copy), communityProfileAffiliatedExperienceTelemetryThrottlePermyriad (copy), var4 (ref), telemetryService (copy), experienceDetails (ref), var5 (ref), appPage (copy), p1 (ref)
			var3.fireAnalyticsEvent(eventNamesModule.ExperienceOpened, { experienceId = p2.experienceId, positionInComponent = p3 })
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
					community_id = var4.profileId,
					place_id = p2.rootPlaceId,
					universe_id = p2.experienceId
				}
			})
			var5.reportOpenGameDetailFromProfile(p2.rootPlaceId, p3, if experienceDetails then #experienceDetails else 0, p2.experienceId, appPage.ProfilePlatform, p1.layoutOrder, p4 or 1, nil)
		end, { var3, experienceDetails, var5, p1.layoutOrder }), true),
		title = useLocalization({ title = textKeysModule.Experiences }).title,
		impressionsTag = var6,
		sendImpressions = useSendItemImpressionsModule(reactModule.useMemo(function()
			-- upvalues: formatExperienceDetailsForImpressionsModule (copy), experienceDetails (ref)
			return formatExperienceDetailsForImpressionsModule(experienceDetails)
		end, { experienceDetails }), 3, contentType.Game, p1.layoutOrder, enumsModule.Components.Experiences),
		overrides = { numColumns = 3 }
	}) else nil
end