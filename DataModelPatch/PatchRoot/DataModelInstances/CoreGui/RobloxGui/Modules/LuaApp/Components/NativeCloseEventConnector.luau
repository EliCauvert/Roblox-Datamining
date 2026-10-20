local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local NotificationTypeList = GuiService:GetNotificationTypeList()

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), GuiService (copy), NotificationTypeList (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), p1 (copy), GuiService (upval), NotificationTypeList (upval)
		if not UseDispatchResult(p1.onNativeCloseEvent()) then
			GuiService:BroadcastNotification("", NotificationTypeList.NATIVE_EXIT)
		end
	end, { UseDispatchResult, p1.onNativeCloseEvent })
	ReactModule.useEffect(function()
		-- upvalues: GuiService (upval), UseResult (copy)
		local NativeCloseConnection = GuiService.NativeClose:Connect(UseResult)
		
		return function()
			-- upvalues: NativeCloseConnection (copy)
			NativeCloseConnection:Disconnect()
		end
	end, { p1.onNativeCloseEvent })
end