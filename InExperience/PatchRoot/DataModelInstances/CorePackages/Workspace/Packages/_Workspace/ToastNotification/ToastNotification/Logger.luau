local lumberyak = require(script.Parent.dependencies).Lumberyak
local toastNotificationEventLoggingLevel = game:DefineFastString("ToastNotificationEventLoggingLevel", lumberyak.Logger.Levels.Warning)
local toastNotification = lumberyak.Logger.new(nil, "ToastNotification")
toastNotification:setContext({ prefix = "[ToastNotification] - " })
toastNotification:addSink({
	maxLevel = toastNotificationEventLoggingLevel,
	log = function(_, p1, _)
		print(p1)
	end
})

return toastNotification