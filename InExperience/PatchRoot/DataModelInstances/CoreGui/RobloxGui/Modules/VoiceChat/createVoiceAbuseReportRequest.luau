local httpService = game:GetService("HttpService")
local cryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local _ = require(script.Parent.VoiceChatServiceManager)
local getSortedPlayers = require(script.Parent.VoiceUsersByProximity).getSortedPlayers

return function(p0, p1, p2)
	-- upvalues: cryoModule (ref), getSortedPlayers (ref), httpService (ref)
	local abuserUserIdPlayerByUserId = p0:GetPlayerByUserId(p2.abuserUserId)
	local var3 = if abuserUserIdPlayerByUserId and abuserUserIdPlayerByUserId.Character and abuserUserIdPlayerByUserId.Character.PrimaryPart then abuserUserIdPlayerByUserId.Character.PrimaryPart.Position else nil
	
	return httpService:JSONEncode({
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p2.localUserId) } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = tostring(p2.abuserUserId) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p2.abuseReason } } },
			REPORTER_COMMENT = { valueList = { { data = p2.abuseComment } } },
			IS_PLACE_VOICE_ENABLED = { valueList = { { data = "true" } } },
			VOICE_USER_IDS_FROM_CLIENT = {
				valueList = cryoModule.List.map(p2.sortedPlayerListUserIds, function(p3)
					return { data = tostring(p3) }
				end)
			},
			IN_EXP_MENU_OPENED_UNIX_MILLI = {
				valueList = { { data = tostring(p2.inExpMenuOpenedUnixMilli) } }
			},
			VOICE_CHANNEL_ID = {
				valueList = {
					{
						data = tostring(if game:GetEngineFeature("VoiceChatServiceExposesChannelId") then p1.service:GetChannelId() else p1.service:GetGroupId())
					}
				}
			},
			VOICE_USER_COUNT = {
				valueList = {
					{
						data = tostring(#cryoModule.Dictionary.values(p1.participants))
					}
				}
			},
			VOICE_IMPACTED_USER_COUNT = {
				valueList = {
					{
						data = tostring(if var3 then #getSortedPlayers(p0, p1, var3, 160, nil, abuserUserIdPlayerByUserId) else 0)
					}
				}
			},
			REPORTED_ABUSE_VECTOR = { valueList = { { data = p2.abuseVector } } }
		}
	})
end