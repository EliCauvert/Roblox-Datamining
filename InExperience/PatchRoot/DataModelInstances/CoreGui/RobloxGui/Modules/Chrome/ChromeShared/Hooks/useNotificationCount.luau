local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Workspace.Packages.Chrome)

return function(p0) --[[ line: 9 ]]
	-- upvalues: reactModule (ref)
	if not p0 or not p0.notification then
		warn("notification object not found")
		
		return 0
	end
	local notification = p0.notification
	local var2, var3 = reactModule.useState(notification:get())
	reactModule.useEffect(function() --[[ line: 15 ]]
		-- upvalues: p0 (ref), var3 (ref), notification (ref)
		local notificationConnection = p0.notification:connect(function() --[[ line: 16 ]]
			-- upvalues: var3 (copy), notification (copy)
			var3(notification:get())
		end)
		
		return function() --[[ line: 20 ]]
			-- upvalues: notificationConnection (ref)
			notificationConnection:disconnect()
		end
	end, { p0.id })
	
	return if var2 and var2.type == "count" then var2.value else 0
end