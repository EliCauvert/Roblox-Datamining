local voiceChat = script:FindFirstAncestor("VoiceChat")
local getShowAgeVerificationOverlayModule = require(voiceChat.AgeVerificationOverlay.GetShowAgeVerificationOverlay)
local setShowAgeVerificationOverlayModule = require(voiceChat.AgeVerificationOverlay.SetShowAgeVerificationOverlay)
local parent = voiceChat.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch
local mutedError = require(parent.Loggers).mutedError
local logging = require(parent.AppCommonLib).Logging

return {
	KeyMapper = function(p0)
		return "luaapp.showageverificationoverlay." .. p0
	end,
	Fetch = function(p1, p2, p3)
		-- upvalues: performFetch (ref), getShowAgeVerificationOverlayModule (ref), mutedError (ref), setShowAgeVerificationOverlayModule (ref), promiseModule (ref), logging (ref)
		if type(p2) ~= "string" then
			error("ApiFetchShowAgeVerificationOverlay thunk expects universeId to be a string")
		end
		p3 = p3 or ""
		
		if type(p3) ~= "string" then
			error("ApiFetchShowAgeVerificationOverlay thunk expects placeId to be a string")
		end
		return performFetch.Single("luaapp.showageverificationoverlay." .. p2, function(p4)
			-- upvalues: getShowAgeVerificationOverlayModule (copy), p1 (ref), p2 (ref), p3 (write), mutedError (copy), setShowAgeVerificationOverlayModule (copy), promiseModule (copy), logging (copy)
			return getShowAgeVerificationOverlayModule(p1, p2, p3):andThen(function(p5)
				-- upvalues: mutedError (copy), p2 (copy), p4 (ref), setShowAgeVerificationOverlayModule (copy), promiseModule (copy), logging (copy)
				local responseBody = p5.responseBody
				local var4 = responseBody.voiceSettings ~= nil and responseBody.voiceSettings.isVoiceEnabled
				
				if responseBody.showAgeVerificationOverlay then
					mutedError(`showAgeVerificationOverlay is deprecated but was truthy for universe {p2}`)
				end
				if responseBody == nil or responseBody.showAgeVerificationOverlay == nil or responseBody.universePlaceVoiceEnabledSettings == nil then
					logging.warn("Response from GetShowAgeVerificationOverlay is malformed!")
					
					return promiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				p4:dispatch(setShowAgeVerificationOverlayModule(p2, responseBody.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice, responseBody.universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice, var4, responseBody.showVoiceOptInOverlay, responseBody.universePlaceVoiceEnabledSettings.isUniverseEnabledForAvatarVideo, responseBody.elegibleToSeeVoiceUpsell))
				
				return promiseModule.resolve(p5)
			end)
		end)
	end,
	GetFetchingStatus = function(p6, p7)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p6, "luaapp.showageverificationoverlay." .. p7)
	end
}