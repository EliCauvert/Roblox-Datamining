local httpModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.Http)

local var1 = function(p1, _)
	-- upvalues: httpModule (ref)
	return p1(httpModule.Url.APIS_URL .. "sharelinks"):path("v1"):path("get-or-create-link"):body({ linkType = "Profile" })
end

return {
	profileLinkType = "Profile",
	buildUrl = var1,
	setupRequest = function(p1)
		-- upvalues: var1 (ref)
		return p1.POST(script.Name, var1)
	end
}