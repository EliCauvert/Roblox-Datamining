local Lumberyak = require(script.Parent.dependencies).Lumberyak
local ToastNotificationEventLoggingLevel = game:DefineFastString("ToastNotificationEventLoggingLevel", Lumberyak.Logger.Levels.Warning)
local ToastNotification = Lumberyak.Logger.new(nil, "ToastNotification")
ToastNotification:setContext({ prefix = "[ToastNotification] - " })
ToastNotification:addSink({
	maxLevel = ToastNotificationEventLoggingLevel,
	log = function(_, p1, _)
		print(p1)
	end
})

return ToastNotification