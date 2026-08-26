local httpService = game:GetService("HttpService")
local charCodeAt = require(script.Parent.Parent.String).charCodeAt
local errorModule = require(script.Parent.Error)

return function(p1)
	-- upvalues: charCodeAt (ref), errorModule (ref), httpService (ref)
	local charCount = utf8.len(p1)
	
	if charCount == 0 or charCount == nil then
		return ""
	end
	local var1 = charCodeAt(p1, 1)
	
	if charCount == 1 then
		if var1 == 55296 then
			error(errorModule.new("URI malformed"))
		end
		if var1 == 57343 then
			error(errorModule.new("URI malformed"))
		end
	end
	if var1 >= 56320 and var1 < 57343 then
		error(errorModule.new("URI malformed"))
	end
	return httpService:UrlEncode(p1):gsub("%%2D", "-"):gsub("%%5F", "_"):gsub("%%2E", "."):gsub("%%21", "!"):gsub("%%7E", "~"):gsub("%%2A", "*"):gsub("%%27", "'"):gsub("%%28", "("):gsub("%%29", ")")
end