local voiceChat = script:FindFirstAncestor("VoiceChat")
local postRecordUserSeenModalModule = require(voiceChat.AgeVerificationOverlay.PostRecordUserSeenModal)
local parent = voiceChat.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch

return {
	KeyMapper = "luaapp.recorduserseenmodalupsell",
	Fetch = function(p1)
		-- upvalues: performFetch (ref), postRecordUserSeenModalModule (ref), promiseModule (ref)
		return performFetch.Single("luaapp.recorduserseenmodalupsell", function(_)
			-- upvalues: postRecordUserSeenModalModule (copy), p1 (ref), promiseModule (copy)
			return postRecordUserSeenModalModule(p1):andThen(function(p2)
				-- upvalues: promiseModule (copy)
				return if p2.responseBody == nil or p2.responseCode ~= 200 then promiseModule.reject() else promiseModule.resolve()
			end)
		end)
	end,
	GetFetchingStatus = function(p1)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p1, "luaapp.recorduserseenmodalupsell")
	end
}