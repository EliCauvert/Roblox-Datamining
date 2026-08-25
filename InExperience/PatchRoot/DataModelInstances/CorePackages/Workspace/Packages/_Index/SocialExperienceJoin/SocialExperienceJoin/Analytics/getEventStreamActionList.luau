local socialLuaAnalyticsModule = require(script:FindFirstAncestor("SocialExperienceJoin").Parent.SocialLuaAnalytics)
local contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local subPages = socialLuaAnalyticsModule.Analytics.Enums.SubPages
local eventNamesModule = require(script.Parent.EventNames)
local btnValuesModule = require(script.Parent.BtnValues)

local var3 = function(p0)
	return p0
end

local playerProfile = contexts.PlayerProfile
local peekView = subPages.PeekView

return function(p1)
	-- upvalues: playerProfile (ref), peekView (ref), eventNamesModule (ref), eventTypes (ref), btnValuesModule (ref), var3 (ref)
	local var4 = if p1 then p1.context else playerProfile
	local var5 = if p1 then p1.subpage else peekView
	
	return {
		[eventNamesModule.JoinExperience] = {
			context = var4,
			eventType = eventTypes.JoinGameInPeopleList,
			additionalInfo = { btn = btnValuesModule.JoinExperience, subpage = var5 },
			formatRulesForAdditionalInfo = {
				placeId = var3,
				rootPlaceId = var3,
				gameInstanceId = var3,
				profileUserId = var3,
				uid = var3,
				isHomePageCarousel = var3,
				absolutePosition = var3,
				joinAttemptId = var3,
				status = var3
			}
		},
		[eventNamesModule.PurchaseExperience] = {
			context = var4,
			eventType = eventTypes.ButtonClick,
			additionalInfo = { btn = btnValuesModule.PurchaseExperience, subpage = var5 },
			formatRulesForAdditionalInfo = { profileUserId = var3, uid = var3 }
		},
		[eventNamesModule.PurchaseExperienceAttempt] = {
			context = var4,
			eventType = eventTypes.PurchaseExperienceAttempt,
			additionalInfo = { subpage = var5 },
			formatRulesForAdditionalInfo = { universeId = var3, profileUserId = var3, status = var3 }
		},
		[eventNamesModule.CancelPurchaseExperience] = {
			context = var4,
			eventType = eventTypes.ButtonClick,
			additionalInfo = {
				btn = btnValuesModule.CancelPurchaseExperience,
				subpage = var5
			},
			formatRulesForAdditionalInfo = { universeId = var3, profileUserId = var3 }
		},
		[eventNamesModule.UnableToJoinViewDetails] = {
			context = var4,
			eventType = eventTypes.ButtonClick,
			additionalInfo = {
				btn = btnValuesModule.UnableToJoinViewDetails,
				subpage = var5
			},
			formatRulesForAdditionalInfo = { universeId = var3, profileUserId = var3 }
		},
		[eventNamesModule.UnableToJoinCancel] = {
			context = var4,
			eventType = eventTypes.ButtonClick,
			additionalInfo = { btn = btnValuesModule.UnableToJoinCancel, subpage = var5 },
			formatRulesForAdditionalInfo = { universeId = var3, profileUserId = var3 }
		}
	}
end