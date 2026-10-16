local _ = require(script.Parent.Types)

return function(Callback1, Callback) --[[ Line: 26 | Named "memoize" ]]
	local t = {}
	
	return function(...) --[[ Line: 29 ]]
		-- upvalues: Callback (copy), t (copy), Callback1 (copy)
		local List = { ... }
		local CallbackResult = if Callback then Callback(...) else table.concat(List, "|")
		
		if t[CallbackResult] == nil then
			t[CallbackResult] = Callback1(...)
		end
		return t[CallbackResult]
	end
end