return function(p0, p1)
	p0:sendEventDeferred("StreamNotification", "StreamNotificationClientEvent", p1)
end