local GetCallsModule = require(script.Parent.getCalls)
local CmpLiteralArgsModule = require(script.Parent.cmpLiteralArgs)
local CmpPredicateArgsModule = require(script.Parent.cmpPredicateArgs)
local FmtArgsModule = require(script.Parent.fmtArgs)
local AnyCallMatchesModule = {
	args = function(p1, Callback)
		-- upvalues: GetCallsModule (copy), FmtArgsModule (copy)
		local CallsModule = GetCallsModule(p1)
		local CountCallsModule = #CallsModule
		
		if CountCallsModule == 0 then
			return false, "mock was not called"
		end
		local Text: string? = nil
		
		for i = 1, CountCallsModule do
			local CallbackResult
			CallbackResult, Text = Callback(CallsModule[i].args)
			
			if CallbackResult then
				return true
			end
		end
		if not Text then
			Text = FmtArgsModule(CallsModule[CountCallsModule].args) .. " did not match"
		end
		if CountCallsModule > 1 then
			Text ..= " (+" .. CountCallsModule - 1 .. " other calls)"
		end
		return false, Text
	end
}

function AnyCallMatchesModule.literals(p2, ...)
	-- upvalues: AnyCallMatchesModule (copy), CmpLiteralArgsModule (copy)
	local Packed = table.pack(...)
	
	return AnyCallMatchesModule.args(p2, function(p3)
		-- upvalues: CmpLiteralArgsModule (upval), Packed (copy)
		return CmpLiteralArgsModule(Packed, p3)
	end)
end

function AnyCallMatchesModule.predicates(p2, ...)
	-- upvalues: AnyCallMatchesModule (copy), CmpPredicateArgsModule (copy)
	local Packed = table.pack(...)
	
	return AnyCallMatchesModule.args(p2, function(p3)
		-- upvalues: CmpPredicateArgsModule (upval), Packed (copy)
		return CmpPredicateArgsModule(Packed, p3)
	end)
end

return AnyCallMatchesModule