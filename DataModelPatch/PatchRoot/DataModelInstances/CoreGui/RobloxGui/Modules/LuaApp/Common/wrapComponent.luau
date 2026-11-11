local _ = require(game:GetService("CorePackages").Packages.React)

return function(Callback)
	return function(p1)
		-- upvalues: Callback (copy)
		return function(p2)
			-- upvalues: Callback (upval), p1 (copy)
			return Callback(p1, p2)
		end
	end
end