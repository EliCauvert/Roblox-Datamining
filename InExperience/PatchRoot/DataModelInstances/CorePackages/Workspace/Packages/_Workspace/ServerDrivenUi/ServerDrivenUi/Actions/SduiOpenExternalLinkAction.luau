local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local FFlagSafetyResourceBannerTelemetry = require(Parent.SharedFlags).FFlagSafetyResourceBannerTelemetry
local SduiActionParams = SduiCoreSystemModule.SduiActionParams
local FFlagLuaAppSduiOpenExternalLinkSkipLeaveConfirmation = require(Parent.SharedFlags).FFlagLuaAppSduiOpenExternalLinkSkipLeaveConfirmation

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), FFlagSafetyResourceBannerTelemetry (copy), FFlagLuaAppSduiOpenExternalLinkSkipLeaveConfirmation (copy), SduiActionParams (copy), CloseCentralOverlayFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
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
	
	if typeof(Url) ~= "string" or Url == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "url",
			name = SduiActionType.OpenExternalLink,
			message = `Invalid or missing url: {Url}`
		}, p2.appPage)
		
		return
	end
	local DispatchFunction: (any) -> () = p2.dependencies.dispatch
	local LinkingProtocol = p2.dependencies.linkingProtocol
	local OnContinue = if FFlagSafetyResourceBannerTelemetry then ActionParams.onContinue else nil
	
	local function _()
		-- upvalues: LinkingProtocol (copy), Url (copy), p2 (copy), SduiErrorType (upval), SduiActionType (upval)
		LinkingProtocol:openURL(Url):catch(function(Err)
			-- upvalues: p2 (upval), SduiErrorType (upval), SduiActionType (upval)
			p2.dependencies.logger.reportError(SduiErrorType.FailedToOpenLink, {
				name = SduiActionType.OpenExternalLink,
				message = if typeof(Err) == "string" then Err else "Unknown reason"
			}, p2.appPage)
		end)
	end
	
	if FFlagLuaAppSduiOpenExternalLinkSkipLeaveConfirmation and SduiActionParams.getBooleanParam(ActionParams, "skipLeaveConfirmation", false) then
		LinkingProtocol:openURL(Url):catch(function(Err)
			-- upvalues: p2 (copy), SduiErrorType (upval), SduiActionType (upval)
			p2.dependencies.logger.reportError(SduiErrorType.FailedToOpenLink, {
				name = SduiActionType.OpenExternalLink,
				message = if typeof(Err) == "string" then Err else "Unknown reason"
			}, p2.appPage)
		end)
		
		return
	else
		DispatchFunction(SetCentralOverlayFunction(CentralOverlayType.LeaveRobloxAlert, {
			continueFunc = function()
				-- upvalues: LinkingProtocol (copy), Url (copy), p2 (copy), SduiErrorType (upval), SduiActionType (upval), DispatchFunction (copy), CloseCentralOverlayFunction (upval), FFlagSafetyResourceBannerTelemetry (upval), OnContinue (copy)
				LinkingProtocol:openURL(Url):catch(function(Err)
					-- upvalues: p2 (upval), SduiErrorType (upval), SduiActionType (upval)
					p2.dependencies.logger.reportError(SduiErrorType.FailedToOpenLink, {
						name = SduiActionType.OpenExternalLink,
						message = if typeof(Err) == "string" then Err else "Unknown reason"
					}, p2.appPage)
				end)
				DispatchFunction(CloseCentralOverlayFunction())
				
				if FFlagSafetyResourceBannerTelemetry and typeof(OnContinue) == "function" then
					local Success, Result = pcall(OnContinue)
					
					if not Success then
						p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
							name = SduiActionType.OpenExternalLink,
							message = `onContinue failed: {tostring(Result)}`
						}, p2.appPage)
					end
				end
			end
		}))
	end
end