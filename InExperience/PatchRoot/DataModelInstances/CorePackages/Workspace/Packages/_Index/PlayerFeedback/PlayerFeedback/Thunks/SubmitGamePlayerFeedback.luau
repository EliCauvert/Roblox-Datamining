local playerFeedback = script:FindFirstAncestor("PlayerFeedback")
local parent = playerFeedback.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch
local postGamePlayerFeedbackModule = require(playerFeedback.Utils.PostGamePlayerFeedback)
local feedbackChannelModule = require(playerFeedback.Enums.FeedbackChannel)

local function _(p1)
	return "luaapp.asset-review-api.channels.reviews" .. p0
end

return {
	Post = function(p1, p2, p3, p4, p5)
		-- upvalues: performFetch (ref), postGamePlayerFeedbackModule (ref), feedbackChannelModule (ref), promiseModule (ref)
		return performFetch.Single("luaapp.asset-review-api.channels.reviews" .. p2, function(_)
			-- upvalues: postGamePlayerFeedbackModule (copy), p1 (ref), feedbackChannelModule (copy), p2 (ref), p3 (ref), p4 (ref), p5 (ref), promiseModule (copy)
			return postGamePlayerFeedbackModule(p1, feedbackChannelModule.ExperienceDiscoveryPage, p2, p3, p4, p5):andThen(function(p6)
				-- upvalues: promiseModule (copy)
				return promiseModule.resolve(p6)
			end, function(p6)
				-- upvalues: promiseModule (copy)
				return promiseModule.reject(p6)
			end)
		end)
	end,
	GetPostingStatus = function(p1, p2)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p1, "luaapp.asset-review-api.channels.reviews" .. p9)
	end
}