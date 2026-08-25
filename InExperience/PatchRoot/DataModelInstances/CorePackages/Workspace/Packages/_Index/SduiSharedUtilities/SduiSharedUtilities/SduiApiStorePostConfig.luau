local httpService = game:GetService("HttpService")
local fFlagSduiClientTemplateCache = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.SharedFlags).FFlagSduiClientTemplateCache
local t = { Json = "Json", Proto = "Proto" }
local t_1 = {
	[t.Json] = "application/json",
	[t.Proto] = "application/x-protobuf"
}

return {
	SduiApiStorePostConfigContentType = t,
	getBodyFromPostConfig = function(p0)
		-- upvalues: t (ref), httpService (ref), fFlagSduiClientTemplateCache (ref)
		if p0.body then
			return if p0.contentType == t.Json then httpService:JSONEncode(p0.body) elseif fFlagSduiClientTemplateCache and p0.contentType == t.Proto then buffer.tostring(p0.protoMessage.encode(p0.body)) else nil
		end
	end,
	getContentTypeHeaderFromPostConfig = function(p1)
		-- upvalues: t_1 (ref)
		return if p1.contentType then t_1[p1.contentType] else nil
	end
}