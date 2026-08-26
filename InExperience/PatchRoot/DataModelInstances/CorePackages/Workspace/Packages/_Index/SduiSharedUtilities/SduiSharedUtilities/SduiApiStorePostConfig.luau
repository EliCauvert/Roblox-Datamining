local httpService = game:GetService("HttpService")
local fFlagSduiClientTemplateCache = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.SharedFlags).FFlagSduiClientTemplateCache
local t = { Json = "Json", Proto = "Proto" }
local t_1 = {
	[t.Json] = "application/json",
	[t.Proto] = "application/x-protobuf"
}

return {
	SduiApiStorePostConfigContentType = t,
	getBodyFromPostConfig = function(p1)
		-- upvalues: t (ref), httpService (ref), fFlagSduiClientTemplateCache (ref)
		if p1.body then
			return if p1.contentType == t.Json then httpService:JSONEncode(p1.body) elseif fFlagSduiClientTemplateCache and p1.contentType == t.Proto then buffer.tostring(p1.protoMessage.encode(p1.body)) else nil
		end
	end,
	getContentTypeHeaderFromPostConfig = function(p1)
		-- upvalues: t_1 (ref)
		return if p1.contentType then t_1[p1.contentType] else nil
	end
}