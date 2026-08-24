local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local fFlagSduiActionTelemetryHandler = require(parent.SharedFlags).FFlagSduiActionTelemetryHandler
local centralOverlayModule = require(parent.CentralOverlay)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local sendSocialLinkClickEvent = discoveryAnalyticsModule.Events.sendSocialLinkClickEvent
local sendOpenLeavingRobloxModalEvent = discoveryAnalyticsModule.Events.sendOpenLeavingRobloxModalEvent

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sendSocialLinkClickEvent (ref), closeCentralOverlay (ref), fFlagSduiActionTelemetryHandler (ref), sendOpenLeavingRobloxModalEvent (ref), setCentralOverlay (ref), centralOverlayType (ref)
	local var3 = if p0 then p0.actionParams else nil
	
	if var3 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenSocialLink
		}, p1.appPage)
		
		return
	end
	assert(var3, "actionParams must exist")
	local socialLinkUrl = var3.socialLinkUrl
	
	if typeof(socialLinkUrl) ~= "string" or socialLinkUrl == "" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "socialLinkUrl",
			name = sduiActionType.OpenSocialLink,
			message = `Invalid or missing socialLinkUrl: {socialLinkUrl}`
		}, p1.appPage)
		
		return
	end
	local dispatch = p1.dependencies.dispatch
	local linkingProtocol = p1.dependencies.linkingProtocol
	local t = {
		assignment_id = tonumber(var3.assignmentId) or 0,
		assignment_type = var3.assignmentType or "",
		social_link_type = var3.socialLinkType or "",
		social_link_display_type = var3.socialLinkDisplayType or ""
	}
	
	local var5 = function()
		-- upvalues: sendSocialLinkClickEvent (copy), t (ref), socialLinkUrl (ref), linkingProtocol (ref), p1 (ref), sduiErrorType (copy), sduiActionType (copy), dispatch (ref), closeCentralOverlay (copy)
		sendSocialLinkClickEvent({
			assignment_id = t.assignment_id,
			assignment_type = t.assignment_type,
			social_link_type = t.social_link_type,
			social_link_url = socialLinkUrl,
			social_link_display_type = t.social_link_display_type
		})
		linkingProtocol:openURL(socialLinkUrl):catch(function(p2)
			-- upvalues: p1 (copy), sduiErrorType (copy), sduiActionType (copy)
			p1.dependencies.logger.reportError(sduiErrorType.FailedToOpenLink, {
				name = sduiActionType.OpenSocialLink,
				message = if typeof(p2) == "string" then p2 else "Unknown reason"
			}, p1.appPage)
		end)
		dispatch(closeCentralOverlay())
	end
	
	if not fFlagSduiActionTelemetryHandler then
		sendOpenLeavingRobloxModalEvent({
			assignment_id = t.assignment_id,
			assignment_type = t.assignment_type,
			social_link_type = t.social_link_type,
			social_link_display_type = t.social_link_display_type
		})
	end
	dispatch(setCentralOverlay(centralOverlayType.LeaveRobloxAlert, { continueFunc = var5 }))
end