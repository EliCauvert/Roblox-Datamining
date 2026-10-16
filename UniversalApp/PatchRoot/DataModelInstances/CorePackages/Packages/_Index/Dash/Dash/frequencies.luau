local Parent = script.Parent
local _ = require(Parent.Types)
local ReduceModule = require(Parent.reduce)

return function(p1, Callback) --[[ Line: 31 | Named "frequencies" ]]
	-- upvalues: ReduceModule (copy)
	return ReduceModule(p1, function(p2, p3, p4) --[[ Line: 32 ]]
		-- upvalues: Callback (copy)
		local CallbackResult = if Callback then Callback(p3, p4) else p3
		
		if p2[CallbackResult] == nil then
			p2[CallbackResult] = 1
			
			return p2
		else
			p2[CallbackResult] += 1
			
			return p2
		end
	end, {})
end