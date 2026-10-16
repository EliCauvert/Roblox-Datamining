local Chrome = script:FindFirstAncestor("Chrome")
local ReactModule = require(Chrome.Parent.React)
local _ = require(Chrome.Common.Types)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if p1 == nil then nil else p1:get())
	ReactModule.useEffect(function() --[[ Line: 14 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseStateResult (copy)
		if p1 == nil then return end
		local Connection = p1:connect(function(p2) --[[ Line: 19 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(p2)
		end)
		
		if UseStateResult ~= p1:get() then
			UseStateResult2(p1:get())
		end
		return function() --[[ Line: 29 ]]
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, { p1 })
	
	return UseStateResult
end