local HttpService = game:GetService("HttpService")

local function _(Text: string): string
	local Replaced = string.gsub(Text, "\n\"", "\n`")
	
	return if Replaced.sub(Replaced, 1, 1) == "\"" then "`" .. string.sub(Replaced, 2) else Replaced
end

local _ = function(Text: string): string
	local Replaced = string.gsub(Text, "\"\n", "`\n")
	
	return if Replaced.sub(Replaced, -1) == "\"" then string.sub(Replaced, 1, -2) .. "`" else Replaced
end

return {
	inspectStr = function(Input): string
		-- upvalues: HttpService (copy)
		if Input == nil then
			return "nil"
		else
			local Replaced = string.gsub(HttpService:JSONEncode(Input), "\n\"", "\n`")
			local Replaced1 = string.gsub(if Replaced.sub(Replaced, 1, 1) == "\"" then "`" .. string.sub(Replaced, 2) else Replaced, "\"\n", "`\n")
			
			return (string.gsub(string.gsub(if Replaced1.sub(Replaced1, -1) == "\"" then string.sub(Replaced1, 1, -2) .. "`" else Replaced1, "\\\"", "\""), "\\\\", "\\"))
		end
	end
}