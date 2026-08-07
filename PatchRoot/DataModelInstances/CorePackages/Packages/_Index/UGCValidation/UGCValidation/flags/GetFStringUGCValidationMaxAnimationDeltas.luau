-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:37 2026 Pacific Standard Time.

game:DefineFastString("UGCValidationMaxAnimationDeltas", "1.5")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidationMaxAnimationDeltas")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t