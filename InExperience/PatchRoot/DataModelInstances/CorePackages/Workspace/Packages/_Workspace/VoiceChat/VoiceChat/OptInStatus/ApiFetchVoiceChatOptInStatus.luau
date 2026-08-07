local voiceChat = script:FindFirstAncestor("VoiceChat")
local getVoiceChatOptInStatusModule = require(voiceChat.OptInStatus.GetVoiceChatOptInStatus)
local setVoiceChatOptInStatusModule = require(voiceChat.OptInStatus.SetVoiceChatOptInStatus)
local parent = voiceChat.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch
local logging = require(parent.AppCommonLib).Logging

return {
	KeyMapper = "luaapp.voicechatoptinstatus",
	Fetch = function(p0) --[[ line: 16 ]]
		-- upvalues: performFetch (ref), getVoiceChatOptInStatusModule (ref), setVoiceChatOptInStatusModule (ref), promiseModule (ref), logging (ref)
		return performFetch.Single("luaapp.voicechatoptinstatus", function(p1) --[[ line: 17 ]]
			-- upvalues: getVoiceChatOptInStatusModule (copy), p0 (ref), setVoiceChatOptInStatusModule (copy), promiseModule (copy), logging (copy)
			return getVoiceChatOptInStatusModule(p0):andThen(function(p2) --[[ line: 18 ]]
				-- upvalues: p1 (ref), setVoiceChatOptInStatusModule (copy), promiseModule (copy), logging (copy)
				local responseBody = p2.responseBody
				
				if responseBody == nil or responseBody.isUserOptIn == nil then
					logging.warn("Response from GetVoiceChatOptInStatus is malformed!")
					
					return promiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				p1:dispatch(setVoiceChatOptInStatusModule(responseBody.isUserOptIn))
				
				return promiseModule.resolve(p2)
			end)
		end)
	end,
	GetFetchingStatus = function(p3) --[[ line: 31 ]]
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p3, "luaapp.voicechatoptinstatus")
	end
}