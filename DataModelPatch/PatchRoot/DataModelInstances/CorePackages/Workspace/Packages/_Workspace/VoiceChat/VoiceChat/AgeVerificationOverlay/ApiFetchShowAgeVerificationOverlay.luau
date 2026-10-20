local VoiceChat = script:FindFirstAncestor("VoiceChat")
local GetShowAgeVerificationOverlayModule = require(VoiceChat.AgeVerificationOverlay.GetShowAgeVerificationOverlay)
local SetShowAgeVerificationOverlayModule = require(VoiceChat.AgeVerificationOverlay.SetShowAgeVerificationOverlay)
local Parent = VoiceChat.Parent
local PromiseModule = require(Parent.Promise)
local PerformFetch = require(Parent.Http).PerformFetch
local MutedErrorFunction = require(Parent.Loggers).mutedError
local Logging = require(Parent.AppCommonLib).Logging

return {
	KeyMapper = function(Text): string
		return "luaapp.showageverificationoverlay." .. Text
	end,
	Fetch = function(p1, Text: string, p2)
		-- upvalues: PerformFetch (copy), GetShowAgeVerificationOverlayModule (copy), MutedErrorFunction (copy), SetShowAgeVerificationOverlayModule (copy), PromiseModule (copy), Logging (copy)
		if type(Text) ~= "string" then
			error("ApiFetchShowAgeVerificationOverlay thunk expects universeId to be a string")
		end
		local P3 = p2 or ""
		
		if type(P3) ~= "string" then
			error("ApiFetchShowAgeVerificationOverlay thunk expects placeId to be a string")
		end
		return PerformFetch.Single("luaapp.showageverificationoverlay." .. Text, function(p3)
			-- upvalues: GetShowAgeVerificationOverlayModule (upval), p1 (copy), Text (copy), P3 (ref), MutedErrorFunction (upval), SetShowAgeVerificationOverlayModule (upval), PromiseModule (upval), Logging (upval)
			return GetShowAgeVerificationOverlayModule(p1, Text, P3):andThen(function(Result)
				-- upvalues: MutedErrorFunction (upval), Text (upval), p3 (copy), SetShowAgeVerificationOverlayModule (upval), PromiseModule (upval), Logging (upval)
				local ResponseBody = Result.responseBody
				local IsVoiceEnabled = ResponseBody.voiceSettings ~= nil and ResponseBody.voiceSettings.isVoiceEnabled
				
				if ResponseBody.showAgeVerificationOverlay then
					MutedErrorFunction(`showAgeVerificationOverlay is deprecated but was truthy for universe {Text}`)
				end
				if ResponseBody == nil or ResponseBody.showAgeVerificationOverlay == nil or ResponseBody.universePlaceVoiceEnabledSettings == nil then
					Logging.warn("Response from GetShowAgeVerificationOverlay is malformed!")
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				else
					p3:dispatch(SetShowAgeVerificationOverlayModule(Text, ResponseBody.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice, ResponseBody.universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice, IsVoiceEnabled, ResponseBody.showVoiceOptInOverlay, ResponseBody.universePlaceVoiceEnabledSettings.isUniverseEnabledForAvatarVideo, ResponseBody.elegibleToSeeVoiceUpsell))
					
					return PromiseModule.resolve(Result)
				end
			end)
		end)
	end,
	GetFetchingStatus = function(p3, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p3, "luaapp.showageverificationoverlay." .. Text)
	end
}