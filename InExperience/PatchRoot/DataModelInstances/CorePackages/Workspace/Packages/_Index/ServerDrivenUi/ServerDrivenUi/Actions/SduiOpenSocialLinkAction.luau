local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sendSocialLinkClickEvent = require(parent.DiscoveryAnalytics).Events.sendSocialLinkClickEvent

return function(p0, _, p1, _) --[[ line: 19 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sendSocialLinkClickEvent (ref), closeCentralOverlay (ref), setCentralOverlay (ref), centralOverlayType (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenSocialLink
		}, p1.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local socialLinkUrl = var2.socialLinkUrl
	
	if typeof(socialLinkUrl) == "string" and socialLinkUrl ~= "" then
		local dispatch = p1.dependencies.dispatch
		local linkingProtocol = p1.dependencies.linkingProtocol
		local t = {
			assignment_id = tonumber(var2.assignmentId) or 0,
			assignment_type = var2.assignmentType or "",
			social_link_type = var2.socialLinkType or "",
			social_link_display_type = var2.socialLinkDisplayType or ""
		}
		dispatch(setCentralOverlay(centralOverlayType.LeaveRobloxAlert, {
			continueFunc = function() --[[ line: 55 ]]
				-- upvalues: sendSocialLinkClickEvent (copy), t (ref), socialLinkUrl (ref), linkingProtocol (ref), p1 (ref), sduiErrorType (copy), sduiActionType (copy), dispatch (ref), closeCentralOverlay (copy)
				sendSocialLinkClickEvent({
					assignment_id = t.assignment_id,
					assignment_type = t.assignment_type,
					social_link_type = t.social_link_type,
					social_link_url = socialLinkUrl,
					social_link_display_type = t.social_link_display_type
				})
				linkingProtocol:openURL(socialLinkUrl):catch(function(p2) --[[ line: 64 ]]
					-- upvalues: p1 (copy), sduiErrorType (copy), sduiActionType (copy)
					p1.dependencies.logger.reportError(sduiErrorType.FailedToOpenLink, {
						name = sduiActionType.OpenSocialLink,
						message = if typeof(p2) == "string" then p2 else "Unknown reason"
					}, p1.appPage)
				end)
				dispatch(closeCentralOverlay())
			end
		}))
		
		return
	end
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		propName = "socialLinkUrl",
		name = sduiActionType.OpenSocialLink,
		message = `Invalid or missing socialLinkUrl: {socialLinkUrl}`
	}, p1.appPage)
end