local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local appPage = require(parent.RobloxAppEnums).AppPage
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiCounterName = sduiCoreSystemModule.SduiErrors.SduiCounterName
local openSduiWebLinkModule = require(serverDrivenUi.Actions.openSduiWebLink)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiLinkActionSharedWebLink = sharedFlagsModule.FFlagSduiLinkActionSharedWebLink

local function _() --[[ line: 25 | named "isWebViewSupported" ]]
	-- upvalues: getAppFeaturePolicies (ref)
	return getAppFeaturePolicies().getWebViewSupport()
end

return function(p0, _, p1) --[[ line: 29 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiLinkActionSharedWebLink (ref), openSduiWebLinkModule (ref), urlBuilder (ref), getAppFeaturePolicies (ref), appPage (ref), sduiCounterName (ref)
	local var4 = if p0 then p0.actionParams else nil
	
	if var4 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.Link
		}, p1.appPage)
		
		return
	end
	assert(var4, "actionParams must exist")
	local url = var4.url
	local var5 = if fFlagSduiExperienceDetailsSupport then var4.titleKey else nil
	
	if typeof(url) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "url",
			name = sduiActionType.Link,
			message = `Invalid or missing url: {url}`
		}, p1.appPage)
		
		return
	elseif fFlagSduiLinkActionSharedWebLink then
		openSduiWebLinkModule(p1, url, var5, var4.onWebviewClose)
		
		return
	end
	local var6
	local ok, status = pcall(function() --[[ line: 62 ]]
		-- upvalues: urlBuilder (copy), url (ref)
		return urlBuilder.fromString(if string.find(url, "/") == 1 then url:gsub("/", "www:", 1) else url)()
	end)
	local _ = nil
	
	if ok then
		var6 = status
	else
		var6 = url
		p1.dependencies.logger.reportError(sduiErrorType.FailedtoParseUrl, {
			name = url,
			message = if typeof(status) == "string" then status else "Unknown reason"
		}, p1.appPage)
	end
	local linkingProtocol = p1.dependencies.linkingProtocol
	local ok_1, status_1 = pcall(function() --[[ line: 77 ]]
		-- upvalues: linkingProtocol (ref), var6 (write), getAppFeaturePolicies (copy), p1 (ref), fFlagSduiExperienceDetailsSupport (copy), var5 (ref), var4 (ref), appPage (copy), sduiCounterName (copy)
		linkingProtocol:isURLRegistered(var6):andThen(function(p2) --[[ line: 78 ]]
			-- upvalues: linkingProtocol (copy), var6 (copy), getAppFeaturePolicies (copy), p1 (copy), fFlagSduiExperienceDetailsSupport (copy), var5 (copy), var4 (copy), appPage (copy), sduiCounterName (copy)
			if p2 then
				linkingProtocol:detectURL(var6)
				
				return
			elseif not getAppFeaturePolicies().getWebViewSupport() then
				p1.dependencies.logger.reportCounter(sduiCounterName.WebViewNotSupportedForLink, { name = var6 })
				
				return
			end
			local navigation = p1.dependencies.getNavigation()
			local var8 = if fFlagSduiExperienceDetailsSupport then { titleKey = var5 } else nil
			
			if fFlagSduiExperienceDetailsSupport and var8 then
				local onWebviewClose = var4.onWebviewClose
				
				if onWebviewClose then
					function var8.onClose() --[[ line: 89 ]]
						-- upvalues: onWebviewClose (ref)
						onWebviewClose()
					end
				end
			end
			navigation.navigate(appPage.GenericWebPage, {
				detail = var6,
				extraProps = if fFlagSduiExperienceDetailsSupport then var8 else nil
			})
		end)
	end)
	
	if not ok_1 then
		p1.dependencies.logger.reportError(sduiErrorType.FailedToOpenLink, {
			name = url,
			message = if typeof(status_1) == "string" then status_1 else "Unknown reason"
		}, p1.appPage)
	end
end