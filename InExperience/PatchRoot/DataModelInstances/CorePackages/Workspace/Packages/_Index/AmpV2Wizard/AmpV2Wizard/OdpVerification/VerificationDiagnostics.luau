local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local _ = require(script.Parent.Types)

local function _(Text: string)
	return if typeof(Text) == "string" and #Text <= 128 and string.match(Text, "^[%w_%-]+$") then Text else nil
end

local _ = function(Text: string)
	if typeof(Text) ~= "string" or Text == "" then
		return nil, nil
	elseif #Text <= 2048 then
		return Text, false
	else
		return string.sub(Text, 1, utf8.offset(Text, 0, 2049) - 1), true
	end
end

return {
	beginAttempt = function(Text2: string, Method, Presentation, Text: string, Text1: string)
		-- upvalues: Players (copy), HttpService (copy)
		local LocalPlayer = Players.LocalPlayer
		
		return {
			schemaVersion = 1,
			attemptId = HttpService:GenerateGUID(false),
			flowId = if typeof(Text) == "string" and #Text <= 128 and string.match(Text, "^[%w_%-]+$") then Text else nil,
			analyticsSessionId = if typeof(Text1) == "string" and #Text1 <= 128 and string.match(Text1, "^[%w_%-]+$") then Text1 else nil,
			odpSessionId = if typeof(Text2) == "string" and #Text2 <= 128 and string.match(Text2, "^[%w_%-]+$") then Text2 else nil,
			childUserIdAtStart = if LocalPlayer and LocalPlayer.UserId > 0 then LocalPlayer.UserId else nil,
			method = Method,
			presentation = Presentation
		}
	end,
	completeFailure = function(Tbl, FailureOrigin, Text: string, p1, p2, Text1: string)
		local Copy = table.clone(Tbl)
		Copy.clientOccurredAtMs = DateTime.now().UnixTimestampMillis
		Copy.failureOrigin = FailureOrigin
		Copy.inquiryId = if typeof(Text) == "string" and #Text <= 128 and string.match(Text, "^[%w_%-]+$") then Text else nil
		
		if p1 then
			Copy.elapsedSinceNativeLaunchMs = math.max(0, (math.floor((os.clock() - p1) * 1000)))
		end
		if typeof(p2) == "EnumItem" then
			Copy.nativeResultType = p2.Name
		end
		local Segment = nil
		local DebugMessageTruncated = nil
		if typeof(Text1) == "string" and Text1 ~= "" then
			if #Text1 <= 2048 then
				Segment = Text1
				DebugMessageTruncated = false
			else
				Segment = string.sub(Text1, 1, utf8.offset(Text1, 0, 2049) - 1)
				DebugMessageTruncated = true
			end
		else
			Segment = nil
			DebugMessageTruncated = nil
		end
		Copy.debugMessage = Segment
		Copy.debugMessageTruncated = DebugMessageTruncated
		
		return Copy
	end
}