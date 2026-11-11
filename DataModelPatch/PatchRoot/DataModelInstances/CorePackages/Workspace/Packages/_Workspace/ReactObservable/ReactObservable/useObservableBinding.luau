local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Observable)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p1:get())
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseBindingResult2 (copy)
		local Connection = p1:connect(function()
			-- upvalues: UseBindingResult2 (upval), p1 (upval)
			UseBindingResult2(p1:get())
		end, true)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, { p1 })
	
	return UseBindingResult
end