local httpModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.Http)

local var1 = function(p0, _) --[[ line: 10 ]]
	-- upvalues: httpModule (ref)
	return p0(httpModule.Url.APIS_URL .. "sharelinks"):path("v1"):path("get-or-create-link"):body({ linkType = "Profile" })
end

return {
	profileLinkType = "Profile",
	buildUrl = var1,
	setupRequest = function(p1) --[[ line: 17 ]]
		-- upvalues: var1 (ref)
		return p1.POST(script.Name, var1)
	end
}