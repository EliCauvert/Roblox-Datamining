local HttpService = game:GetService("HttpService")

return function(Text: string, Input): string
	-- upvalues: HttpService (copy)
	if Input == nil or Input == "" then
		return Text
	else
		local FoundAt: number? = string.find(Text, "#", 1, true)
		local Text1: string = if FoundAt == nil then Text else string.sub(Text, 1, FoundAt - 1)
		local Segment: string = if FoundAt == nil then "" else string.sub(Text, FoundAt)
		
		return if string.match(Text1, "[?&]analyticsSessionId=") == nil then `{Text1}{if string.find(Text1, "?", 1, true) == nil then "?" else "&"}analyticsSessionId={HttpService:UrlEncode(Input)}{Segment}` else Text
	end
end