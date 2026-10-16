local PlayerFeedback = script:FindFirstAncestor("PlayerFeedback")
local Parent = PlayerFeedback.Parent
local PromiseModule = require(Parent.Promise)
local PerformFetch = require(Parent.Http).PerformFetch
local GameGetPlayerFeedbackMetadataModule = require(PlayerFeedback.Utils.GameGetPlayerFeedbackMetadata)
local FeedbackChannelModule = require(PlayerFeedback.Enums.FeedbackChannel)
local VoteStatus = require(Parent.GameVotesRodux).Enums.VoteStatus
local TModule = require(Parent.t)
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local _ = require(PlayerFeedback.Types)

local function _(Text): string --[[ Line: 14 | Named "fetchKeymapper" ]]
	return "luaapp.asset-review-api.channels" .. Text
end

local config = {
	[VoteStatus.VotedUp] = "Upvote",
	[VoteStatus.VotedDown] = "Downvote"
}

local _ = function(List, Type) --[[ Line: 23 | Named "findCategoryByType" ]]
	for _, value in ipairs(List) do
		if value.type == Type then
			return value
		end
	end
	return nil
end

local InterfaceResult = TModule.interface({
	capabilities = TModule.interface({
		can_submit_review = TModule.boolean,
		can_submit_category_options = TModule.boolean,
		can_submit_comment = TModule.boolean
	}),
	categories = TModule.array(TModule.interface({
		type = TModule.string,
		label = TModule.string,
		allows_multiple_selections = TModule.boolean,
		options = TModule.array(TModule.interface({ id = TModule.string, label = TModule.string }))
	})),
	comment = TModule.interface({
		label = TModule.string,
		placeholder_text = TModule.string,
		minimum_length = TModule.number,
		maximum_length = TModule.number
	}),
	metadata = TModule.interface({
		disclaimer_label = TModule.string,
		submit_button_label = TModule.string,
		form_title_label = TModule.string
	})
})

return {
	Get = function(p1, _, RootPlaceId, p2) --[[ Line: 62 ]]
		-- upvalues: PerformFetch (copy), GameGetPlayerFeedbackMetadataModule (copy), FeedbackChannelModule (copy), InterfaceResult (copy), FlaggedMutedErrorFunction (copy), PromiseModule (copy), config (copy)
		return PerformFetch.Single("luaapp.asset-review-api.channels" .. RootPlaceId, function(_) --[[ Line: 63 ]]
			-- upvalues: GameGetPlayerFeedbackMetadataModule (upval), p1 (copy), FeedbackChannelModule (upval), RootPlaceId (copy), InterfaceResult (upval), FlaggedMutedErrorFunction (upval), PromiseModule (upval), config (upval), p2 (copy)
			return GameGetPlayerFeedbackMetadataModule(p1, FeedbackChannelModule.ExperienceDiscoveryPage, RootPlaceId):andThen(function(Result) --[[ Line: 65 ]]
				-- upvalues: InterfaceResult (upval), FlaggedMutedErrorFunction (upval), PromiseModule (upval), config (upval), p2 (upval), RootPlaceId (upval)
				local ResponseBody = Result and Result.responseBody
				local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(ResponseBody)
				
				if not InterfaceResultResult then
					FlaggedMutedErrorFunction("PlayerFeedbackMetadata", InterfaceResultResult2)
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				local Entry = config[p2]
				local Category = nil
				
				for _, category in ipairs(ResponseBody.categories) do
					if category.type == Entry then
						Category = category
						break
					end
				end
				if Category == nil then
					FlaggedMutedErrorFunction("PlayerFeedbackMetadata", string.format("Invalid category from player feedback metadata response: %s", Entry))
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				else
					return PromiseModule.resolve({
						rootPlaceId = RootPlaceId,
						canSubmitReview = ResponseBody.capabilities.can_submit_review,
						canSubmitComment = ResponseBody.capabilities.can_submit_comment,
						categoryType = Entry,
						category = Category,
						comment = ResponseBody.comment,
						metadata = ResponseBody.metadata
					})
				end
			end, function(p3) --[[ Line: 94 ]]
				-- upvalues: PromiseModule (upval)
				return PromiseModule.reject(p3)
			end)
		end)
	end,
	GetFetchingStatus = function(p3, Text) --[[ Line: 100 ]]
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p3, "luaapp.asset-review-api.channels" .. Text)
	end
}