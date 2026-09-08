local reactModule = require(game:GetService("CorePackages").Packages.React)
local serviceModule = require(script:FindFirstAncestor("ChromeShared").Service)

return function(p1, p2)
	-- upvalues: reactModule (ref), serviceModule (ref)
	reactModule.useEffect(function()
		-- upvalues: serviceModule (copy), p1 (ref), p2 (ref)
		serviceModule:setNineDotActivityIndicatorVisible(p1, p2)
		
		return function()
			-- upvalues: serviceModule (copy), p1 (copy)
			serviceModule:setNineDotActivityIndicatorVisible(p1, false)
		end
	end, { p1, p2 })
end