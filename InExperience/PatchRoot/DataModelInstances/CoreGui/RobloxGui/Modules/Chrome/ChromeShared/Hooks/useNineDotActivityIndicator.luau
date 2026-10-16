local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ServiceModule = require(script:FindFirstAncestor("ChromeShared").Service)

return function(p1, p2) --[[ Line: 8 ]]
	-- upvalues: ReactModule (copy), ServiceModule (copy)
	ReactModule.useEffect(function() --[[ Line: 9 ]]
		-- upvalues: ServiceModule (upval), p1 (copy), p2 (copy)
		ServiceModule:setNineDotActivityIndicatorVisible(p1, p2)
		
		return function() --[[ Line: 12 ]]
			-- upvalues: ServiceModule (upval), p1 (upval)
			ServiceModule:setNineDotActivityIndicatorVisible(p1, false)
		end
	end, { p1, p2 })
end