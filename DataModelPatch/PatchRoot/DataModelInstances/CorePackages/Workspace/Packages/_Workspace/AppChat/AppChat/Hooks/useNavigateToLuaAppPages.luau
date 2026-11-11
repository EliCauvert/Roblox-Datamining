local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseMemoFunction = require(Parent.React).useMemo

return function()
	-- upvalues: UseDispatchFunction (copy), UseMemoFunction (copy), EnumScreensModule (copy)
	return UseMemoFunction(function()
		-- upvalues: EnumScreensModule (upval)
		return {
			[EnumScreensModule.GameDetail] = function() end,
			[EnumScreensModule.Notifications] = function() end,
			[EnumScreensModule.PrivacySettings] = function() end,
			[EnumScreensModule.ReportAbuse] = function() end,
			[EnumScreensModule.ViewUserProfile] = function() end,
			[EnumScreensModule.Groups] = function() end,
			[EnumScreensModule.Home] = function() end
		}
	end, { (UseDispatchFunction()) })
end