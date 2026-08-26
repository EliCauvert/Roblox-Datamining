local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local appPage = require(parent.RobloxAppEnums).AppPage
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiCounterName = sduiCoreSystemModule.SduiErrors.SduiCounterName
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

local function _()
	-- upvalues: getAppFeaturePolicies (ref)
	return getAppFeaturePolicies().getWebViewSupport()
end

return function(p1, p2, p3, p4)
	-- upvalues: urlBuilder (ref), sduiErrorType (ref), getAppFeaturePolicies (ref), fFlagSduiExperienceDetailsSupport (ref), appPage (ref), sduiCounterName (ref)
	local var1
	local ok, status = pcall(function()
		-- upvalues: urlBuilder (copy), p2 (ref)
		return urlBuilder.fromString(if string.find(p2, "/") == 1 then p2:gsub("/", "www:", 1) else p2)()
	end)
	local _ = nil
	
	if ok then
		var1 = status
	else
		var1 = p2
		p1.dependencies.logger.reportError(sduiErrorType.FailedtoParseUrl, {
			name = p2,
			message = if typeof(status) == "string" then status else "Unknown reason"
		}, p1.appPage)
	end
	local linkingProtocol = p1.dependencies.linkingProtocol
	local ok_1, status_1 = pcall(function()
		-- upvalues: linkingProtocol (ref), var1 (write), getAppFeaturePolicies (copy), p1 (ref), fFlagSduiExperienceDetailsSupport (copy), p3 (ref), p4 (ref), appPage (copy), sduiCounterName (copy)
		linkingProtocol:isURLRegistered(var1):andThen(function(p5)
			-- upvalues: linkingProtocol (copy), var1 (copy), getAppFeaturePolicies (copy), p1 (copy), fFlagSduiExperienceDetailsSupport (copy), p3 (copy), p4 (copy), appPage (copy), sduiCounterName (copy)
			if p5 then
				linkingProtocol:detectURL(var1)
				
				return
			elseif not getAppFeaturePolicies().getWebViewSupport() then
				p1.dependencies.logger.reportCounter(sduiCounterName.WebViewNotSupportedForLink, { name = var1 })
				
				return
			end
			local navigation = p1.dependencies.getNavigation()
			local var2 = if fFlagSduiExperienceDetailsSupport then { titleKey = p3 } else nil
			
			if fFlagSduiExperienceDetailsSupport and var2 and p4 then
				function var3.onClose()
					-- upvalues: p4 (copy)
					p4()
				end
			end
			navigation.navigate(appPage.GenericWebPage, {
				detail = var1,
				extraProps = if fFlagSduiExperienceDetailsSupport then var2 else nil
			})
		end)
	end)
	
	if not ok_1 then
		p1.dependencies.logger.reportError(sduiErrorType.FailedToOpenLink, {
			name = p2,
			message = if typeof(status_1) == "string" then status_1 else "Unknown reason"
		}, p1.appPage)
	end
end