local chrome = script:FindFirstAncestor("Chrome")
local reactModule = require(chrome.Parent.React)
local _ = require(chrome.Common.Types)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(if p1 == nil then nil else p1:get())
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref)
		if p1 == nil then return end
		local var3 = p1:connect(function(p2)
			-- upvalues: var2 (copy)
			var2(p2)
		end)
		
		if var1 ~= p1:get() then
			var2(p1:get())
		end
		return function()
			-- upvalues: var3 (ref)
			var3:disconnect()
		end
	end, { p1 })
	
	return var1
end