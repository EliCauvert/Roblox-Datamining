-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local textService = require(foundation.Utility.Wrappers).Services.TextService
local noYieldModule = require(foundation.Utility.noYield)

return function() --[[ line: 5 | named "getTextSizeOffset" ]]
	-- upvalues: noYieldModule (ref), textService (ref)
	return noYieldModule(function(p0, p1) --[[ line: 6 ]]
		-- upvalues: textService (copy)
		p0 = p0 or 0
		p1 = p1 or Font.fromEnum(Enum.Font.BuilderSans)
		local ok, status = pcall(function() --[[ line: 10 ]]
			-- upvalues: textService (copy), p0 (write), p1 (write)
			return textService:GetTextSizeOffsetAsync(p0, p1)
		end)
		
		return if ok then status else nil
	end)
end