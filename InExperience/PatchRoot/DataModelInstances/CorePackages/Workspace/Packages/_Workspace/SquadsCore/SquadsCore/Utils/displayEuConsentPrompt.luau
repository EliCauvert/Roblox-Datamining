local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local default = require(squadsCore.Parent.CrossExperienceVoice).CrossExperienceVoiceManager.default
local SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY = require(squadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY
local SQUAD_VOICE_EU_MODAL_SEEN_KEY = require(squadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local setTableAppStorageKey = require(squadsCore.Utils.appStorageAccess).setTableAppStorageKey

return function(p0, p1, p2, p3) --[[ line: 13 ]]
	-- upvalues: squadPromptTypeModule (ref), setTableAppStorageKey (ref), SQUAD_VOICE_EU_MODAL_SEEN_KEY (ref), httpService (ref), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (ref), default (ref)
	return function(p4) --[[ line: 19 ]]
		-- upvalues: p0 (ref), squadPromptTypeModule (copy), p2 (ref), p1 (ref), p3 (ref), setTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_SEEN_KEY (copy), httpService (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), default (copy)
		p0(p4, {
			promptType = squadPromptTypeModule.EuVoiceConsentPrompt,
			onConfirm = function() --[[ line: 22 ]]
				-- upvalues: p2 (copy), p1 (copy), p3 (copy), setTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_SEEN_KEY (copy), httpService (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), default (copy)
				p2[p1] = true
				p3[p1] = true
				setTableAppStorageKey(SQUAD_VOICE_EU_MODAL_SEEN_KEY, httpService:JSONEncode(p2))
				setTableAppStorageKey(SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY, httpService:JSONEncode(p3))
				default.default.VoiceEuModalConsented:Fire()
			end,
			onCancel = function() --[[ line: 32 ]]
				-- upvalues: p2 (copy), p1 (copy), setTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_SEEN_KEY (copy), httpService (copy), default (copy)
				p2[p1] = true
				setTableAppStorageKey(SQUAD_VOICE_EU_MODAL_SEEN_KEY, httpService:JSONEncode(p2))
				default.default.VoiceEuModalRefused:Fire()
			end
		})
	end
end