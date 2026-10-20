local HttpService = game:GetService("HttpService")
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local _ = require(script.Parent.VoiceChatServiceManager)
local GetSortedPlayersFunction = require(script.Parent.VoiceUsersByProximity).getSortedPlayers

return function(Players, p1, p2)
	-- upvalues: CryoModule (copy), GetSortedPlayersFunction (copy), HttpService (copy)
	local Player = Players:GetPlayerByUserId(p2.abuserUserId)
	local Position = if Player and Player.Character and Player.Character.PrimaryPart then Player.Character.PrimaryPart.Position else nil
	
	return HttpService:JSONEncode({
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p2.localUserId) } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = tostring(p2.abuserUserId) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p2.abuseReason } } },
			REPORTER_COMMENT = { valueList = { { data = p2.abuseComment } } },
			IS_PLACE_VOICE_ENABLED = { valueList = { { data = "true" } } },
			VOICE_USER_IDS_FROM_CLIENT = {
				valueList = CryoModule.List.map(p2.sortedPlayerListUserIds, function(p3)
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
						data = tostring(#CryoModule.Dictionary.values(p1.participants))
					}
				}
			},
			VOICE_IMPACTED_USER_COUNT = {
				valueList = {
					{
						data = tostring(if Position then #GetSortedPlayersFunction(Players, p1, Position, 160, nil, Player) else 0)
					}
				}
			},
			REPORTED_ABUSE_VECTOR = { valueList = { { data = p2.abuseVector } } }
		}
	})
end