local chrome = script:FindFirstAncestor("Chrome")
local reactModule = require(chrome.Parent.React)
local _ = require(chrome.Common.Types)

return function(p0) --[[ line: 11 ]]
	-- upvalues: reactModule (ref)
	local var2, var3 = reactModule.useState(if p0 == nil then nil else p0:get())
	reactModule.useEffect(function() --[[ line: 14 ]]
		-- upvalues: p0 (ref), var3 (ref), var2 (ref)
		if p0 == nil then return end
		local var4 = p0:connect(function(p1) --[[ line: 19 ]]
			-- upvalues: var3 (copy)
			var3(p1)
		end)
		
		if var2 ~= p0:get() then
			var3(p0:get())
		end
		return function() --[[ line: 29 ]]
			-- upvalues: var4 (ref)
			var4:disconnect()
		end
	end, { p0 })
	
	return var2
end