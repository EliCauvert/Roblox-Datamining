local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local gameLaunchModule = require(parent.GameLaunch)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local launchGame = gameLaunchModule.LaunchGame
local useLocalization = localizationModule.Hooks.useLocalization
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity
local constantsModule = require(moments.Constants)
local constantsModule_1 = require(moments.ExperienceDetailsSheet.Constants)
local _ = require(moments.ExperienceDetailsSheet.Types)
local emitRecommendationActionModule = require(moments.Analytics.emitRecommendationAction)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local sessionUtilModule = require(moments.Analytics.sessionUtil)
local getToastStoreModule = require(moments.Stores.GetToastStore)
local listenForTeleportFailureModule = require(script.Parent.listenForTeleportFailure)
local getFFlagMomentsPauseAudioThroughTeleportModule = require(moments.Flags.GetFFlagMomentsPauseAudioThroughTeleport)
local t = { joining = constantsModule_1.LocalizationKeys.joining }

return function() --[[ line: 59 | named "useJoinExperience" ]]
	-- upvalues: useLocalization (ref), t (ref), useMomentsSession (ref), reactModule (ref), getMomentsPreferencesStoreModule (ref), getFFlagMomentsPauseAudioThroughTeleportModule (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), fireAnalyticsEvent (ref), eventNames (ref), analytics (ref), emitRecommendationActionModule (ref), constantsModule (ref), getToastStoreModule (ref), sessionUtilModule (ref), listenForTeleportFailureModule (ref), launchGame (ref), constantsModule_1 (ref)
	local var14 = useLocalization(t)
	local var15 = useMomentsSession()
	local var16 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 67 ]]
		-- upvalues: var16 (ref)
		return function() --[[ line: 68 ]]
			-- upvalues: var16 (copy)
			if var16.current ~= nil then
				var16.current()
				var16.current = nil
			end
		end
	end, {})
	
	return reactModule.useCallback(function(p0, p1) --[[ line: 76 ]]
		-- upvalues: getMomentsPreferencesStoreModule (copy), getFFlagMomentsPauseAudioThroughTeleportModule (copy), var16 (ref), var15 (ref), getFFlagMomentsAnalyticsSchemaIdentity (copy), fireAnalyticsEvent (copy), eventNames (copy), analytics (copy), emitRecommendationActionModule (copy), constantsModule (copy), getToastStoreModule (copy), var14 (ref), sessionUtilModule (copy), listenForTeleportFailureModule (copy), launchGame (copy), constantsModule_1 (copy)
		local var17 = getMomentsPreferencesStoreModule(false)
		local var18 = getFFlagMomentsPauseAudioThroughTeleportModule()
		
		if var16.current ~= nil then
			var16.current()
			var16.current = nil
		end
		var17.setTeleporting(true)
		p1 = p1 or p0.placeId
		local momentsSessionId = var15.getMomentsSessionId(false)
		local itemId = p0.itemId or ""
		local feedItemId = p0.feedItemId or ""
		local tracingId = p0.tracingId or ""
		
		if not getFFlagMomentsAnalyticsSchemaIdentity() then
			fireAnalyticsEvent(eventNames.FeedExperienceJoinAttempted, {
				moments_session_id = momentsSessionId,
				item_id = itemId,
				tracing_id = tracingId,
				destination_placeid = tostring(p1)
			})
		elseif p0.feedItemId == nil or p0.feedItemId == "" then
			analytics.reportMomentSkip("feed_action", if p0.feedItemId == nil then "nil" else "empty", { action = "join" })
		else
			fireAnalyticsEvent(eventNames.FeedExperienceJoinAttempted, {
				feedItemId = p0.feedItemId,
				feedSessionId = tracingId,
				placeId = tostring(p0.placeId),
				universeId = tostring(p0.universeId),
				destinationPlaceId = tostring(p1)
			})
		end
		local var24 = emitRecommendationActionModule({
			itemId = feedItemId,
			tracingId = tracingId,
			momentsSessionId = momentsSessionId,
			actionType = constantsModule.RecommendationActionType.Play,
			destinationPlaceId = p1
		})
		getToastStoreModule(false).triggerToast({ text = "", title = var14.joining })
		
		if var24 then
			sessionUtilModule.setPlayIntent(var24)
		end
		if var18 then
			var16.current = listenForTeleportFailureModule(function() --[[ line: 152 ]]
				-- upvalues: var16 (copy), var17 (ref)
				var16.current = nil
				var17.setTeleporting(false)
			end)
		end
		launchGame(tostring(p1), constantsModule_1.JoinReferralPage, { moments_play_intent_id = var24 }, nil, constantsModule_1.JoinLaunchSource)
		
		if not var18 then
			task.delay(6, function() --[[ line: 169 ]]
				-- upvalues: var17 (ref)
				var17.setTeleporting(false)
			end)
		end
	end, { var14.joining, var15 })
end