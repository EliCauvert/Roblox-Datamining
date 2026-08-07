-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:08 2026 Pacific Standard Time.

return {
	config = function(p0) --[[ line: 7 ]]
		p0 = p0 or {}
		local state = p0.state or {}
		
		return {
			dispatch = p0.dispatch or function(p1, p2) --[[ line: 12 ]]
				if type(p2) == "function" then
					p2(p1)
				end
			end,
			getState = function() --[[ line: 18 ]]
				-- upvalues: state (write)
				return state
			end,
			setState = function(_, p3) --[[ line: 22 ]]
				-- upvalues: state (write)
				state = p3
			end
		}
	end
}