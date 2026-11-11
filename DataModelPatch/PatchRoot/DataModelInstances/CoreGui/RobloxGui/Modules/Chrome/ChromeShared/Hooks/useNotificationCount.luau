local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.Chrome)

return function(p1)
	-- upvalues: ReactModule (copy)
	if p1 and p1.notification then
		local Notification = p1.notification
		local UseStateResult, UseStateResult2 = ReactModule.useState(Notification:get())
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseStateResult2 (copy), Notification (copy)
			local NotificationConnection = p1.notification:connect(function()
				-- upvalues: UseStateResult2 (upval), Notification (upval)
				UseStateResult2(Notification:get())
			end)
			
			return function()
				-- upvalues: NotificationConnection (copy)
				NotificationConnection:disconnect()
			end
		end, { p1.id })
		
		return if UseStateResult and UseStateResult.type == "count" then UseStateResult.value else 0
	else
		warn("notification object not found")
		
		return 0
	end
end