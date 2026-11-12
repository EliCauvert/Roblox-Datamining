local Parent = script.Parent.Parent
local APIUtilModule = require(Parent.util.APIUtil)
local _ = require(Parent.util.Types)
local GetFFlagUGCValidateDescendantIdsPublishedModule = require(Parent.flags.getFFlagUGCValidateDescendantIdsPublished)
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Url: string = `https://apis.{APIUtilModule.getBaseDomain()}assets/rcc/v1/assets/`
local UnpublishedDependenciesModule = {
	getLatestVersionNumber = function(Text)
		-- upvalues: HttpService (copy), HttpRbxApiService (copy), Url (copy)
		local RevisionId = HttpService:JSONDecode(HttpRbxApiService:GetAsyncFullUrl(Url .. Text)).revisionId
		
		return assert(tonumber(RevisionId), `Unexpected revisionId {RevisionId}`)
	end
}

function UnpublishedDependenciesModule.getVersion(p1, p2)
	-- upvalues: UnpublishedDependenciesModule (copy), HttpService (copy), HttpRbxApiService (copy), Url (copy)
	return HttpService:JSONDecode(HttpRbxApiService:GetAsyncFullUrl(`{Url}{p1}/versions/{p2 or UnpublishedDependenciesModule.getLatestVersionNumber(p1)}`))
end

function UnpublishedDependenciesModule.shouldReturnOnLoadFailure(p1): boolean
	-- upvalues: GetFFlagUGCValidateDescendantIdsPublishedModule (copy)
	return GetFFlagUGCValidateDescendantIdsPublishedModule() and (p1.universeId == nil and p1.token == nil and not p1.allowEditableInstances)
end

return UnpublishedDependenciesModule