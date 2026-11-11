local HttpService = game:GetService("HttpService")
local CharCodeAtFunction = require(script.Parent.Parent.String).charCodeAt
local ErrorModule = require(script.Parent.Error)

return function(Text)
	-- upvalues: CharCodeAtFunction (copy), ErrorModule (copy), HttpService (copy)
	local Length = utf8.len(Text)
	
	if Length == 0 or Length == nil then
		return ""
	end
	local CharCodeAtResult: number = CharCodeAtFunction(Text, 1)
	
	if Length == 1 then
		if CharCodeAtResult == 55296 then
			error(ErrorModule.new("URI malformed"))
		end
		if CharCodeAtResult == 57343 then
			error(ErrorModule.new("URI malformed"))
		end
	end
	if CharCodeAtResult >= 56320 and CharCodeAtResult < 57343 then
		error(ErrorModule.new("URI malformed"))
	end
	return (HttpService:UrlEncode(Text):gsub("%%2D", "-"):gsub("%%5F", "_"):gsub("%%2E", "."):gsub("%%21", "!"):gsub("%%7E", "~"):gsub("%%2A", "*"):gsub("%%27", "'"):gsub("%%28", "("):gsub("%%29", ")"))
end