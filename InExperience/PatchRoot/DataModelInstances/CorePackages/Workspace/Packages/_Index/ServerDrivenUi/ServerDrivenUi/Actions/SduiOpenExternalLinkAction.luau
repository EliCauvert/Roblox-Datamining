local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), closeCentralOverlay (ref), setCentralOverlay (ref), centralOverlayType (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenExternalLink
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local url = var1.url
	
	if typeof(url) == "string" and url ~= "" then
		local dispatch = p2.dependencies.dispatch
		local linkingProtocol = p2.dependencies.linkingProtocol
		dispatch(setCentralOverlay(centralOverlayType.LeaveRobloxAlert, {
			continueFunc = function()
				-- upvalues: linkingProtocol (ref), url (ref), p2 (ref), sduiErrorType (copy), sduiActionType (copy), dispatch (ref), closeCentralOverlay (copy)
				linkingProtocol:openURL(url):catch(function(p3)
					-- upvalues: p2 (copy), sduiErrorType (copy), sduiActionType (copy)
					p2.dependencies.logger.reportError(sduiErrorType.FailedToOpenLink, {
						name = sduiActionType.OpenExternalLink,
						message = if typeof(p3) == "string" then p3 else "Unknown reason"
					}, p2.appPage)
				end)
				dispatch(closeCentralOverlay())
			end
		}))
		
		return
	end
	p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		propName = "url",
		name = sduiActionType.OpenExternalLink,
		message = `Invalid or missing url: {url}`
	}, p2.appPage)
end