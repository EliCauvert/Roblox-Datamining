local DashModule = require(game:GetService("CorePackages").Packages.Dash)

return function(p1)
	-- upvalues: DashModule (copy)
	return DashModule.map(p1, function(Callback)
		return function(...)
			-- upvalues: Callback (copy)
			return Callback(...)
		end
	end)
end