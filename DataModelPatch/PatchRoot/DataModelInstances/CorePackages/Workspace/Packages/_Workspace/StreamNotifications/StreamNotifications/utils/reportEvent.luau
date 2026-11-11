return function(p1, p2)
	p1:sendEventDeferred("StreamNotification", "StreamNotificationClientEvent", p2)
end