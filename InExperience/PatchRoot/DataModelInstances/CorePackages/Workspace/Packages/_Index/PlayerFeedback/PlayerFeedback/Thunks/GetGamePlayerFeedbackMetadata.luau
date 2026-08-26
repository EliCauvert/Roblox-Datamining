local playerFeedback = script:FindFirstAncestor("PlayerFeedback")
local parent = playerFeedback.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch
local gameGetPlayerFeedbackMetadataModule = require(playerFeedback.Utils.GameGetPlayerFeedbackMetadata)
local feedbackChannelModule = require(playerFeedback.Enums.FeedbackChannel)
local voteStatus = require(parent.GameVotesRodux).Enums.VoteStatus
local tModule = require(parent.t)
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local _ = require(playerFeedback.Types)

local function _(p1)
	return "luaapp.asset-review-api.channels" .. p0
end

local t = {
	[voteStatus.VotedUp] = "Upvote",
	[voteStatus.VotedDown] = "Downvote"
}

local _ = function(p1, p2)
	for i, v in ipairs(p1) do
		if v.type == p2 then
			return v
		end
	end
	return nil
end

local t_1 = {}
local var1 = tModule.interface({
	capabilities = tModule.interface({
		can_submit_review = tModule.boolean,
		can_submit_category_options = tModule.boolean,
		can_submit_comment = tModule.boolean
	}),
	categories = tModule.array(tModule.interface({
		type = tModule.string,
		label = tModule.string,
		allows_multiple_selections = tModule.boolean,
		options = tModule.array(tModule.interface({ id = tModule.string, label = tModule.string }))
	})),
	comment = tModule.interface({
		label = tModule.string,
		placeholder_text = tModule.string,
		minimum_length = tModule.number,
		maximum_length = tModule.number
	}),
	metadata = tModule.interface({
		disclaimer_label = tModule.string,
		submit_button_label = tModule.string,
		form_title_label = tModule.string
	})
})

function t_1.Get(p3, _, p4, p5)
	-- upvalues: performFetch (ref), gameGetPlayerFeedbackMetadataModule (ref), feedbackChannelModule (ref), var1 (ref), flaggedMutedError (ref), promiseModule (ref), t (ref)
	return performFetch.Single("luaapp.asset-review-api.channels" .. p4, function(_)
		-- upvalues: gameGetPlayerFeedbackMetadataModule (copy), p3 (ref), feedbackChannelModule (copy), p4 (ref), var1 (copy), flaggedMutedError (copy), promiseModule (copy), t (copy), p5 (ref)
		return gameGetPlayerFeedbackMetadataModule(p3, feedbackChannelModule.ExperienceDiscoveryPage, p4):andThen(function(p6)
			-- upvalues: var1 (copy), flaggedMutedError (copy), promiseModule (copy), t (copy), p5 (copy), p4 (copy)
			local responseBody = p6 and p6.responseBody
			local var2, var3 = var1(responseBody)
			
			if not var2 then
				flaggedMutedError("PlayerFeedbackMetadata", var3)
				
				return promiseModule.reject({ HttpError = Enum.HttpError.OK })
			end
			local var4
			local var5 = t[p5]
			
			for i, v in ipairs(responseBody.categories) do
				if v.type == var5 then
					var4 = v
					if var4 == nil then
						flaggedMutedError("PlayerFeedbackMetadata", string.format("Invalid category from player feedback metadata response: %s", var5))
						
						return promiseModule.reject({ HttpError = Enum.HttpError.OK })
					end
					return promiseModule.resolve({
						rootPlaceId = p4,
						canSubmitReview = responseBody.capabilities.can_submit_review,
						canSubmitComment = responseBody.capabilities.can_submit_comment,
						categoryType = var5,
						category = var4,
						comment = responseBody.comment,
						metadata = responseBody.metadata
					})
				end
			end
			var4 = nil
		end, function(p7)
			-- upvalues: promiseModule (copy)
			return promiseModule.reject(p7)
		end)
	end)
end

function t_1.GetFetchingStatus(p6, p7)
	-- upvalues: performFetch (ref)
	return performFetch.GetStatus(p6, "luaapp.asset-review-api.channels" .. p9)
end

return t_1