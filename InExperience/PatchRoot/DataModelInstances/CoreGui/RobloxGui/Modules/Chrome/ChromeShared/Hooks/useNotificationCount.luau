local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Workspace.Packages.Chrome)

return function(p1)
	-- upvalues: reactModule (ref)
	if not p1 or not p1.notification then
		warn("notification object not found")
		
		return 0
	end
	local notification = p1.notification
	local var1, var2 = reactModule.useState(notification:get())
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), notification (ref)
		local notificationConnection = p1.notification:connect(function()
			-- upvalues: var2 (copy), notification (copy)
			var2(notification:get())
		end)
		
		return function()
			-- upvalues: notificationConnection (ref)
			notificationConnection:disconnect()
		end
	end, { p1.id })
	
	return if var1 and var1.type == "count" then var1.value else 0
end