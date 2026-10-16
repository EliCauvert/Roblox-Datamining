local VoiceChat = script:FindFirstAncestor("VoiceChat")
local GetVoiceChatOptInStatusModule = require(VoiceChat.OptInStatus.GetVoiceChatOptInStatus)
local SetVoiceChatOptInStatusModule = require(VoiceChat.OptInStatus.SetVoiceChatOptInStatus)
local Parent = VoiceChat.Parent
local PromiseModule = require(Parent.Promise)
local PerformFetch = require(Parent.Http).PerformFetch
local Logging = require(Parent.AppCommonLib).Logging

return {
	KeyMapper = "luaapp.voicechatoptinstatus",
	Fetch = function(p1) --[[ Line: 16 ]]
		-- upvalues: PerformFetch (copy), GetVoiceChatOptInStatusModule (copy), SetVoiceChatOptInStatusModule (copy), PromiseModule (copy), Logging (copy)
		return PerformFetch.Single("luaapp.voicechatoptinstatus", function(p2) --[[ Line: 17 ]]
			-- upvalues: GetVoiceChatOptInStatusModule (upval), p1 (copy), SetVoiceChatOptInStatusModule (upval), PromiseModule (upval), Logging (upval)
			return GetVoiceChatOptInStatusModule(p1):andThen(function(Result) --[[ Line: 18 ]]
				-- upvalues: p2 (copy), SetVoiceChatOptInStatusModule (upval), PromiseModule (upval), Logging (upval)
				local ResponseBody = Result.responseBody
				
				if ResponseBody == nil or ResponseBody.isUserOptIn == nil then
					Logging.warn("Response from GetVoiceChatOptInStatus is malformed!")
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				else
					p2:dispatch(SetVoiceChatOptInStatusModule(ResponseBody.isUserOptIn))
					
					return PromiseModule.resolve(Result)
				end
			end)
		end)
	end,
	GetFetchingStatus = function(p1) --[[ Line: 31 ]]
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.voicechatoptinstatus")
	end
}