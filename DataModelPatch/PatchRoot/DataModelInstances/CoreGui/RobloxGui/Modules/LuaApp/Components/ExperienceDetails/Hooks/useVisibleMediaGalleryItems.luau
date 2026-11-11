local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.AppBlox)

return function(p1, p2)
	-- upvalues: ReactModule (copy)
	return (ReactModule.useMemo(function()
		-- upvalues: p2 (copy), p1 (copy)
		local List = {}
		
		for i = 1, 3 do
			local IDelta = p2 + i - 1 - 1
			
			if IDelta >= 1 and #p1 >= IDelta then
				table.insert(List, p1[IDelta])
			end
		end
		return List
	end, { p1, p2 }))
end