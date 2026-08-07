local url = require(script.Parent.Parent.Http).Url

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: url (ref)
	return p0(`{url.APIS_URL}enhanced-video-experience-service/v1/serve-enhanced-video?universeId={p1}`, "GET")
end