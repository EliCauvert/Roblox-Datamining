local voiceChat = script:FindFirstAncestor("VoiceChat")
local getVoiceChatOptInStatusModule = require(voiceChat.OptInStatus.GetVoiceChatOptInStatus)
local setVoiceChatOptInStatusModule = require(voiceChat.OptInStatus.SetVoiceChatOptInStatus)
local parent = voiceChat.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch
local logging = require(parent.AppCommonLib).Logging

return {
	KeyMapper = "luaapp.voicechatoptinstatus",
	Fetch = function(p1)
		-- upvalues: performFetch (ref), getVoiceChatOptInStatusModule (ref), setVoiceChatOptInStatusModule (ref), promiseModule (ref), logging (ref)
		return performFetch.Single("luaapp.voicechatoptinstatus", function(p2)
			-- upvalues: getVoiceChatOptInStatusModule (copy), p1 (ref), setVoiceChatOptInStatusModule (copy), promiseModule (copy), logging (copy)
			return getVoiceChatOptInStatusModule(p1):andThen(function(p3)
				-- upvalues: p2 (ref), setVoiceChatOptInStatusModule (copy), promiseModule (copy), logging (copy)
				local responseBody = p3.responseBody
				
				if responseBody == nil or responseBody.isUserOptIn == nil then
					logging.warn("Response from GetVoiceChatOptInStatus is malformed!")
					
					return promiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				p2:dispatch(setVoiceChatOptInStatusModule(responseBody.isUserOptIn))
				
				return promiseModule.resolve(p3)
			end)
		end)
	end,
	GetFetchingStatus = function(p1)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p1, "luaapp.voicechatoptinstatus")
	end
}