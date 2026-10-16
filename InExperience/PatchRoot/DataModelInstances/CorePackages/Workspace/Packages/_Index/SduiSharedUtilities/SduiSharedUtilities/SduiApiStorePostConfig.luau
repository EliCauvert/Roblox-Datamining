local HttpService = game:GetService("HttpService")
local SduiApiStorePostConfigContentType = { Json = "Json", Proto = "Proto" }
local config = {
	[SduiApiStorePostConfigContentType.Json] = "application/json",
	[SduiApiStorePostConfigContentType.Proto] = "application/x-protobuf"
}

return {
	SduiApiStorePostConfigContentType = SduiApiStorePostConfigContentType,
	getBodyFromPostConfig = function(p1) --[[ Line: 30 ]]
		-- upvalues: SduiApiStorePostConfigContentType (copy), HttpService (copy)
		if p1.body then
			if p1.contentType == SduiApiStorePostConfigContentType.Json then
				return HttpService:JSONEncode(p1.body)
			elseif p1.contentType == SduiApiStorePostConfigContentType.Proto then
				return buffer.tostring(p1.protoMessage.encode(p1.body))
			end
		end
		return nil
	end,
	getContentTypeHeaderFromPostConfig = function(p1) --[[ Line: 45 ]]
		-- upvalues: config (copy)
		return if p1.contentType then config[p1.contentType] else nil
	end
}