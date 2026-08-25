local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Workspace.Packages.Chrome)

return function(p0)
	-- upvalues: reactModule (ref)
	if not p0 or not p0.notification then
		warn("notification object not found")
		
		return 0
	end
	local notification = p0.notification
	local var2, var3 = reactModule.useState(notification:get())
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var3 (ref), notification (ref)
		local notificationConnection = p0.notification:connect(function()
			-- upvalues: var3 (copy), notification (copy)
			var3(notification:get())
		end)
		
		return function()
			-- upvalues: notificationConnection (ref)
			notificationConnection:disconnect()
		end
	end, { p0.id })
	
	return if var2 and var2.type == "count" then var2.value else 0
end