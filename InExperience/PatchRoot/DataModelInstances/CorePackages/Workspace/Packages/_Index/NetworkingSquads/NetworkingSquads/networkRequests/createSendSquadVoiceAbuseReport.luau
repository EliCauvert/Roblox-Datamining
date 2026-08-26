local parent = script:FindFirstAncestor("NetworkingSquads").Parent
local cryoModule = require(parent.Cryo)
local url = require(parent.Http).Url
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: cryoModule (ref), url (ref)
	return p1.roduxNetworking.POST("SendSquadVoiceAbuseReport", function(p2, p3)
		-- upvalues: cryoModule (copy), url (copy)
		assert(p3.voiceChannelId, "Missing voiceChannelId")
		
		return p2(url.APIS_URL):path("abuse-reporting"):path("v2"):path("abuse-report"):body({
			tags = {
				ENTRY_POINT = { valueList = { { data = "party" } } },
				SUBMITTER_USER_ID = { valueList = { { data = p3.submitterUserId } } },
				REPORT_TARGET_USER_ID = { valueList = { { data = p3.abuserUserId } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p3.abuseReason } } },
				REPORTER_COMMENT = { valueList = { { data = p3.abuseComment } } },
				IS_PLACE_VOICE_ENABLED = { valueList = { { data = "true" } } },
				VOICE_USER_IDS_FROM_CLIENT = {
					valueList = cryoModule.List.map(p3.voiceUserIds, function(p4)
						return { data = tostring(p4) }
					end)
				},
				IN_EXP_MENU_OPENED_UNIX_MILLI = {
					valueList = {
						{ data = tostring(math.floor(p3.reportBeginTimestampMs)) }
					}
				},
				VOICE_CHANNEL_ID = { valueList = { { data = p3.voiceChannelId } } },
				VOICE_USER_COUNT = { valueList = { { data = tostring(p3.voiceUserCount) } } },
				VOICE_IMPACTED_USER_COUNT = { valueList = { { data = "0" } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "voice" } } }
			}
		})
	end)
end