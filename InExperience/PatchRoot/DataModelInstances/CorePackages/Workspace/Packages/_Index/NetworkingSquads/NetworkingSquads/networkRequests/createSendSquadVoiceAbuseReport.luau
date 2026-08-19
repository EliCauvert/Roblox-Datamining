local parent = script:FindFirstAncestor("NetworkingSquads").Parent
local cryoModule = require(parent.Cryo)
local url = require(parent.Http).Url
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0) --[[ line: 9 ]]
	-- upvalues: cryoModule (ref), url (ref)
	return p0.roduxNetworking.POST("SendSquadVoiceAbuseReport", function(p1, p2) --[[ line: 14 ]]
		-- upvalues: cryoModule (copy), url (copy)
		assert(p2.voiceChannelId, "Missing voiceChannelId")
		
		return p1(url.APIS_URL):path("abuse-reporting"):path("v2"):path("abuse-report"):body({
			tags = {
				ENTRY_POINT = { valueList = { { data = "party" } } },
				SUBMITTER_USER_ID = { valueList = { { data = p2.submitterUserId } } },
				REPORT_TARGET_USER_ID = { valueList = { { data = p2.abuserUserId } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p2.abuseReason } } },
				REPORTER_COMMENT = { valueList = { { data = p2.abuseComment } } },
				IS_PLACE_VOICE_ENABLED = { valueList = { { data = "true" } } },
				VOICE_USER_IDS_FROM_CLIENT = {
					valueList = cryoModule.List.map(p2.voiceUserIds, function(p3) --[[ line: 17 ]]
						return { data = tostring(p3) }
					end)
				},
				IN_EXP_MENU_OPENED_UNIX_MILLI = {
					valueList = {
						{ data = tostring(math.floor(p2.reportBeginTimestampMs)) }
					}
				},
				VOICE_CHANNEL_ID = { valueList = { { data = p2.voiceChannelId } } },
				VOICE_USER_COUNT = { valueList = { { data = tostring(p2.voiceUserCount) } } },
				VOICE_IMPACTED_USER_COUNT = { valueList = { { data = "0" } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "voice" } } }
			}
		})
	end)
end