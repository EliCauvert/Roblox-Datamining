local PlayerFeedback = script:FindFirstAncestor("PlayerFeedback")
local Parent = PlayerFeedback.Parent
local PromiseModule = require(Parent.Promise)
local PerformFetch = require(Parent.Http).PerformFetch
local PostGamePlayerFeedbackModule = require(PlayerFeedback.Utils.PostGamePlayerFeedback)
local FeedbackChannelModule = require(PlayerFeedback.Enums.FeedbackChannel)

local function _(Text): string --[[ Line: 8 | Named "fetchKeymapper" ]]
	return "luaapp.asset-review-api.channels.reviews" .. Text
end

return {
	Post = function(p1, Text, p2, p3, p4) --[[ Line: 14 ]]
		-- upvalues: PerformFetch (copy), PostGamePlayerFeedbackModule (copy), FeedbackChannelModule (copy), PromiseModule (copy)
		return PerformFetch.Single("luaapp.asset-review-api.channels.reviews" .. Text, function(_) --[[ Line: 21 ]]
			-- upvalues: PostGamePlayerFeedbackModule (upval), p1 (copy), FeedbackChannelModule (upval), Text (copy), p2 (copy), p3 (copy), p4 (copy), PromiseModule (upval)
			return PostGamePlayerFeedbackModule(p1, FeedbackChannelModule.ExperienceDiscoveryPage, Text, p2, p3, p4):andThen(function(Result) --[[ Line: 29 ]]
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve(Result)
			end, function(p5) --[[ Line: 31 ]]
				-- upvalues: PromiseModule (upval)
				return PromiseModule.reject(p5)
			end)
		end)
	end,
	GetPostingStatus = function(p1, Text) --[[ Line: 36 ]]
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.asset-review-api.channels.reviews" .. Text)
	end
}