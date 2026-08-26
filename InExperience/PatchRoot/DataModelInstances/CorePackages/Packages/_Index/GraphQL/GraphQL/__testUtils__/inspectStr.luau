local httpService = game:GetService("HttpService")

local function _(p1)
	local replaced = string.gsub(p1, "\n\"", "\n`")
	
	return if replaced:sub(1, 1) == "\"" then "`" .. string.sub(replaced, 2) else replaced
end

local _ = function(p1)
	local replaced = string.gsub(p1, "\"\n", "`\n")
	
	return if replaced:sub(-1) == "\"" then string.sub(replaced, 1, -2) .. "`" else replaced
end

return {
	inspectStr = function(p1)
		-- upvalues: httpService (ref)
		if p1 == nil then
			return "nil"
		end
		local replaced = string.gsub(httpService:JSONEncode(p1), "\n\"", "\n`")
		local replaced_1 = string.gsub(if replaced:sub(1, 1) == "\"" then "`" .. string.sub(replaced, 2) else replaced, "\"\n", "`\n")
		
		return string.gsub(string.gsub(if replaced_1:sub(-1) == "\"" then string.sub(replaced_1, 1, -2) .. "`" else replaced_1, "\\\"", "\""), "\\\\", "\\")
	end
}