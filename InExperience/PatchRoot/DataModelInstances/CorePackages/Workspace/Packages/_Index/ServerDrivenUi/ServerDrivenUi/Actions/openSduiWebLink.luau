local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AppPage = require(Parent.RobloxAppEnums).AppPage
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiCounterName = SduiCoreSystemModule.SduiErrors.SduiCounterName

local function _() --[[ Line: 15 | Named "isWebViewSupported" ]]
	-- upvalues: GetAppFeaturePoliciesFunction (copy)
	return GetAppFeaturePoliciesFunction().getWebViewSupport()
end

return function(p1, Text, TitleKey, Callback) --[[ Line: 22 | Named "openSduiWebLink" ]]
	-- upvalues: UrlBuilder (copy), SduiErrorType (copy), GetAppFeaturePoliciesFunction (copy), AppPage (copy), SduiCounterName (copy)
	local Success, Result = pcall(function() --[[ Line: 25 ]]
		-- upvalues: UrlBuilder (upval), Text (copy)
		return UrlBuilder.fromString(if string.find(Text, "/") == 1 then Text:gsub("/", "www:", 1) else Text)()
	end)
	local Detail = nil
	
	if Success then
		Detail = Result
	else
		Detail = Text
		p1.dependencies.logger.reportError(SduiErrorType.FailedtoParseUrl, {
			name = Text,
			message = if typeof(Result) == "string" then Result else "Unknown reason"
		}, p1.appPage)
	end
	local LinkingProtocol = p1.dependencies.linkingProtocol
	local Success1, Result1 = pcall(function() --[[ Line: 40 ]]
		-- upvalues: LinkingProtocol (copy), Detail (ref), GetAppFeaturePoliciesFunction (upval), p1 (copy), TitleKey (copy), Callback (copy), AppPage (upval), SduiCounterName (upval)
		LinkingProtocol:isURLRegistered(Detail):andThen(function(Result) --[[ Line: 41 ]]
			-- upvalues: LinkingProtocol (upval), Detail (upval), GetAppFeaturePoliciesFunction (upval), p1 (upval), TitleKey (upval), Callback (upval), AppPage (upval), SduiCounterName (upval)
			if Result then
				LinkingProtocol:detectURL(Detail)
				
				return
			end
			if not GetAppFeaturePoliciesFunction().getWebViewSupport() then
				p1.dependencies.logger.reportCounter(SduiCounterName.WebViewNotSupportedForLink, { name = Detail })
				
				return
			end
			local Navigation = p1.dependencies.getNavigation()
			local ExtraProps = { titleKey = TitleKey }
			
			if Callback then
				function ExtraProps.onClose() --[[ Line: 48 ]]
					-- upvalues: Callback (upval)
					Callback()
				end
			end
			Navigation.navigate(AppPage.GenericWebPage, { detail = Detail, extraProps = ExtraProps })
		end)
	end)
	
	if not Success1 then
		p1.dependencies.logger.reportError(SduiErrorType.FailedToOpenLink, {
			name = Text,
			message = if typeof(Result1) == "string" then Result1 else "Unknown reason"
		}, p1.appPage)
	end
end