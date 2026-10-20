local Url = require(game:GetService("CorePackages").Workspace.Packages.Http).Url

return function(Callback, List, Size)
	-- upvalues: Url (copy)
	return Callback(string.format("%sv1/assets?%s", Url.THUMBNAILS_URL, (Url:makeQueryString({
		format = "png",
		assetIds = table.concat(List, ","),
		size = Size
	}))), "GET")
end