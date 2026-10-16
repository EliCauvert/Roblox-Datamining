local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local GetFFlagUGCValidateDescendantIdsPublishedModule = require(Parent.flags.getFFlagUGCValidateDescendantIdsPublished)
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Url: string = `https://apis.{require(Parent.util.APIUtil).getBaseDomain()}assets/rcc/v1/assets/`

return {
	getVersion = function(Text, p1) --[[ Line: 22 ]]
		-- upvalues: HttpService (copy), HttpRbxApiService (copy), Url (copy)
		return HttpService:JSONDecode(HttpRbxApiService:GetAsyncFullUrl(`{Url}{Text}/versions/{p1 or HttpService:JSONDecode(HttpRbxApiService:GetAsyncFullUrl(Url .. Text)).revisionId}`))
	end,
	shouldReturnOnLoadFailure = function(p1): boolean --[[ Line: 30 ]]
		-- upvalues: GetFFlagUGCValidateDescendantIdsPublishedModule (copy)
		return GetFFlagUGCValidateDescendantIdsPublishedModule() and (p1.universeId == nil and p1.token == nil and not p1.allowEditableInstances)
	end
}