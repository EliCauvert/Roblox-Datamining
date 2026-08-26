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

return function()
	-- upvalues: useLocalization (ref), t (ref), useMomentsSession (ref), reactModule (ref), getMomentsPreferencesStoreModule (ref), getFFlagMomentsPauseAudioThroughTeleportModule (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), fireAnalyticsEvent (ref), eventNames (ref), analytics (ref), emitRecommendationActionModule (ref), constantsModule (ref), getToastStoreModule (ref), sessionUtilModule (ref), listenForTeleportFailureModule (ref), launchGame (ref), constantsModule_1 (ref)
	local var1 = useLocalization(t)
	local var2 = useMomentsSession()
	local var3 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			if var3.current ~= nil then
				var3.current()
				var3.current = nil
			end
		end
	end, {})
	
	return reactModule.useCallback(function(p1, p2)
		-- upvalues: getMomentsPreferencesStoreModule (copy), getFFlagMomentsPauseAudioThroughTeleportModule (copy), var3 (ref), var2 (ref), getFFlagMomentsAnalyticsSchemaIdentity (copy), fireAnalyticsEvent (copy), eventNames (copy), analytics (copy), emitRecommendationActionModule (copy), constantsModule (copy), getToastStoreModule (copy), var1 (ref), sessionUtilModule (copy), listenForTeleportFailureModule (copy), launchGame (copy), constantsModule_1 (copy)
		local var4 = getMomentsPreferencesStoreModule(false)
		local var5 = getFFlagMomentsPauseAudioThroughTeleportModule()
		
		if var3.current ~= nil then
			var3.current()
			var3.current = nil
		end
		var4.setTeleporting(true)
		p2 = p2 or p1.placeId
		local momentsSessionId = var2.getMomentsSessionId(false)
		local itemId = p1.itemId or ""
		local feedItemId = p1.feedItemId or ""
		local tracingId = p1.tracingId or ""
		
		if not getFFlagMomentsAnalyticsSchemaIdentity() then
			fireAnalyticsEvent(eventNames.FeedExperienceJoinAttempted, {
				moments_session_id = momentsSessionId,
				item_id = itemId,
				tracing_id = tracingId,
				destination_placeid = tostring(p2)
			})
		elseif p1.feedItemId == nil or p1.feedItemId == "" then
			analytics.reportMomentSkip("feed_action", if p1.feedItemId == nil then "nil" else "empty", { action = "join" })
		else
			fireAnalyticsEvent(eventNames.FeedExperienceJoinAttempted, {
				feedItemId = p1.feedItemId,
				feedSessionId = tracingId,
				placeId = tostring(p1.placeId),
				universeId = tostring(p1.universeId),
				destinationPlaceId = tostring(p2)
			})
		end
		local var6 = emitRecommendationActionModule({
			itemId = feedItemId,
			tracingId = tracingId,
			momentsSessionId = momentsSessionId,
			actionType = constantsModule.RecommendationActionType.Play,
			destinationPlaceId = p2
		})
		getToastStoreModule(false).triggerToast({ text = "", title = var1.joining })
		
		if var6 then
			sessionUtilModule.setPlayIntent(var6)
		end
		if var5 then
			var3.current = listenForTeleportFailureModule(function()
				-- upvalues: var3 (copy), var4 (ref)
				var3.current = nil
				var4.setTeleporting(false)
			end)
		end
		launchGame(tostring(p2), constantsModule_1.JoinReferralPage, { moments_play_intent_id = var6 }, nil, constantsModule_1.JoinLaunchSource)
		
		if not var5 then
			task.delay(6, function()
				-- upvalues: var4 (ref)
				var4.setTeleporting(false)
			end)
		end
	end, { var1.joining, var2 })
end