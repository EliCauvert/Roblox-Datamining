local Url = require(script.Parent.Parent.Http).Url

return function(Callback, p1) --[[ Line: 6 ]]
	-- upvalues: Url (copy)
	return Callback(`{Url.APIS_URL}enhanced-video-experience-service/v1/serve-enhanced-video?universeId={p1}`, "GET")
end