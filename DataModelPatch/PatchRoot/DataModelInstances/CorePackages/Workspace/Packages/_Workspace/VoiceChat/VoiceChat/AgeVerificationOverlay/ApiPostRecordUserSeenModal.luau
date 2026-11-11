local VoiceChat = script:FindFirstAncestor("VoiceChat")
local PostRecordUserSeenModalModule = require(VoiceChat.AgeVerificationOverlay.PostRecordUserSeenModal)
local Parent = VoiceChat.Parent
local PromiseModule = require(Parent.Promise)
local PerformFetch = require(Parent.Http).PerformFetch

return {
	KeyMapper = "luaapp.recorduserseenmodalupsell",
	Fetch = function(p1)
		-- upvalues: PerformFetch (copy), PostRecordUserSeenModalModule (copy), PromiseModule (copy)
		return PerformFetch.Single("luaapp.recorduserseenmodalupsell", function(_)
			-- upvalues: PostRecordUserSeenModalModule (upval), p1 (copy), PromiseModule (upval)
			return PostRecordUserSeenModalModule(p1):andThen(function(Result)
				-- upvalues: PromiseModule (upval)
				return if Result.responseBody == nil or Result.responseCode ~= 200 then PromiseModule.reject() else PromiseModule.resolve()
			end)
		end)
	end,
	GetFetchingStatus = function(p1)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.recorduserseenmodalupsell")
	end
}