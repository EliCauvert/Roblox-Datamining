local UrlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(Callback) --[[ Line: 6 ]]
	-- upvalues: UrlBuilder (copy)
	return Callback(UrlBuilder.fromString("auth:v1/session/refresh")(), "POST", { postBody = "" })
end