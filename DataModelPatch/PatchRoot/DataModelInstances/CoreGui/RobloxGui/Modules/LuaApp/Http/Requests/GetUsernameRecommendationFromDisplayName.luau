local CorePackages = game:GetService("CorePackages")
local NewResult = require(CorePackages.Packages.UrlBuilder).UrlBuilder.new({
	path = "v1/validators/recommendedUsernameFromDisplayName",
	query = "DisplayName={displayName}&BirthDay={birthday}",
	base = require(CorePackages.Workspace.Packages.Http).Url.AUTH_URL
})

return function(Callback, DisplayName, Birthday)
	-- upvalues: NewResult (copy)
	return Callback(NewResult({ displayName = DisplayName, birthday = Birthday }), "GET", { maxRetryCount = 0 })
end