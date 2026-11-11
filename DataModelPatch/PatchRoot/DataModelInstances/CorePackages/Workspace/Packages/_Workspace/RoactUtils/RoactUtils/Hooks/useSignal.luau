local Parent = script:FindFirstAncestor("RoactUtils").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)

return function(p1, p2)
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p2 (copy)
		if not p1 then return end
		assert(p1 ~= nil, "signal is not nil")
		local Connection = p1:connect(p2)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, { p1, p2 })
end