local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local MomentsCommonModule = require(Parent.MomentsCommon)
local LaunchGameFunction = require(Parent.GameLaunch).LaunchGame
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local GetFFlagMomentsAnalyticsSchemaIdentityFunction = MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity
local ConstantsModule = require(Moments.Constants)
local ConstantsModule1 = require(Moments.ExperienceDetailsSheet.Constants)
local _ = require(Moments.ExperienceDetailsSheet.Types)
local EmitRecommendationActionModule = require(Moments.Analytics.emitRecommendationAction)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local SessionUtilModule = require(Moments.Analytics.sessionUtil)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local ListenForTeleportFailureModule = require(script.Parent.listenForTeleportFailure)
local GetFFlagMomentsPauseAudioThroughTeleportModule = require(Moments.Flags.GetFFlagMomentsPauseAudioThroughTeleport)
local config = { joining = ConstantsModule1.LocalizationKeys.joining }

return function()
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseMomentsSessionFunction (copy), ReactModule (copy), GetMomentsPreferencesStoreModule (copy), GetFFlagMomentsPauseAudioThroughTeleportModule (copy), GetFFlagMomentsAnalyticsSchemaIdentityFunction (copy), FireAnalyticsEventFunction (copy), EventNames (copy), Analytics (copy), EmitRecommendationActionModule (copy), ConstantsModule (copy), GetToastStoreModule (copy), SessionUtilModule (copy), ListenForTeleportFailureModule (copy), LaunchGameFunction (copy), ConstantsModule1 (copy)
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
	
	return ReactModule.useCallback(function(p1, p2)
		-- upvalues: GetMomentsPreferencesStoreModule (upval), GetFFlagMomentsPauseAudioThroughTeleportModule (upval), UseRefResult (copy), UseMomentsSessionResult (copy), GetFFlagMomentsAnalyticsSchemaIdentityFunction (upval), FireAnalyticsEventFunction (upval), EventNames (upval), Analytics (upval), EmitRecommendationActionModule (upval), ConstantsModule (upval), GetToastStoreModule (upval), UseLocalizationResult (copy), SessionUtilModule (upval), ListenForTeleportFailureModule (upval), LaunchGameFunction (upval), ConstantsModule1 (upval)
		local MomentsPreferencesStoreModule = GetMomentsPreferencesStoreModule(false)
		local FFlagMomentsPauseAudioThroughTeleportModule = GetFFlagMomentsPauseAudioThroughTeleportModule()
		
		if UseRefResult.current ~= nil then
			UseRefResult.current()
			UseRefResult.current = nil
		end
		MomentsPreferencesStoreModule.setTeleporting(true)
		local P1 = p2 or p1.placeId
		local MomentsSessionId = UseMomentsSessionResult.getMomentsSessionId(false)
		local ItemId = p1.itemId or ""
		local TracingId = p1.tracingId or ""
		
		if GetFFlagMomentsAnalyticsSchemaIdentityFunction() then
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
		else
			FireAnalyticsEventFunction(EventNames.FeedExperienceJoinAttempted, {
				moments_session_id = MomentsSessionId,
				item_id = ItemId,
				tracing_id = TracingId,
				destination_placeid = tostring(P1)
			})
		end
		local Moments_play_intent_id = nil
		
		if GetFFlagMomentsAnalyticsSchemaIdentityFunction() then
			local FeedItemId = p1.feedItemId
			
			if FeedItemId ~= nil and FeedItemId ~= "" then
				Moments_play_intent_id = EmitRecommendationActionModule({
					itemId = FeedItemId,
					tracingId = TracingId,
					momentsSessionId = MomentsSessionId,
					actionType = ConstantsModule.RecommendationActionType.Play,
					destinationPlaceId = P1
				})
			end
		else
			Moments_play_intent_id = EmitRecommendationActionModule({
				itemId = ItemId,
				tracingId = TracingId,
				momentsSessionId = MomentsSessionId,
				actionType = ConstantsModule.RecommendationActionType.Play,
				destinationPlaceId = P1
			})
		end
		GetToastStoreModule(false).triggerToast({ text = "", title = UseLocalizationResult.joining })
		
		if Moments_play_intent_id then
			SessionUtilModule.setPlayIntent(Moments_play_intent_id)
		end
		if FFlagMomentsPauseAudioThroughTeleportModule then
			UseRefResult.current = ListenForTeleportFailureModule(function()
				-- upvalues: UseRefResult (upval), MomentsPreferencesStoreModule (copy)
				UseRefResult.current = nil
				MomentsPreferencesStoreModule.setTeleporting(false)
			end)
		end
		LaunchGameFunction(tostring(P1), ConstantsModule1.JoinReferralPage, { moments_play_intent_id = Moments_play_intent_id }, nil, ConstantsModule1.JoinLaunchSource)
		
		if not FFlagMomentsPauseAudioThroughTeleportModule then
			task.delay(6, function()
				-- upvalues: MomentsPreferencesStoreModule (copy)
				MomentsPreferencesStoreModule.setTeleporting(false)
			end)
		end
	end, { UseLocalizationResult.joining, UseMomentsSessionResult })
end