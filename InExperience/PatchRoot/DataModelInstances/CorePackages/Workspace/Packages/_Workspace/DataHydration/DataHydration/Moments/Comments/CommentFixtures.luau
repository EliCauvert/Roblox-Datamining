local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local t = {
	alex = { userId = "111", username = "alex", displayName = "Alex" },
	bailey = {
		userId = "222",
		username = "bailey",
		displayName = "Bailey",
		hasVerifiedBadge = true
	},
	degraded = { userId = "333" }
}
local t_1 = {
	AUTHORS = t,
	ERRORS = {
		TextFilterRejected = {
			errorCode = "TextFilterRejected",
			message = "text did not pass filter"
		},
		RateLimited = { errorCode = "RateLimited", message = "too many requests" }
	},
	makeComment = function(p1)
		-- upvalues: t (ref)
		local t_1 = {
			commentId = "c-1",
			feedItemId = "feed-1",
			status = "Active",
			text = "This moment is fire",
			createdAt = "2026-08-12T12:00:00Z",
			isAuthoredByViewer = false,
			author = t.alex
		}
		
		if p1 then
			for i, v in p1 do
				t_1[i] = v
			end
		end
		return t_1
	end,
	makeEnvelope = function(p2)
		local t = {
			count = 3,
			countIsCapped = false,
			creatorEnabled = true,
			viewerCanRead = true,
			viewerCanWrite = true
		}
		
		if p2 then
			for i, v in p2 do
				t[i] = v
			end
		end
		return t
	end
}
local t_2 = { count = 99, countIsCapped = true }
local t_3 = {
	count = 3,
	countIsCapped = false,
	creatorEnabled = true,
	viewerCanRead = true,
	viewerCanWrite = true
}

if t_2 then
	for i, v in t_2 do
		t_3[i] = v
	end
end
t_1.cappedEnvelope = t_3

return t_1