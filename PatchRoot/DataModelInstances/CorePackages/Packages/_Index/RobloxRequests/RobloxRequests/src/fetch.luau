-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:04 2026 Pacific Standard Time.

local promiseModule = require(script.Parent.Parent.Parent.Promise)

function createFetch(p0) --[[ line: 9 ]]
	-- upvalues: promiseModule (ref)
	return function(p1, p2) --[[ line: 10 | named "fetch" ]]
		-- upvalues: p0 (ref), promiseModule (copy)
		if p2 == nil then
			p2 = {}
		end
		local method = p2.method or "GET"
		p2.method = nil
		p2.data = p2.body
		p2.body = nil
		
		return p0(method, p1, p2):andThen(function(p3) --[[ line: 19 ]]
			-- upvalues: promiseModule (copy)
			local text = p3.text
			
			function p3.text() --[[ line: 21 ]]
				-- upvalues: promiseModule (copy), text (ref)
				return promiseModule.resolve(text)
			end
			
			p3.status = p3.code
			
			return p3
		end)
	end
end

return createFetch