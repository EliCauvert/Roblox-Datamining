return function(p0, p1) --[[ line: 1 ]]
	p0:sendEventDeferred("StreamNotification", "StreamNotificationClientEvent", p1)
end