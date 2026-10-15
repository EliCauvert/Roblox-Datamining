local parent = script.Parent.Parent
local APIUtilModule = require(parent.util.APIUtil)
local _ = require(parent.util.Types)
local getFFlagUGCValidateDescendantIdsPublishedModule = require(parent.flags.getFFlagUGCValidateDescendantIdsPublished)
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local var1 = `https://apis.{APIUtilModule.getBaseDomain()}assets/rcc/v1/assets/`

return {
	getVersion = function(p1, p2)
		-- upvalues: httpService (ref), httpRbxApiService (ref), var1 (ref)
		return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(`{var1}{p1}/versions/{p2 or httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(var1 .. p0)).revisionId}`))
	end,
	shouldReturnOnLoadFailure = function(p1)
		-- upvalues: getFFlagUGCValidateDescendantIdsPublishedModule (ref)
		return getFFlagUGCValidateDescendantIdsPublishedModule() and (p1.universeId == nil and (p1.token == nil and not p1.allowEditableInstances))
	end
}