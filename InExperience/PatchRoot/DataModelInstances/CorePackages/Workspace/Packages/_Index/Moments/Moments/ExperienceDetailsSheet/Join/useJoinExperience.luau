local HttpService = game:GetService("HttpService")
local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local LaunchGameFunction = require(Parent.GameLaunch).LaunchGame
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Analytics = require(Parent.MomentsCommon).Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local ConstantsModule = require(Moments.Constants)
local ConstantsModule1 = require(Moments.ExperienceDetailsSheet.Constants)
local _ = require(Moments.ExperienceDetailsSheet.Types)
local EmitRecommendationActionModule = require(Moments.Analytics.emitRecommendationAction)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local SessionUtilModule = require(Moments.Analytics.sessionUtil)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local ListenForTeleportFailureModule = require(script.Parent.listenForTeleportFailure)
local FFlagMomentsPlayEventModule = require(Moments.Flags.FFlagMomentsPlayEvent)
local config = { joining = ConstantsModule1.LocalizationKeys.joining }

return function()
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseMomentsSessionFunction (copy), ReactModule (copy), GetMomentsPreferencesStoreModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), Analytics (copy), HttpService (copy), EmitRecommendationActionModule (copy), ConstantsModule (copy), GetToastStoreModule (copy), SessionUtilModule (copy), FFlagMomentsPlayEventModule (copy), Moments (copy), ListenForTeleportFailureModule (copy), LaunchGameFunction (copy), ConstantsModule1 (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current ~= nil then
				UseRefResult.current()
				UseRefResult.current = nil
			end
		end
	end, {})
	
	return ReactModule.useCallback(function(p1, p2, ViewId)
		-- upvalues: GetMomentsPreferencesStoreModule (upval), UseRefResult (copy), UseMomentsSessionResult (copy), FireAnalyticsEventFunction (upval), EventNames (upval), Analytics (upval), HttpService (upval), EmitRecommendationActionModule (upval), ConstantsModule (upval), GetToastStoreModule (upval), UseLocalizationResult (copy), SessionUtilModule (upval), FFlagMomentsPlayEventModule (upval), Moments (upval), ListenForTeleportFailureModule (upval), LaunchGameFunction (upval), ConstantsModule1 (upval)
		local MomentsPreferencesStoreModule = GetMomentsPreferencesStoreModule(false)
		
		if UseRefResult.current ~= nil then
			UseRefResult.current()
			UseRefResult.current = nil
		end
		MomentsPreferencesStoreModule.setTeleporting(true)
		local P1 = p2 or p1.placeId
		local MomentsSessionId = UseMomentsSessionResult.getMomentsSessionId(false)
		local FeedItemId = p1.feedItemId or ""
		local TracingId = p1.tracingId or ""
		
		if p1.feedItemId == nil or p1.feedItemId == "" then
			Analytics.reportMomentSkip("feed_action", if p1.feedItemId == nil then "nil" else "empty", { action = "join" })
		else
			FireAnalyticsEventFunction(EventNames.FeedExperienceJoinAttempted, {
				feedItemId = p1.feedItemId,
				feedSessionId = TracingId,
				placeId = tostring(p1.placeId),
				universeId = tostring(p1.universeId),
				destinationPlaceId = tostring(P1)
			})
		end
		local Guid = if p1.recommendationSource == Analytics.RecommendationSource.Following then HttpService:GenerateGUID(false) else EmitRecommendationActionModule({
			itemId = FeedItemId,
			tracingId = TracingId,
			momentsSessionId = MomentsSessionId,
			actionType = ConstantsModule.RecommendationActionType.Play,
			destinationPlaceId = P1,
			contentType = p1.contentType
		})
		GetToastStoreModule(false).triggerToast({ text = "", title = UseLocalizationResult.joining })
		
		if Guid then
			SessionUtilModule.setPlayIntent(Guid)
		end
		if FFlagMomentsPlayEventModule and Guid ~= nil and p1.feedItemId ~= nil and p1.feedItemId ~= "" then
			FireAnalyticsEventFunction(EventNames.MomentsPlayEvent, require(Moments.Analytics.makeMomentsPlayFields)({
				feedItemId = p1.feedItemId,
				momentsPlayIntentId = Guid,
				viewId = ViewId,
				clientEventTimestampMs = DateTime.now().UnixTimestampMillis
			}))
		end
		UseRefResult.current = ListenForTeleportFailureModule(function()
			-- upvalues: UseRefResult (upval), MomentsPreferencesStoreModule (copy)
			UseRefResult.current = nil
			MomentsPreferencesStoreModule.setTeleporting(false)
		end)
		LaunchGameFunction(tostring(P1), ConstantsModule1.JoinReferralPage, { moments_play_intent_id = Guid }, nil, ConstantsModule1.JoinLaunchSource)
	end, { UseLocalizationResult.joining, UseMomentsSessionResult })
end