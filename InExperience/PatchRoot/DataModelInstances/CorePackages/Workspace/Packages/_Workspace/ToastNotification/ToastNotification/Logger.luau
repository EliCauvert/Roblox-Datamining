local lumberyak = require(script.Parent.dependencies).Lumberyak
local toastNotificationEventLoggingLevel = game:DefineFastString("ToastNotificationEventLoggingLevel", lumberyak.Logger.Levels.Warning)
local toastNotification = lumberyak.Logger.new(nil, "ToastNotification")
toastNotification:setContext({ prefix = "[ToastNotification] - " })
toastNotification:addSink({
	maxLevel = toastNotificationEventLoggingLevel,
	log = function(_, p0, _)
		print(p0)
	end
})

return toastNotification