local url = require(script.Parent.Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref)
	return p1(`{url.APIS_URL}enhanced-video-experience-service/v1/serve-enhanced-video?universeId={p2}`, "GET")
end