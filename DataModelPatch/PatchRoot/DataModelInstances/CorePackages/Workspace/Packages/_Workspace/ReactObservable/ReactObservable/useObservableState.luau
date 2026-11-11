local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Observable)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1:get())
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		local Connection = p1:connect(function()
			-- upvalues: UseStateResult2 (upval), p1 (upval)
			UseStateResult2(p1:get())
		end, true)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, { p1 })
	
	return UseStateResult
end