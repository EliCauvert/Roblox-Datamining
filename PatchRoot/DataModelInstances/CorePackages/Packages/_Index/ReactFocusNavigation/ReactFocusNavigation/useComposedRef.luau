-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:02 2026 Pacific Standard Time.

local reactModule = require(script.Parent.Parent.React)

local function _(p0, p1) --[[ line: 8 | named "forwardRefValue" ]]
	if type(p0) == "function" then
		p0(p1)
		
		return
	elseif type(p0) == "table" then
		p0.current = p1
	end
end

return function(p2, p3) --[[ line: 21 | named "useComposedRef" ]]
	-- upvalues: reactModule (ref)
	return reactModule.useCallback(function(p4) --[[ line: 22 ]]
		-- upvalues: p2 (ref), p3 (ref)
		if type(p2) == "function" then
			p2(p4)
		elseif type(p2) == "table" then
			p2.current = p4
		end
		if type(p3) == "function" then
			p3(p4)
			
			return
		elseif type(p3) == "table" then
			p3.current = p4
		end
	end, { p2, p3 })
end