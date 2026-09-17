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
local fFlagSduiLinkActionSharedWebLink = require(parent.SharedFlags).FFlagSduiLinkActionSharedWebLink

local function _()
	-- upvalues: getAppFeaturePolicies (ref)
	return getAppFeaturePolicies().getWebViewSupport()
end

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagSduiLinkActionSharedWebLink (ref), openSduiWebLinkModule (ref), urlBuilder (ref), getAppFeaturePolicies (ref), appPage (ref), sduiCounterName (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.Link
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local url = var1.url
	local titleKey = var1.titleKey
	
	if typeof(url) ~= "string" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "url",
			name = sduiActionType.Link,
			message = `Invalid or missing url: {url}`
		}, p2.appPage)
		
		return
	elseif fFlagSduiLinkActionSharedWebLink then
		openSduiWebLinkModule(p2, url, titleKey, var1.onWebviewClose)
		
		return
	end
	local var2
	local ok, status = pcall(function()
		-- upvalues: urlBuilder (copy), url (ref)
		return urlBuilder.fromString(if string.find(url, "/") == 1 then url:gsub("/", "www:", 1) else url)()
	end)
	local _ = nil
	
	if ok then
		var2 = status
	else
		var2 = url
		p2.dependencies.logger.reportError(sduiErrorType.FailedtoParseUrl, {
			name = url,
			message = if typeof(status) == "string" then status else "Unknown reason"
		}, p2.appPage)
	end
	local linkingProtocol = p2.dependencies.linkingProtocol
	local ok_1, status_1 = pcall(function()
		-- upvalues: linkingProtocol (ref), var2 (write), getAppFeaturePolicies (copy), p2 (ref), titleKey (ref), var1 (ref), appPage (copy), sduiCounterName (copy)
		linkingProtocol:isURLRegistered(var2):andThen(function(p3)
			-- upvalues: linkingProtocol (copy), var2 (copy), getAppFeaturePolicies (copy), p2 (copy), titleKey (copy), var1 (copy), appPage (copy), sduiCounterName (copy)
			if p3 then
				linkingProtocol:detectURL(var2)
				
				return
			elseif not getAppFeaturePolicies().getWebViewSupport() then
				p2.dependencies.logger.reportCounter(sduiCounterName.WebViewNotSupportedForLink, { name = var2 })
				
				return
			end
			local navigation = p2.dependencies.getNavigation()
			local t = { titleKey = titleKey }
			local onWebviewClose = var1.onWebviewClose
			
			if onWebviewClose then
				function t.onClose()
					-- upvalues: onWebviewClose (ref)
					onWebviewClose()
				end
			end
			navigation.navigate(appPage.GenericWebPage, { detail = var2, extraProps = t })
		end)
	end)
	
	if not ok_1 then
		p2.dependencies.logger.reportError(sduiErrorType.FailedToOpenLink, {
			name = url,
			message = if typeof(status_1) == "string" then status_1 else "Unknown reason"
		}, p2.appPage)
	end
end