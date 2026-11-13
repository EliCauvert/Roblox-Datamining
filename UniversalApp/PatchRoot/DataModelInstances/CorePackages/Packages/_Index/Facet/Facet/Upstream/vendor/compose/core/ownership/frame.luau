local _ = require("../host")
local OwnerModule = require("./owner")

return function(p1, Callback, p2)
	-- upvalues: OwnerModule (copy)
	local v1 = nil
	
	local function stop()
		-- upvalues: v1 (ref)
		local Callback: () -> () = v1
		v1 = nil
		
		if Callback then
			Callback()
		end
	end
	
	OwnerModule.own(p1, stop)
	
	return {
		start = function()
			-- upvalues: v1 (ref), OwnerModule (upval), p1 (copy), Callback (copy), p2 (copy)
			if v1 == nil and not OwnerModule.isDisposed(p1) then
				v1 = Callback(p2)
			end
		end,
		stop = stop
	}
end