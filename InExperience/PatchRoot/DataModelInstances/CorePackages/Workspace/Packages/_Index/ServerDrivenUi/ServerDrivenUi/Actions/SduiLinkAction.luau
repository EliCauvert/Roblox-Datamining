local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AppPage = require(Parent.RobloxAppEnums).AppPage
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiCounterName = SduiCoreSystemModule.SduiErrors.SduiCounterName
local OpenSduiWebLinkModule = require(ServerDrivenUi.Actions.openSduiWebLink)
local FFlagSduiLinkActionSharedWebLink = require(Parent.SharedFlags).FFlagSduiLinkActionSharedWebLink

local function _() --[[ Line: 24 | Named "isWebViewSupported" ]]
	-- upvalues: GetAppFeaturePoliciesFunction (copy)
	return GetAppFeaturePoliciesFunction().getWebViewSupport()
end

return function(p1, _, p2) --[[ Line: 28 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), FFlagSduiLinkActionSharedWebLink (copy), OpenSduiWebLinkModule (copy), UrlBuilder (copy), GetAppFeaturePoliciesFunction (copy), AppPage (copy), SduiCounterName (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.Link
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local Url = ActionParams.url
	local TitleKey = ActionParams.titleKey
	
	if typeof(Url) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "url",
			name = SduiActionType.Link,
			message = `Invalid or missing url: {Url}`
		}, p2.appPage)
		
		return
	end
	if FFlagSduiLinkActionSharedWebLink then
		OpenSduiWebLinkModule(p2, Url, TitleKey, ActionParams.onWebviewClose)
		
		return
	end
	local Success, Result = pcall(function() --[[ Line: 61 ]]
		-- upvalues: UrlBuilder (upval), Url (copy)
		return UrlBuilder.fromString(if string.find(Url, "/") == 1 then Url:gsub("/", "www:", 1) else Url)()
	end)
	local Detail = nil
	
	if Success then
		Detail = Result
	else
		Detail = Url
		p2.dependencies.logger.reportError(SduiErrorType.FailedtoParseUrl, {
			name = Url,
			message = if typeof(Result) == "string" then Result else "Unknown reason"
		}, p2.appPage)
	end
	local LinkingProtocol = p2.dependencies.linkingProtocol
	local Success1, Result1 = pcall(function() --[[ Line: 76 ]]
		-- upvalues: LinkingProtocol (copy), Detail (ref), GetAppFeaturePoliciesFunction (upval), p2 (copy), TitleKey (copy), ActionParams (copy), AppPage (upval), SduiCounterName (upval)
		LinkingProtocol:isURLRegistered(Detail):andThen(function(Result) --[[ Line: 77 ]]
			-- upvalues: LinkingProtocol (upval), Detail (upval), GetAppFeaturePoliciesFunction (upval), p2 (upval), TitleKey (upval), ActionParams (upval), AppPage (upval), SduiCounterName (upval)
			if Result then
				LinkingProtocol:detectURL(Detail)
				
				return
			end
			if not GetAppFeaturePoliciesFunction().getWebViewSupport() then
				p2.dependencies.logger.reportCounter(SduiCounterName.WebViewNotSupportedForLink, { name = Detail })
				
				return
			end
			local Navigation = p2.dependencies.getNavigation()
			local ExtraProps = { titleKey = TitleKey }
			local OnWebviewCloseFunction = ActionParams.onWebviewClose
			
			if OnWebviewCloseFunction then
				function ExtraProps.onClose() --[[ Line: 85 ]]
					-- upvalues: OnWebviewCloseFunction (copy)
					OnWebviewCloseFunction()
				end
			end
			Navigation.navigate(AppPage.GenericWebPage, { detail = Detail, extraProps = ExtraProps })
		end)
	end)
	
	if not Success1 then
		p2.dependencies.logger.reportError(SduiErrorType.FailedToOpenLink, {
			name = Url,
			message = if typeof(Result1) == "string" then Result1 else "Unknown reason"
		}, p2.appPage)
	end
end