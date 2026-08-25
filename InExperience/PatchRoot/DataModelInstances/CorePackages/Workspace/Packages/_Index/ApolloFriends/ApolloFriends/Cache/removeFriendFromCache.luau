return function(p0, p1)
	p0.cache:evict({
		id = p0.cache:identify({
			__typename = "Friend",
			id = p1.userId,
			targetUserId = p1.targetUserId
		})
	})
	p0.cache:gc()
end