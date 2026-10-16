local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, _) --[[ Line: 24 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), CloseCentralOverlayFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenExternalLink
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local Url = ActionParams.url
	
	if typeof(Url) == "string" and Url ~= "" then
		local DispatchFunction: (any) -> () = p2.dependencies.dispatch
		local LinkingProtocol = p2.dependencies.linkingProtocol
		DispatchFunction(SetCentralOverlayFunction(CentralOverlayType.LeaveRobloxAlert, {
			continueFunc = function() --[[ Line: 53 ]]
				-- upvalues: LinkingProtocol (copy), Url (copy), p2 (copy), SduiErrorType (upval), SduiActionType (upval), DispatchFunction (copy), CloseCentralOverlayFunction (upval)
				LinkingProtocol:openURL(Url):catch(function(Err) --[[ Line: 54 ]]
					-- upvalues: p2 (upval), SduiErrorType (upval), SduiActionType (upval)
					p2.dependencies.logger.reportError(SduiErrorType.FailedToOpenLink, {
						name = SduiActionType.OpenExternalLink,
						message = if typeof(Err) == "string" then Err else "Unknown reason"
					}, p2.appPage)
				end)
				DispatchFunction(CloseCentralOverlayFunction())
			end
		}))
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "url",
			name = SduiActionType.OpenExternalLink,
			message = `Invalid or missing url: {Url}`
		}, p2.appPage)
	end
end