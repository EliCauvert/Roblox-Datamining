-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

local _ = script.Parent.Parent
local textService = game:GetService("TextService")

return function(p0) --[[ line: 5 ]]
	-- upvalues: textService (ref)
	local ok, status = pcall(function() --[[ line: 6 ]]
		-- upvalues: textService (copy), p0 (ref)
		return textService:GetTextSize("", 0, p0, Vector2.new(1e999, 1e999)).Y
	end)
	
	return ok, status
end