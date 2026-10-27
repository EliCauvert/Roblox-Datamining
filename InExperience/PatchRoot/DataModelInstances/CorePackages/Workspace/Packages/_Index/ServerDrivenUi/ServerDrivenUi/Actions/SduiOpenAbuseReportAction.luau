local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(Parent.NavigationRodux)
local NavigateDownFunction = NavigationRoduxModule.Thunks.NavigateDown
local NavigateBackFunction = NavigationRoduxModule.Thunks.NavigateBack
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local FetchBadgeDetailsPageFunction = require(Parent.Badges).fetchBadgeDetailsPage
local GetIsBadgeDetailsSheetOpenFunction = require(Parent.Badges).BadgeDetailsSheetState.getIsBadgeDetailsSheetOpen
local FFlagCloseBadgeSheetOnAbuseReport = require(Parent.SharedFlags).FFlagCloseBadgeSheetOnAbuseReport
local FFlagEnableGroupAnnouncementReporting = require(Parent.SharedFlags).FFlagEnableGroupAnnouncementReporting
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), FFlagEnableGroupAnnouncementReporting (copy), AbuseVectorModule (copy), FFlagCloseBadgeSheetOnAbuseReport (copy), GetIsBadgeDetailsSheetOpenFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), CloseCentralOverlayFunction (copy), SduiLoadTimer (copy), FetchBadgeDetailsPageFunction (copy), AppPage (copy), NavigateDownFunction (copy), OpenDynamicAbuseReportModule (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = SduiActionType.OpenAbuseReport
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	
	if ActionParams.targetId == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: targetId",
			name = SduiActionType.OpenAbuseReport
		}, p2.appPage)
		
		return
	end
	if ActionParams.abuseVector == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: abuseVector",
			name = SduiActionType.OpenAbuseReport
		}, p2.appPage)
		
		return
	end
	local TargetId = ActionParams.targetId
	local AbuseVector = ActionParams.abuseVector
	local AssetTypeName = ActionParams.assetTypeName
	local UniverseId = ActionParams.universeId
	local GroupId = nil
	
	if FFlagEnableGroupAnnouncementReporting and AbuseVector == AbuseVectorModule.GroupAnnouncement then
		if type(TargetId) ~= "string" or TargetId == "" then
			p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				message = "Group announcement reports require a nonempty targetId",
				name = SduiActionType.OpenAbuseReport
			}, p2.appPage)
			
			return
		end
		local GroupId1 = ActionParams.groupId
		
		if type(GroupId1) ~= "string" or GroupId1 == "" then
			p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				message = "Group announcement reports require a nonempty groupId",
				name = SduiActionType.OpenAbuseReport
			}, p2.appPage)
			
			return
		end
		GroupId = GroupId1
	end
	local DispatchFunction: (any) -> () = p2.dependencies.dispatch
	local IsBadgeDetailsSheetOpen = FFlagCloseBadgeSheetOnAbuseReport and (p2.appPage == "BadgeDetails" and GetIsBadgeDetailsSheetOpenFunction())
	
	if IsBadgeDetailsSheetOpen then
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back()
		else
			DispatchFunction(NavigateBackFunction())
		end
	end
	local TargetId1 = if IsBadgeDetailsSheetOpen then TargetId else nil
	local config = {
		abuseVector = AbuseVector,
		targetId = TargetId,
		custom = { assetTypeName = AssetTypeName, universeId = UniverseId },
		onClose = function()
			-- upvalues: DispatchFunction (copy), CloseCentralOverlayFunction (upval), TargetId1 (copy), SduiLoadTimer (upval), FetchBadgeDetailsPageFunction (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
			DispatchFunction(CloseCentralOverlayFunction())
			
			if TargetId1 then
				local BadgeDetails = SduiLoadTimer.createLoadTimer("BadgeDetails")
				BadgeDetails.start("navigate")
				FetchBadgeDetailsPageFunction(TargetId1, BadgeDetails)
				local config = {
					name = AppPage.BadgeDetails,
					extraProps = { badgeId = TargetId1, pageTimer = BadgeDetails }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				end
				DispatchFunction(NavigateDownFunction(config))
			end
		end
	}
	
	if GroupId then
		config.attributes = { targetId = TargetId, groupId = GroupId }
		config.analyticsTargetId = TargetId
		config.targetId = nil
	end
	DispatchFunction(OpenDynamicAbuseReportModule(config))
end