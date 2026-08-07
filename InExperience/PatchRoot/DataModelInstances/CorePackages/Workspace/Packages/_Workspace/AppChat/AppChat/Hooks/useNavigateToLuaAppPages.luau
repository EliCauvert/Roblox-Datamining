local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local enumScreensModule = require(appChat.EnumScreens)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useMemo = reactModule.useMemo

return function() --[[ line: 15 ]]
	-- upvalues: useDispatch (ref), useMemo (ref), enumScreensModule (ref)
	return useMemo(function() --[[ line: 18 ]]
		-- upvalues: enumScreensModule (copy)
		return {
			[enumScreensModule.GameDetail] = function() --[[ line: 20 ]] end,
			[enumScreensModule.Notifications] = function() --[[ line: 21 ]] end,
			[enumScreensModule.PrivacySettings] = function() --[[ line: 22 ]] end,
			[enumScreensModule.ReportAbuse] = function() --[[ line: 23 ]] end,
			[enumScreensModule.ViewUserProfile] = function() --[[ line: 24 ]] end,
			[enumScreensModule.Groups] = function() --[[ line: 25 ]] end,
			[enumScreensModule.Home] = function() --[[ line: 26 ]] end
		}
	end, { useDispatch() })
end