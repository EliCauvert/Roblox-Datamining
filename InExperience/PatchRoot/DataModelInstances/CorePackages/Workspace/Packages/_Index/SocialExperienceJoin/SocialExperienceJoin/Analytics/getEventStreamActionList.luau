local socialLuaAnalyticsModule = require(script:FindFirstAncestor("SocialExperienceJoin").Parent.SocialLuaAnalytics)
local contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local subPages = socialLuaAnalyticsModule.Analytics.Enums.SubPages
local eventNamesModule = require(script.Parent.EventNames)
local btnValuesModule = require(script.Parent.BtnValues)

local var1 = function(p1)
	return p1
end

local playerProfile = contexts.PlayerProfile
local peekView = subPages.PeekView

return function(p1)
	-- upvalues: playerProfile (ref), peekView (ref), eventNamesModule (ref), eventTypes (ref), btnValuesModule (ref), var1 (ref)
	local var2 = if p1 then p1.context else playerProfile
	local var3 = if p1 then p1.subpage else peekView
	
	return {
		[eventNamesModule.JoinExperience] = {
			context = var2,
			eventType = eventTypes.JoinGameInPeopleList,
			additionalInfo = { btn = btnValuesModule.JoinExperience, subpage = var3 },
			formatRulesForAdditionalInfo = {
				placeId = var1,
				rootPlaceId = var1,
				gameInstanceId = var1,
				profileUserId = var1,
				uid = var1,
				isHomePageCarousel = var1,
				absolutePosition = var1,
				joinAttemptId = var1,
				status = var1
			}
		},
		[eventNamesModule.PurchaseExperience] = {
			context = var2,
			eventType = eventTypes.ButtonClick,
			additionalInfo = { btn = btnValuesModule.PurchaseExperience, subpage = var3 },
			formatRulesForAdditionalInfo = { profileUserId = var1, uid = var1 }
		},
		[eventNamesModule.PurchaseExperienceAttempt] = {
			context = var2,
			eventType = eventTypes.PurchaseExperienceAttempt,
			additionalInfo = { subpage = var3 },
			formatRulesForAdditionalInfo = { universeId = var1, profileUserId = var1, status = var1 }
		},
		[eventNamesModule.CancelPurchaseExperience] = {
			context = var2,
			eventType = eventTypes.ButtonClick,
			additionalInfo = {
				btn = btnValuesModule.CancelPurchaseExperience,
				subpage = var3
			},
			formatRulesForAdditionalInfo = { universeId = var1, profileUserId = var1 }
		},
		[eventNamesModule.UnableToJoinViewDetails] = {
			context = var2,
			eventType = eventTypes.ButtonClick,
			additionalInfo = {
				btn = btnValuesModule.UnableToJoinViewDetails,
				subpage = var3
			},
			formatRulesForAdditionalInfo = { universeId = var1, profileUserId = var1 }
		},
		[eventNamesModule.UnableToJoinCancel] = {
			context = var2,
			eventType = eventTypes.ButtonClick,
			additionalInfo = { btn = btnValuesModule.UnableToJoinCancel, subpage = var3 },
			formatRulesForAdditionalInfo = { universeId = var1, profileUserId = var1 }
		}
	}
end