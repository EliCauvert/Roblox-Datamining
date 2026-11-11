local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AppPage = require(Parent.RobloxAppEnums).AppPage
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiCounterName = SduiCoreSystemModule.SduiErrors.SduiCounterName
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport

local function _()
	-- upvalues: GetAppFeaturePoliciesFunction (copy)
	return GetAppFeaturePoliciesFunction().getWebViewSupport()
end

return function(p1, Text, TitleKey, Callback)
	-- upvalues: UrlBuilder (copy), SduiErrorType (copy), GetAppFeaturePoliciesFunction (copy), FFlagSduiExperienceDetailsSupport (copy), AppPage (copy), SduiCounterName (copy)
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
		-- upvalues: LinkingProtocol (copy), Detail (ref), GetAppFeaturePoliciesFunction (upval), p1 (copy), FFlagSduiExperienceDetailsSupport (upval), TitleKey (copy), Callback (copy), AppPage (upval), SduiCounterName (upval)
		LinkingProtocol:isURLRegistered(Detail):andThen(function(Result)
			-- upvalues: LinkingProtocol (upval), Detail (upval), GetAppFeaturePoliciesFunction (upval), p1 (upval), FFlagSduiExperienceDetailsSupport (upval), TitleKey (upval), Callback (upval), AppPage (upval), SduiCounterName (upval)
			if Result then
				LinkingProtocol:detectURL(Detail)
				
				return
			end
			if not GetAppFeaturePoliciesFunction().getWebViewSupport() then
				p1.dependencies.logger.reportCounter(SduiCounterName.WebViewNotSupportedForLink, { name = Detail })
				
				return
			end
			local Navigation = p1.dependencies.getNavigation()
			local Config = if FFlagSduiExperienceDetailsSupport then { titleKey = TitleKey } else nil
			
			if FFlagSduiExperienceDetailsSupport and Config and Callback then
				function Config.onClose()
					-- upvalues: Callback (upval)
					Callback()
				end
			end
			Navigation.navigate(AppPage.GenericWebPage, {
				detail = Detail,
				extraProps = if FFlagSduiExperienceDetailsSupport then Config else nil
			})
		end)
	end)
	
	if not Success1 then
		p1.dependencies.logger.reportError(SduiErrorType.FailedToOpenLink, {
			name = Text,
			message = if typeof(Result1) == "string" then Result1 else "Unknown reason"
		}, p1.appPage)
	end
end