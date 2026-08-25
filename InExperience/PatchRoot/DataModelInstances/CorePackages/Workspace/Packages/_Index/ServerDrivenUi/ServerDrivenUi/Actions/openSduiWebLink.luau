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

return function(p0, p1, p2, p3)
	-- upvalues: urlBuilder (ref), sduiErrorType (ref), getAppFeaturePolicies (ref), fFlagSduiExperienceDetailsSupport (ref), appPage (ref), sduiCounterName (ref)
	local var1
	local ok, status = pcall(function()
		-- upvalues: urlBuilder (copy), p1 (ref)
		return urlBuilder.fromString(if string.find(p1, "/") == 1 then p1:gsub("/", "www:", 1) else p1)()
	end)
	local _ = nil
	
	if ok then
		var1 = status
	else
		var1 = p1
		p0.dependencies.logger.reportError(sduiErrorType.FailedtoParseUrl, {
			name = p1,
			message = if typeof(status) == "string" then status else "Unknown reason"
		}, p0.appPage)
	end
	local linkingProtocol = p0.dependencies.linkingProtocol
	local ok_1, status_1 = pcall(function()
		-- upvalues: linkingProtocol (ref), var1 (write), getAppFeaturePolicies (copy), p0 (ref), fFlagSduiExperienceDetailsSupport (copy), p2 (ref), p3 (ref), appPage (copy), sduiCounterName (copy)
		linkingProtocol:isURLRegistered(var1):andThen(function(p4)
			-- upvalues: linkingProtocol (copy), var1 (copy), getAppFeaturePolicies (copy), p0 (copy), fFlagSduiExperienceDetailsSupport (copy), p2 (copy), p3 (copy), appPage (copy), sduiCounterName (copy)
			if p4 then
				linkingProtocol:detectURL(var1)
				
				return
			elseif not getAppFeaturePolicies().getWebViewSupport() then
				p0.dependencies.logger.reportCounter(sduiCounterName.WebViewNotSupportedForLink, { name = var1 })
				
				return
			end
			local navigation = p0.dependencies.getNavigation()
			local var3 = if fFlagSduiExperienceDetailsSupport then { titleKey = p2 } else nil
			
			if fFlagSduiExperienceDetailsSupport and var3 and p3 then
				function var3.onClose()
					-- upvalues: p3 (copy)
					p3()
				end
			end
			navigation.navigate(appPage.GenericWebPage, {
				detail = var1,
				extraProps = if fFlagSduiExperienceDetailsSupport then var3 else nil
			})
		end)
	end)
	
	if not ok_1 then
		p0.dependencies.logger.reportError(sduiErrorType.FailedToOpenLink, {
			name = p1,
			message = if typeof(status_1) == "string" then status_1 else "Unknown reason"
		}, p0.appPage)
	end
end