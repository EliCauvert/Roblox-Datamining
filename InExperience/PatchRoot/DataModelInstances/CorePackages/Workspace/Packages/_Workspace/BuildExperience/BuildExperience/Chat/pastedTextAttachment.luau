local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.chatTypes)

return {
	create = function(Text)
		-- upvalues: HttpService (copy)
		return {
			type = "resource",
			resource = {
				mimeType = "text/plain",
				uri = "pasted-text:" .. HttpService:GenerateGUID(false),
				text = Text
			}
		}
	end,
	getPastedText = function(p1)
		return if p1.type == "resource" and string.sub(p1.resource.uri, 1, 12) == "pasted-text:" then p1.resource.text else nil
	end,
	hasPastedText = function(List): boolean
		for _, value in List do
			if (if value.type == "resource" and string.sub(value.resource.uri, 1, 12) == "pasted-text:" then value.resource.text else nil) ~= nil then
				return true
			end
		end
		return false
	end
}