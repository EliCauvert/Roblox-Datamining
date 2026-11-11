local HttpModule = require(script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent.Http)

return function(Callback, p1, p2)
	-- upvalues: HttpModule (copy)
	return Callback(string.format("%sv2/users/%s/inventory?limit=100&sortOrder=Desc&assetTypes=Head&cursor=%s", HttpModule.Url.INVENTORY_URL, p1, p2 or ""), "GET")
end