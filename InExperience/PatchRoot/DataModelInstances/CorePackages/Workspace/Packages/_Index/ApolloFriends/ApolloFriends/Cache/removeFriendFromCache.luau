return function(p1, p2)
	p1.cache:evict({
		id = p1.cache:identify({
			__typename = "Friend",
			id = p2.userId,
			targetUserId = p2.targetUserId
		})
	})
	p1.cache:gc()
end