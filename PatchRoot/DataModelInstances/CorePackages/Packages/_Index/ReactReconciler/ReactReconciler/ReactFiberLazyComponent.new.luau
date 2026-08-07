-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:35 2026 Pacific Standard Time.

return {
	resolveDefaultProps = function(p0, p1) --[[ line: 14 ]]
		if not p0 or typeof(p0) ~= "table" or not p0.defaultProps then
			return p1
		end
		local cloned = table.clone(p1)
		local defaultProps = p0.defaultProps
		
		for i, v in defaultProps do
			if cloned[i] == nil then
				cloned[i] = defaultProps[i]
			end
		end
		return cloned
	end
}