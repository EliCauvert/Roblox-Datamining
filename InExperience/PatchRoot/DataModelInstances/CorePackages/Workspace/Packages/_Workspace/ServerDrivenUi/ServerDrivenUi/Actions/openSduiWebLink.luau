local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AppPage = require(Parent.RobloxAppEnums).AppPage
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local DeepLinkSource = require(Parent.LinkingProtocol).Enums.DeepLinkSource
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiCounterName = SduiCoreSystemModule.SduiErrors.SduiCounterName

local function _()
	-- upvalues: GetAppFeaturePoliciesFunction (copy)
	return GetAppFeaturePoliciesFunction().getWebViewSupport()
end

return function(p1, Text, TitleKey, Callback)
	-- upvalues: UrlBuilder (copy), SduiErrorType (copy), DeepLinkSource (copy), GetAppFeaturePoliciesFunction (copy), AppPage (copy), SduiCounterName (copy)
	local Success, Result = pcall(function()
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
	local Success1, Result1 = pcall(function()
		-- upvalues: LinkingProtocol (copy), Detail (ref), DeepLinkSource (upval), GetAppFeaturePoliciesFunction (upval), p1 (copy), TitleKey (copy), Callback (copy), AppPage (upval), SduiCounterName (upval)
		LinkingProtocol:isURLRegistered(Detail):andThen(function(Result)
			-- upvalues: LinkingProtocol (upval), Detail (upval), DeepLinkSource (upval), GetAppFeaturePoliciesFunction (upval), p1 (upval), TitleKey (upval), Callback (upval), AppPage (upval), SduiCounterName (upval)
			if not Result then
				if not GetAppFeaturePoliciesFunction().getWebViewSupport() then
					p1.dependencies.logger.reportCounter(SduiCounterName.WebViewNotSupportedForLink, { name = Detail })
					
					return
				end
				local Navigation = p1.dependencies.getNavigation()
				local ExtraProps = { titleKey = TitleKey }
				
				if Callback then
					function ExtraProps.onClose()
						-- upvalues: Callback (upval)
						Callback()
					end
				end
				Navigation.navigate(AppPage.GenericWebPage, { detail = Detail, extraProps = ExtraProps })
				
				return
			elseif LinkingProtocol:isInternalDlicEnabled() then
				LinkingProtocol:detectDeeplinkIntent((LinkingProtocol:createInternalDlic(Detail, DeepLinkSource.LuaInternal)))
				
				return
			else
				LinkingProtocol:detectURL(Detail)
			end
		end)
	end)
	
	if not Success1 then
		p1.dependencies.logger.reportError(SduiErrorType.FailedToOpenLink, {
			name = Text,
			message = if typeof(Result1) == "string" then Result1 else "Unknown reason"
		}, p1.appPage)
	end
end