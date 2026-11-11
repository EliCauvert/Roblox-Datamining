local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local FFlagSduiActionTelemetryHandler = require(Parent.SharedFlags).FFlagSduiActionTelemetryHandler
local CentralOverlayModule = require(Parent.CentralOverlay)
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local SendSocialLinkClickEventFunction = DiscoveryAnalyticsModule.Events.sendSocialLinkClickEvent
local SendOpenLeavingRobloxModalEventFunction = DiscoveryAnalyticsModule.Events.sendOpenLeavingRobloxModalEvent

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), SendSocialLinkClickEventFunction (copy), CloseCentralOverlayFunction (copy), FFlagSduiActionTelemetryHandler (copy), SendOpenLeavingRobloxModalEventFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenSocialLink
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local SocialLinkUrl = ActionParams.socialLinkUrl
	
	if typeof(SocialLinkUrl) ~= "string" or SocialLinkUrl == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "socialLinkUrl",
			name = SduiActionType.OpenSocialLink,
			message = `Invalid or missing socialLinkUrl: {SocialLinkUrl}`
		}, p2.appPage)
		
		return
	end
	local DispatchFunction: (any) -> () = p2.dependencies.dispatch
	local LinkingProtocol = p2.dependencies.linkingProtocol
	local config = {
		assignment_id = tonumber(ActionParams.assignmentId) or 0,
		assignment_type = ActionParams.assignmentType or "",
		social_link_type = ActionParams.socialLinkType or "",
		social_link_display_type = ActionParams.socialLinkDisplayType or ""
	}
	
	local function ContinueFunc()
		-- upvalues: SendSocialLinkClickEventFunction (upval), config (copy), SocialLinkUrl (copy), LinkingProtocol (copy), p2 (copy), SduiErrorType (upval), SduiActionType (upval), DispatchFunction (copy), CloseCentralOverlayFunction (upval)
		SendSocialLinkClickEventFunction({
			assignment_id = config.assignment_id,
			assignment_type = config.assignment_type,
			social_link_type = config.social_link_type,
			social_link_url = SocialLinkUrl,
			social_link_display_type = config.social_link_display_type
		})
		LinkingProtocol:openURL(SocialLinkUrl):catch(function(Err)
			-- upvalues: p2 (upval), SduiErrorType (upval), SduiActionType (upval)
			p2.dependencies.logger.reportError(SduiErrorType.FailedToOpenLink, {
				name = SduiActionType.OpenSocialLink,
				message = if typeof(Err) == "string" then Err else "Unknown reason"
			}, p2.appPage)
		end)
		DispatchFunction(CloseCentralOverlayFunction())
	end
	
	if not FFlagSduiActionTelemetryHandler then
		SendOpenLeavingRobloxModalEventFunction({
			assignment_id = config.assignment_id,
			assignment_type = config.assignment_type,
			social_link_type = config.social_link_type,
			social_link_display_type = config.social_link_display_type
		})
	end
	DispatchFunction(SetCentralOverlayFunction(CentralOverlayType.LeaveRobloxAlert, { continueFunc = ContinueFunc }))
end