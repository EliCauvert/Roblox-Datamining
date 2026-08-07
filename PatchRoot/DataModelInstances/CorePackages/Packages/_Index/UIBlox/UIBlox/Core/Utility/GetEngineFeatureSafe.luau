-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

return function(p0) --[[ line: 8 | named "GetEngineFeatureSafe" ]]
	local ok, status = pcall(function() --[[ line: 9 ]]
		-- upvalues: p0 (ref)
		return game:GetEngineFeature(p0)
	end)
	
	return ok and status
end