local Parent = script:FindFirstAncestor("AppChat").Parent
local HttpClientModule = require(Parent.HttpClient)
local DecodeEmojiSetsModule = require(script.Parent.Parent.decodeEmojiSets)
local Text = require(Parent.Http).Url.APIS_URL .. "emoji-api/v1/get-emoji-sets?product=PlatformChat"

return function(Network)
	-- upvalues: HttpClientModule (copy), Text (copy), DecodeEmojiSetsModule (copy)
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "app-chat.get-emoji-sets",
		url = Text,
		network = Network,
		decode = DecodeEmojiSetsModule
	})
end