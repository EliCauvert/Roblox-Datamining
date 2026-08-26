local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local calculateRowPositionFields = require(parent.UnifiedLogging).calculateRowPositionFields
local setGamePlaySession = require(parent.RobloxAppSessionization).SetGamePlaySession
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local sponsoredGamesRecordClick = discoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local findAnalyticsFieldInAncestors = require(parent.SduiCoreSystem).findAnalyticsFieldInAncestors
local sduiReportGamePlayIntentModule = require(script.Parent.sduiReportGamePlayIntent)
local fFlagSduiLaunchExperienceAction = require(parent.SharedFlags).FFlagSduiLaunchExperienceAction
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), fFlagSduiLaunchExperienceAction (ref), sduiReportGamePlayIntentModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), findAnalyticsFieldInAncestors (ref), setGamePlaySession (ref), sponsoredGamesRecordClick (ref), calculateRowPositionFields (ref), gamePlayIntent (ref)
	local eventIngest = p1.dependencies.eventIngest
	local sessionService = p1.dependencies.sessionService
	
	return reactModule.useCallback(function(p8)
		-- upvalues: fFlagSduiLaunchExperienceAction (copy), sduiReportGamePlayIntentModule (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (write), p6 (ref), fFlagSduiExperienceDetailsSupport (copy), p7 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), findAnalyticsFieldInAncestors (copy), setGamePlaySession (copy), sessionService (ref), sponsoredGamesRecordClick (copy), calculateRowPositionFields (copy), gamePlayIntent (copy), eventIngest (ref)
		if fFlagSduiLaunchExperienceAction then
			sduiReportGamePlayIntentModule({
				sduiContext = p1,
				analyticsContext = p2,
				universeId = p3,
				placeId = p4,
				rootPlaceId = p5,
				appliedFilters = p6,
				launchData = if fFlagSduiExperienceDetailsSupport then p7 else nil,
				actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p8 else nil
			})
			
			return
		end
		p5 = p5 or p4
		local collectionPosition = nil
		local collectionId = nil
		local itemsPerRow = nil
		local startRowNumber = nil
		local var1 = p2.getCollectionData and p2.getCollectionData() or nil
		
		if var1 then
			collectionPosition = var1.collectionPosition
			collectionId = var1.collectionId
			itemsPerRow = var1.itemsPerRow
			startRowNumber = var1.startRowNumber
		end
		local collectionPosition_1 = collectionPosition or findAnalyticsFieldInAncestors("collectionIndex", p2)
		local collectionId_1 = collectionId or findAnalyticsFieldInAncestors("collectionId", p2)
		local var2 = findAnalyticsFieldInAncestors("gameSetTargetId", p2)
		local var3 = findAnalyticsFieldInAncestors("itemPosition", p2, -1)
		local var4 = findAnalyticsFieldInAncestors("topicDataPosition", p2, var3)
		local var5 = findAnalyticsFieldInAncestors("heroUnitId", p2)
		local var6 = findAnalyticsFieldInAncestors("eventContext", p2, "ExperienceTile")
		local var7 = findAnalyticsFieldInAncestors("referralSource", p2)
		local var8 = findAnalyticsFieldInAncestors("gamePlaySessionType", p2)
		
		if var8 then
			setGamePlaySession(sessionService, var8, true)
		end
		local var9 = findAnalyticsFieldInAncestors("nativeAdData", p2)
		
		if var9 == nil then
			var9 = findAnalyticsFieldInAncestors("adId", p2)
		end
		if var9 then
			sponsoredGamesRecordClick(p1.dependencies.networking, tostring(var9))
		end
		local var10 = calculateRowPositionFields(var3, itemsPerRow, startRowNumber)
		gamePlayIntent(eventIngest, tostring(var6), {
			placeId = tostring(p4),
			rootPlaceId = tonumber(p5),
			universeId = tostring(p3),
			sortIndex = tostring(collectionPosition_1),
			sortEntryIndex = if var3 then tostring(var3) else nil,
			referralSource = var7,
			gameSetTypeId = tostring(collectionId_1),
			gameSetTargetId = var2,
			appliedFilters = p6,
			topicDataPosition = var4,
			nativeAdData = var9,
			pageName = p1.appPage,
			positionInRow = var10.positionInRow,
			rowNumber = var10.rowInSort,
			feedRowNumber = var10.rowOnPage,
			heroUnitId = var5,
			tileType = findAnalyticsFieldInAncestors("tileType", p2, "GameTile"),
			launchData = if fFlagSduiExperienceDetailsSupport then p7 else nil,
			actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p8 else nil
		})
	end, {
		eventIngest, p2, p3, p4, p5, p6,
		if fFlagSduiExperienceDetailsSupport then p7 else nil, sessionService, p1
	})
end