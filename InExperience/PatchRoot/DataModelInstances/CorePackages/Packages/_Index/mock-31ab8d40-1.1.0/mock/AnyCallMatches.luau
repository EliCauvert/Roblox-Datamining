local getCallsModule = require(script.Parent.getCalls)
local cmpLiteralArgsModule = require(script.Parent.cmpLiteralArgs)
local cmpPredicateArgsModule = require(script.Parent.cmpPredicateArgs)
local fmtArgsModule = require(script.Parent.fmtArgs)
local t = {
	args = function(p1, p2)
		-- upvalues: getCallsModule (ref), fmtArgsModule (ref)
		local var1 = getCallsModule(p1)
		local var5Count = #var1
		
		if var5Count == 0 then
			return false, "mock was not called"
		end
		local var2
		local _ = nil
		
		for i = 1, var5Count do
			local _ = nil
			local var3, var4 = p2(var1[i].args)
			var2 = var4
			
			if not var3 then
				continue
			end
			return true
		end
		if not var2 then
			var2 = fmtArgsModule(var1[var5Count].args) .. " did not match"
		end
		if var5Count > 1 then
			var2 ..= " (+" .. var5Count - 1 .. " other calls)"
		end
		return false, var2
	end
}

function t.literals(p3, ...)
	-- upvalues: t (ref), cmpLiteralArgsModule (ref)
	local packed = table.pack(...)
	
	return t.args(p3, function(p4)
		-- upvalues: cmpLiteralArgsModule (copy), packed (ref)
		return cmpLiteralArgsModule(packed, p4)
	end)
end

function t.predicates(p3, ...)
	-- upvalues: t (ref), cmpPredicateArgsModule (ref)
	local packed = table.pack(...)
	
	return t.args(p3, function(p4)
		-- upvalues: cmpPredicateArgsModule (copy), packed (ref)
		return cmpPredicateArgsModule(packed, p4)
	end)
end

return t