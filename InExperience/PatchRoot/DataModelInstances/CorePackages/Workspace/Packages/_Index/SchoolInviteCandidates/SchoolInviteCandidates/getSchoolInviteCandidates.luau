local Parent = script.Parent
local Parent1 = Parent.Parent
local HttpClientModule = require(Parent1.HttpClient)
local UrlBase = require(Parent1.UrlBuilder).UrlBase
local _ = require(Parent.Types)
local VerificationName: string = `{UrlBase.APIS}/school-verification-api/v1/school-verification/invite-candidates`

return function(Network)
	-- upvalues: HttpClientModule (copy), VerificationName (copy)
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "school-verification.get-invite-candidates",
		url = VerificationName,
		network = Network,
		decode = function(p1)
			if type(p1) ~= "table" then
				error("invite-candidates response is not an object")
			end
			local List = {}
			
			for _, entry in p1.data do
				table.insert(List, { userId = tostring(entry.userId), invited = entry.invited })
			end
			return List
		end
	})))
end