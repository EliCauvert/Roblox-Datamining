local _ = require(script.Parent.types)

return {
	request = function(p1, SubmitterId, Category, Comment)
		return {
			abuseVector = "ad_v2",
			targetType = "ad_v2",
			category = Category,
			comment = Comment,
			submitterId = SubmitterId,
			targetIdStr = p1.trackingData.encryptedAdTrackingData
		}
	end
}