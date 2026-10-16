local Parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local _ = require(Parent.Chrome)
local ReactModule = require(Parent.React)

return function(p1) --[[ Line: 12 | Named "useNotificationCount" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(not p1:isEmpty())
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p1:get().value or 0)
	ReactModule.useEffect(function() --[[ Line: 16 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseBindingResult2 (copy)
		p1:connect(function(p2) --[[ Line: 17 ]]
			-- upvalues: p1 (upval), UseStateResult2 (upval), UseBindingResult2 (upval)
			if p1:isEmpty() then
				UseStateResult2(false)
				
				return
			else
				UseBindingResult2((math.min(p2.value, 99)))
				UseStateResult2(true)
			end
		end)
	end, { p1 })
	
	return UseStateResult, UseBindingResult
end