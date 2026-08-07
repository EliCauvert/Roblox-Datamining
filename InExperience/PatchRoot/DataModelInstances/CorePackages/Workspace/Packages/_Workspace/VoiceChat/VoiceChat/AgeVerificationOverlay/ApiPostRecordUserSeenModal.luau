local voiceChat = script:FindFirstAncestor("VoiceChat")
local postRecordUserSeenModalModule = require(voiceChat.AgeVerificationOverlay.PostRecordUserSeenModal)
local parent = voiceChat.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch

return {
	KeyMapper = "luaapp.recorduserseenmodalupsell",
	Fetch = function(p0) --[[ line: 13 ]]
		-- upvalues: performFetch (ref), postRecordUserSeenModalModule (ref), promiseModule (ref)
		return performFetch.Single("luaapp.recorduserseenmodalupsell", function(_) --[[ line: 14 ]]
			-- upvalues: postRecordUserSeenModalModule (copy), p0 (ref), promiseModule (copy)
			return postRecordUserSeenModalModule(p0):andThen(function(p1) --[[ line: 15 ]]
				-- upvalues: promiseModule (copy)
				return if p1.responseBody == nil or p1.responseCode ~= 200 then promiseModule.reject() else promiseModule.resolve()
			end)
		end)
	end,
	GetFetchingStatus = function(p2) --[[ line: 22 ]]
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p2, "luaapp.recorduserseenmodalupsell")
	end
}