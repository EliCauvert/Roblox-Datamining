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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagCloseBadgeSheetOnAbuseReport (ref), getIsBadgeDetailsSheetOpen (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), openDynamicAbuseReportModule (ref), closeCentralOverlay (ref), sduiLoadTimer (ref), fetchBadgeDetailsPage (ref), appPage (ref), navigateDown (ref)
	local var2 = if p1 then p1.actionParams else nil
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.OpenAbuseReport
		}, p2.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	
	if var2.targetId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: targetId",
			name = sduiActionType.OpenAbuseReport
		}, p2.appPage)
		
		return
	elseif var2.abuseVector == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: abuseVector",
			name = sduiActionType.OpenAbuseReport
		}, p2.appPage)
		
		return
	end
	local targetId = var2.targetId
	local abuseVector = var2.abuseVector
	local assetTypeName = var2.assetTypeName
	local universeId = var2.universeId
	local dispatch = p2.dependencies.dispatch
	local var3 = fFlagCloseBadgeSheetOnAbuseReport and (p2.appPage == "BadgeDetails" and getIsBadgeDetailsSheetOpen())
	
	if var3 then
		if fFlagSignalsNavP3Dispatch then
			var1.back()
		else
			dispatch(navigateBack())
		end
	end
	local var4 = if var3 then targetId else nil
	dispatch(openDynamicAbuseReportModule({
		abuseVector = abuseVector,
		targetId = targetId,
		custom = { assetTypeName = assetTypeName, universeId = universeId },
		onClose = function()
			-- upvalues: dispatch (ref), closeCentralOverlay (copy), var4 (ref), sduiLoadTimer (copy), fetchBadgeDetailsPage (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
			dispatch(closeCentralOverlay())
			
			if var4 then
				local badgeDetails = sduiLoadTimer.createLoadTimer("BadgeDetails")
				badgeDetails.start("navigate")
				fetchBadgeDetailsPage(var4, badgeDetails)
				local t = {
					name = appPage.BadgeDetails,
					extraProps = { badgeId = var4, pageTimer = badgeDetails }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var1.down(var1.fromLegacyPage(t))
					
					return
				end
				dispatch(navigateDown(t))
			end
		end
	}))
end