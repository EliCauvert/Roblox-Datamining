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

return function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), fFlagSduiLaunchExperienceAction (ref), sduiReportGamePlayIntentModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), findAnalyticsFieldInAncestors (ref), setGamePlaySession (ref), sponsoredGamesRecordClick (ref), calculateRowPositionFields (ref), gamePlayIntent (ref)
	local eventIngest = p0.dependencies.eventIngest
	local sessionService = p0.dependencies.sessionService
	
	return reactModule.useCallback(function(p7)
		-- upvalues: fFlagSduiLaunchExperienceAction (copy), sduiReportGamePlayIntentModule (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (write), p5 (ref), fFlagSduiExperienceDetailsSupport (copy), p6 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), findAnalyticsFieldInAncestors (copy), setGamePlaySession (copy), sessionService (ref), sponsoredGamesRecordClick (copy), calculateRowPositionFields (copy), gamePlayIntent (copy), eventIngest (ref)
		if fFlagSduiLaunchExperienceAction then
			sduiReportGamePlayIntentModule({
				sduiContext = p0,
				analyticsContext = p1,
				universeId = p2,
				placeId = p3,
				rootPlaceId = p4,
				appliedFilters = p5,
				launchData = if fFlagSduiExperienceDetailsSupport then p6 else nil,
				actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p7 else nil
			})
			
			return
		end
		p4 = p4 or p3
		local collectionPosition = nil
		local collectionId = nil
		local itemsPerRow = nil
		local startRowNumber = nil
		local var3 = p1.getCollectionData and p1.getCollectionData() or nil
		
		if var3 then
			collectionPosition = var3.collectionPosition
			collectionId = var3.collectionId
			itemsPerRow = var3.itemsPerRow
			startRowNumber = var3.startRowNumber
		end
		local collectionPosition_1 = collectionPosition or findAnalyticsFieldInAncestors("collectionIndex", p1)
		local collectionId_1 = collectionId or findAnalyticsFieldInAncestors("collectionId", p1)
		local var6 = findAnalyticsFieldInAncestors("gameSetTargetId", p1)
		local var7 = findAnalyticsFieldInAncestors("itemPosition", p1, -1)
		local var8 = findAnalyticsFieldInAncestors("topicDataPosition", p1, var7)
		local var9 = findAnalyticsFieldInAncestors("heroUnitId", p1)
		local var10 = findAnalyticsFieldInAncestors("eventContext", p1, "ExperienceTile")
		local var11 = findAnalyticsFieldInAncestors("referralSource", p1)
		local var12 = findAnalyticsFieldInAncestors("gamePlaySessionType", p1)
		
		if var12 then
			setGamePlaySession(sessionService, var12, true)
		end
		local var13 = findAnalyticsFieldInAncestors("nativeAdData", p1)
		
		if var13 == nil then
			var13 = findAnalyticsFieldInAncestors("adId", p1)
		end
		if var13 then
			sponsoredGamesRecordClick(p0.dependencies.networking, tostring(var13))
		end
		local var14 = calculateRowPositionFields(var7, itemsPerRow, startRowNumber)
		gamePlayIntent(eventIngest, tostring(var10), {
			placeId = tostring(p3),
			rootPlaceId = tonumber(p4),
			universeId = tostring(p2),
			sortIndex = tostring(collectionPosition_1),
			sortEntryIndex = if var7 then tostring(var7) else nil,
			referralSource = var11,
			gameSetTypeId = tostring(collectionId_1),
			gameSetTargetId = var6,
			appliedFilters = p5,
			topicDataPosition = var8,
			nativeAdData = var13,
			pageName = p0.appPage,
			positionInRow = var14.positionInRow,
			rowNumber = var14.rowInSort,
			feedRowNumber = var14.rowOnPage,
			heroUnitId = var9,
			tileType = findAnalyticsFieldInAncestors("tileType", p1, "GameTile"),
			launchData = if fFlagSduiExperienceDetailsSupport then p6 else nil,
			actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p7 else nil
		})
	end, {
		eventIngest, p1, p2, p3, p4, p5,
		if fFlagSduiExperienceDetailsSupport then p6 else nil, sessionService, p0
	})
end