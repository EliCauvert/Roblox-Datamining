local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("SocialExperienceJoin").Parent.SocialLuaAnalytics)
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local EventNamesModule = require(script.Parent.EventNames)
local BtnValuesModule = require(script.Parent.BtnValues)

local function ProfileUserId(p1) --[[ Line: 10 ]]
	return p1
end

local PlayerProfile = SocialLuaAnalyticsModule.Analytics.Enums.Contexts.PlayerProfile
local PeekView = SocialLuaAnalyticsModule.Analytics.Enums.SubPages.PeekView

return function(p1) --[[ Line: 17 ]]
	-- upvalues: PlayerProfile (copy), PeekView (copy), EventNamesModule (copy), EventTypes (copy), BtnValuesModule (copy), ProfileUserId (copy)
	local Context = p1 and p1.context or PlayerProfile
	local Subpage = p1 and p1.subpage or PeekView
	
	return {
		[EventNamesModule.JoinExperience] = {
			context = Context,
			eventType = EventTypes.JoinGameInPeopleList,
			additionalInfo = { btn = BtnValuesModule.JoinExperience, subpage = Subpage },
			formatRulesForAdditionalInfo = {
				placeId = ProfileUserId,
				rootPlaceId = ProfileUserId,
				gameInstanceId = ProfileUserId,
				profileUserId = ProfileUserId,
				uid = ProfileUserId,
				isHomePageCarousel = ProfileUserId,
				absolutePosition = ProfileUserId,
				joinAttemptId = ProfileUserId,
				status = ProfileUserId
			}
		},
		[EventNamesModule.PurchaseExperience] = {
			context = Context,
			eventType = EventTypes.ButtonClick,
			additionalInfo = {
				btn = BtnValuesModule.PurchaseExperience,
				subpage = Subpage
			},
			formatRulesForAdditionalInfo = { profileUserId = ProfileUserId, uid = ProfileUserId }
		},
		[EventNamesModule.PurchaseExperienceAttempt] = {
			context = Context,
			eventType = EventTypes.PurchaseExperienceAttempt,
			additionalInfo = { subpage = Subpage },
			formatRulesForAdditionalInfo = {
				universeId = ProfileUserId,
				profileUserId = ProfileUserId,
				status = ProfileUserId
			}
		},
		[EventNamesModule.CancelPurchaseExperience] = {
			context = Context,
			eventType = EventTypes.ButtonClick,
			additionalInfo = {
				btn = BtnValuesModule.CancelPurchaseExperience,
				subpage = Subpage
			},
			formatRulesForAdditionalInfo = {
				universeId = ProfileUserId,
				profileUserId = ProfileUserId
			}
		},
		[EventNamesModule.UnableToJoinViewDetails] = {
			context = Context,
			eventType = EventTypes.ButtonClick,
			additionalInfo = {
				btn = BtnValuesModule.UnableToJoinViewDetails,
				subpage = Subpage
			},
			formatRulesForAdditionalInfo = {
				universeId = ProfileUserId,
				profileUserId = ProfileUserId
			}
		},
		[EventNamesModule.UnableToJoinCancel] = {
			context = Context,
			eventType = EventTypes.ButtonClick,
			additionalInfo = {
				btn = BtnValuesModule.UnableToJoinCancel,
				subpage = Subpage
			},
			formatRulesForAdditionalInfo = {
				universeId = ProfileUserId,
				profileUserId = ProfileUserId
			}
		}
	}
end