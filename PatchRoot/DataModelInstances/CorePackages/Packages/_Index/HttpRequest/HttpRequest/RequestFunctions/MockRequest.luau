-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

local cryoModule = require(script:FindFirstAncestor("HttpRequest").Parent.Cryo)

return function(p0, p1, p2) --[[ line: 4 ]]
	-- upvalues: cryoModule (ref)
	return {
		Start = function(_, p3) --[[ line: 6 ]]
			-- upvalues: p2 (ref), cryoModule (copy), p0 (ref), p1 (ref)
			local t = {}
			
			if type(p2.mockResponse) == "function" then
				t = p2.mockResponse()
			elseif p2.mockResponse then
				t = p2.mockResponse
			end
			p3(p2.success, cryoModule.Dictionary.join({ Url = p0, Method = p1 }, t))
		end,
		Cancel = function() --[[ line: 21 ]]
			-- upvalues: p2 (ref)
			if p2.cancel then
				p2.cancel()
			end
		end
	}
end