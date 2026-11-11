local HttpModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.Http)

local function BuildUrl(Callback)
	-- upvalues: HttpModule (copy)
	return Callback(HttpModule.Url.APIS_URL .. "sharelinks"):path("v1"):path("get-or-create-link"):body({ linkType = "Profile" })
end

return {
	profileLinkType = "Profile",
	buildUrl = BuildUrl,
	setupRequest = function(p1)
		-- upvalues: BuildUrl (copy)
		return p1.POST(script.Name, BuildUrl)
	end
}