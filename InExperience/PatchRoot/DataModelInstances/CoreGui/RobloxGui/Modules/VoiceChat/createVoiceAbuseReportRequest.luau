local httpService = game:GetService("HttpService")
local cryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local _ = require(script.Parent.VoiceChatServiceManager)
local getSortedPlayers = require(script.Parent.VoiceUsersByProximity).getSortedPlayers

return function(p1, p2, p3)
	-- upvalues: cryoModule (ref), getSortedPlayers (ref), httpService (ref)
	local abuserUserIdPlayerByUserId = p1:GetPlayerByUserId(p3.abuserUserId)
	local var1 = if abuserUserIdPlayerByUserId and abuserUserIdPlayerByUserId.Character and abuserUserIdPlayerByUserId.Character.PrimaryPart then abuserUserIdPlayerByUserId.Character.PrimaryPart.Position else nil
	
	return httpService:JSONEncode({
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p3.localUserId) } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = tostring(p3.abuserUserId) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p3.abuseReason } } },
			REPORTER_COMMENT = { valueList = { { data = p3.abuseComment } } },
			IS_PLACE_VOICE_ENABLED = { valueList = { { data = "true" } } },
			VOICE_USER_IDS_FROM_CLIENT = {
				valueList = cryoModule.List.map(p3.sortedPlayerListUserIds, function(p4)
					return { data = tostring(p4) }
				end)
			},
			IN_EXP_MENU_OPENED_UNIX_MILLI = {
				valueList = { { data = tostring(p3.inExpMenuOpenedUnixMilli) } }
			},
			VOICE_CHANNEL_ID = {
				valueList = {
					{
						data = tostring(if game:GetEngineFeature("VoiceChatServiceExposesChannelId") then p2.service:GetChannelId() else p2.service:GetGroupId())
					}
				}
			},
			VOICE_USER_COUNT = {
				valueList = {
					{
						data = tostring(#cryoModule.Dictionary.values(p2.participants))
					}
				}
			},
			VOICE_IMPACTED_USER_COUNT = {
				valueList = {
					{
						data = tostring(if var1 then #getSortedPlayers(p1, p2, var1, 160, nil, abuserUserIdPlayerByUserId) else 0)
					}
				}
			},
			REPORTED_ABUSE_VECTOR = { valueList = { { data = p3.abuseVector } } }
		}
	})
end