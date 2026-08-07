-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:36 2026 Pacific Standard Time.

game:DefineFastString("UGCValidateAllowedLegOverlapMultiplier", "0.25")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidateAllowedLegOverlapMultiplier")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t