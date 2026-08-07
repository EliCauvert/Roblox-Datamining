-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local getCallsModule = require(script.Parent.getCalls)
local cmpLiteralArgsModule = require(script.Parent.cmpLiteralArgs)
local cmpPredicateArgsModule = require(script.Parent.cmpPredicateArgs)
local fmtArgsModule = require(script.Parent.fmtArgs)
local t = {
	args = function(p0, p1) --[[ line: 10 ]]
		-- upvalues: getCallsModule (ref), fmtArgsModule (ref)
		local var5 = getCallsModule(p0)
		local var5Count = #var5
		
		if var5Count == 0 then
			return false, "mock was not called"
		end
		local var9
		local _ = nil
		
		for i = 1, var5Count do
			local _ = nil
			local var7, var8 = p1(var5[i].args)
			var9 = var8
			
			if not var7 then
				continue
			end
			return true
		end
		if not var9 then
			var9 = fmtArgsModule(var5[var5Count].args) .. " did not match"
		end
		if var5Count > 1 then
			var9 ..= " (+" .. var5Count - 1 .. " other calls)"
		end
		return false, var9
	end
}

function t.literals(p2, ...) --[[ line: 36 ]]
	-- upvalues: t (ref), cmpLiteralArgsModule (ref)
	local packed = table.pack(...)
	
	return t.args(p2, function(p3) --[[ line: 38 ]]
		-- upvalues: cmpLiteralArgsModule (copy), packed (ref)
		return cmpLiteralArgsModule(packed, p3)
	end)
end

function t.predicates(p4, ...) --[[ line: 43 ]]
	-- upvalues: t (ref), cmpPredicateArgsModule (ref)
	local packed = table.pack(...)
	
	return t.args(p4, function(p5) --[[ line: 45 ]]
		-- upvalues: cmpPredicateArgsModule (copy), packed (ref)
		return cmpPredicateArgsModule(packed, p5)
	end)
end

return t