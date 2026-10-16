local httpService = game:GetService("HttpService")
local _ = require(script.Parent.Types)
local plainTextContentModelModule = require(script.Parent.ContentKinds.PlainText.PlainTextContentModel)

return {
	fromPlainText = function(p1, p2)
		-- upvalues: httpService (ref), plainTextContentModelModule (ref)
		return {
			id = httpService:GenerateGUID(false),
			sentAtUnixMilliseconds = if p2 then p2.sentAtUnixMilliseconds else DateTime.now().UnixTimestampMillis,
			author = if p2 then p2.author else nil,
			contents = { plainTextContentModelModule.fromText(p1) }
		}
	end
}