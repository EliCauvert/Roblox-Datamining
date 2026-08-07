local httpService = game:GetService("HttpService")
local charCodeAt = require(script.Parent.Parent.String).charCodeAt
local errorModule = require(script.Parent.Error)

return function(p0) --[[ line: 25 | named "encodeURIComponent" ]]
	-- upvalues: charCodeAt (ref), errorModule (ref), httpService (ref)
	local charCount = utf8.len(p0)
	
	if charCount == 0 or charCount == nil then
		return ""
	end
	local var3 = charCodeAt(p0, 1)
	
	if charCount == 1 then
		if var3 == 55296 then
			error(errorModule.new("URI malformed"))
		end
		if var3 == 57343 then
			error(errorModule.new("URI malformed"))
		end
	end
	if var3 >= 56320 and var3 < 57343 then
		error(errorModule.new("URI malformed"))
	end
	return httpService:UrlEncode(p0):gsub("%%2D", "-"):gsub("%%5F", "_"):gsub("%%2E", "."):gsub("%%21", "!"):gsub("%%7E", "~"):gsub("%%2A", "*"):gsub("%%27", "'"):gsub("%%28", "("):gsub("%%29", ")")
end