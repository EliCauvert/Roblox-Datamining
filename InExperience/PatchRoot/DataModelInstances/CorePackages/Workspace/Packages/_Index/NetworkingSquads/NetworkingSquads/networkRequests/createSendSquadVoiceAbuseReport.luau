local Parent = script:FindFirstAncestor("NetworkingSquads").Parent
local CryoModule = require(Parent.Cryo)
local Url = require(Parent.Http).Url
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: CryoModule (copy), Url (copy)
	return (p1.roduxNetworking.POST("SendSquadVoiceAbuseReport", function(Callback, p2) --[[ Line: 14 ]]
		-- upvalues: CryoModule (upval), Url (upval)
		assert(p2.voiceChannelId, "Missing voiceChannelId")
		
		return Callback(Url.APIS_URL):path("abuse-reporting"):path("v2"):path("abuse-report"):body({
			tags = {
				ENTRY_POINT = { valueList = { { data = "party" } } },
				SUBMITTER_USER_ID = { valueList = { { data = p2.submitterUserId } } },
				REPORT_TARGET_USER_ID = { valueList = { { data = p2.abuserUserId } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p2.abuseReason } } },
				REPORTER_COMMENT = { valueList = { { data = p2.abuseComment } } },
				IS_PLACE_VOICE_ENABLED = { valueList = { { data = "true" } } },
				VOICE_USER_IDS_FROM_CLIENT = {
					valueList = CryoModule.List.map(p2.voiceUserIds, function(p3) --[[ Line: 17 ]]
						return { data = tostring(p3) }
					end)
				},
				IN_EXP_MENU_OPENED_UNIX_MILLI = {
					valueList = {
						{ data = tostring((math.floor(p2.reportBeginTimestampMs))) }
					}
				},
				VOICE_CHANNEL_ID = { valueList = { { data = p2.voiceChannelId } } },
				VOICE_USER_COUNT = { valueList = { { data = tostring(p2.voiceUserCount) } } },
				VOICE_IMPACTED_USER_COUNT = { valueList = { { data = "0" } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "voice" } } }
			}
		})
	end))
end