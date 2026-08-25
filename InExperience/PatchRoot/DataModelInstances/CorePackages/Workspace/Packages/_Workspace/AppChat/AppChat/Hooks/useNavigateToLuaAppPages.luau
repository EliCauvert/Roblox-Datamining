local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local enumScreensModule = require(appChat.EnumScreens)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useMemo = reactModule.useMemo

return function()
	-- upvalues: useDispatch (ref), useMemo (ref), enumScreensModule (ref)
	return useMemo(function()
		-- upvalues: enumScreensModule (copy)
		return {
			[enumScreensModule.GameDetail] = function() end,
			[enumScreensModule.Notifications] = function() end,
			[enumScreensModule.PrivacySettings] = function() end,
			[enumScreensModule.ReportAbuse] = function() end,
			[enumScreensModule.ViewUserProfile] = function() end,
			[enumScreensModule.Groups] = function() end,
			[enumScreensModule.Home] = function() end
		}
	end, { useDispatch() })
end