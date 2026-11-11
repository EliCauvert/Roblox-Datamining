local Logging = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Logging
local config = {
	TermsOfService = true,
	PrivacyPolicy = true,
	RiderTerms = true,
	ChildrenPrivacyPolicy = true,
	LuobuThirdPartyDataUse = true,
	StudioTermsForVNGSKU = true
}
setmetatable(config, {
	__index = function(_, p1): boolean
		-- upvalues: Logging (copy)
		Logging.warn(string.format("Unknown User Agreement Type: %s", (tostring(p1))))
		
		return false
	end
})

return {
	CheckAgreementTypeExists = function(p1)
		-- upvalues: config (copy)
		return config[p1]
	end
}