-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:33 2026 Pacific Standard Time.

local httpService = game:GetService("HttpService")

local function _(p0) --[[ line: 11 | named "replaceLeadingQuote" ]]
	local replaced = string.gsub(p0, "\n\"", "\n`")
	
	return if replaced:sub(1, 1) == "\"" then "`" .. string.sub(replaced, 2) else replaced
end

local _ = function(p1) --[[ line: 19 | named "replaceTrailingQuote" ]]
	local replaced = string.gsub(p1, "\"\n", "`\n")
	
	return if replaced:sub(-1) == "\"" then string.sub(replaced, 1, -2) .. "`" else replaced
end

return {
	inspectStr = function(p2) --[[ line: 30 ]]
		-- upvalues: httpService (ref)
		if p2 == nil then
			return "nil"
		end
		local replaced = string.gsub(httpService:JSONEncode(p2), "\n\"", "\n`")
		local replaced_1 = string.gsub(if replaced:sub(1, 1) == "\"" then "`" .. string.sub(replaced, 2) else replaced, "\"\n", "`\n")
		
		return string.gsub(string.gsub(if replaced_1:sub(-1) == "\"" then string.sub(replaced_1, 1, -2) .. "`" else replaced_1, "\\\"", "\""), "\\\\", "\\")
	end
}