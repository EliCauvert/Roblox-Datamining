local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ServiceModule = require(script:FindFirstAncestor("ChromeShared").Service)

return function(p1, p2)
	-- upvalues: ReactModule (copy), ServiceModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: ServiceModule (upval), p1 (copy), p2 (copy)
		ServiceModule:setNineDotActivityIndicatorVisible(p1, p2)
		
		return function()
			-- upvalues: ServiceModule (upval), p1 (upval)
			ServiceModule:setNineDotActivityIndicatorVisible(p1, false)
		end
	end, { p1, p2 })
end