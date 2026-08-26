local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sendSocialLinkClickEvent = require(parent.DiscoveryAnalytics).Events.sendSocialLinkClickEvent

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sendSocialLinkClickEvent (ref), closeCentralOverlay (ref), setCentralOverlay (ref), centralOverlayType (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenSocialLink
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local socialLinkUrl = var1.socialLinkUrl
	
	if typeof(socialLinkUrl) == "string" and socialLinkUrl ~= "" then
		local dispatch = p2.dependencies.dispatch
		local linkingProtocol = p2.dependencies.linkingProtocol
		local t = {
			assignment_id = tonumber(var1.assignmentId) or 0,
			assignment_type = var1.assignmentType or "",
			social_link_type = var1.socialLinkType or "",
			social_link_display_type = var1.socialLinkDisplayType or ""
		}
		dispatch(setCentralOverlay(centralOverlayType.LeaveRobloxAlert, {
			continueFunc = function()
				-- upvalues: sendSocialLinkClickEvent (copy), t (ref), socialLinkUrl (ref), linkingProtocol (ref), p2 (ref), sduiErrorType (copy), sduiActionType (copy), dispatch (ref), closeCentralOverlay (copy)
				sendSocialLinkClickEvent({
					assignment_id = t.assignment_id,
					assignment_type = t.assignment_type,
					social_link_type = t.social_link_type,
					social_link_url = socialLinkUrl,
					social_link_display_type = t.social_link_display_type
				})
				linkingProtocol:openURL(socialLinkUrl):catch(function(p3)
					-- upvalues: p2 (copy), sduiErrorType (copy), sduiActionType (copy)
					p2.dependencies.logger.reportError(sduiErrorType.FailedToOpenLink, {
						name = sduiActionType.OpenSocialLink,
						message = if typeof(p3) == "string" then p3 else "Unknown reason"
					}, p2.appPage)
				end)
				dispatch(closeCentralOverlay())
			end
		}))
		
		return
	end
	p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		propName = "socialLinkUrl",
		name = sduiActionType.OpenSocialLink,
		message = `Invalid or missing socialLinkUrl: {socialLinkUrl}`
	}, p2.appPage)
end