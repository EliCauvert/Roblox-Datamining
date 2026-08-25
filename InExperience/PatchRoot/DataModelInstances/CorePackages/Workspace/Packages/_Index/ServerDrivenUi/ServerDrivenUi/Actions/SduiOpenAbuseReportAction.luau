local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local appPage = require(parent.RobloxAppEnums).AppPage
local navigationRoduxModule = require(parent.NavigationRodux)
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local navigateBack = navigationRoduxModule.Thunks.NavigateBack
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local fetchBadgeDetailsPage = require(parent.Badges).fetchBadgeDetailsPage
local getIsBadgeDetailsSheetOpen = require(parent.Badges).BadgeDetailsSheetState.getIsBadgeDetailsSheetOpen
local fFlagCloseBadgeSheetOnAbuseReport = require(parent.SharedFlags).FFlagCloseBadgeSheetOnAbuseReport
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var3 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagCloseBadgeSheetOnAbuseReport (ref), getIsBadgeDetailsSheetOpen (ref), fFlagSignalsNavP3Dispatch (ref), var3 (ref), navigateBack (ref), openDynamicAbuseReportModule (ref), closeCentralOverlay (ref), sduiLoadTimer (ref), fetchBadgeDetailsPage (ref), appPage (ref), navigateDown (ref)
	local var4 = if p0 then p0.actionParams else nil
	
	if var4 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.OpenAbuseReport
		}, p1.appPage)
		
		return
	end
	assert(var4, "actionParams must exist")
	
	if var4.targetId == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: targetId",
			name = sduiActionType.OpenAbuseReport
		}, p1.appPage)
		
		return
	elseif var4.abuseVector == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: abuseVector",
			name = sduiActionType.OpenAbuseReport
		}, p1.appPage)
		
		return
	end
	local targetId = var4.targetId
	local abuseVector = var4.abuseVector
	local assetTypeName = var4.assetTypeName
	local universeId = var4.universeId
	local dispatch = p1.dependencies.dispatch
	local var5 = fFlagCloseBadgeSheetOnAbuseReport and (p1.appPage == "BadgeDetails" and getIsBadgeDetailsSheetOpen())
	
	if var5 then
		if fFlagSignalsNavP3Dispatch then
			var3.back()
		else
			dispatch(navigateBack())
		end
	end
	local var6 = if var5 then targetId else nil
	dispatch(openDynamicAbuseReportModule({
		abuseVector = abuseVector,
		targetId = targetId,
		custom = { assetTypeName = assetTypeName, universeId = universeId },
		onClose = function()
			-- upvalues: dispatch (ref), closeCentralOverlay (copy), var6 (ref), sduiLoadTimer (copy), fetchBadgeDetailsPage (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var3 (copy), navigateDown (copy)
			dispatch(closeCentralOverlay())
			
			if var6 then
				local badgeDetails = sduiLoadTimer.createLoadTimer("BadgeDetails")
				badgeDetails.start("navigate")
				fetchBadgeDetailsPage(var6, badgeDetails)
				local t = {
					name = appPage.BadgeDetails,
					extraProps = { badgeId = var6, pageTimer = badgeDetails }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var3.down(var3.fromLegacyPage(t))
					
					return
				end
				dispatch(navigateDown(t))
			end
		end
	}))
end