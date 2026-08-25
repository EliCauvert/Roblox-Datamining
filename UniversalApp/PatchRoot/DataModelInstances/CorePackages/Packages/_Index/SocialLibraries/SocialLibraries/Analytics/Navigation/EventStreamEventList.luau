local eventNamesModule = require(script.Parent.EventNames)
local enumsModule = require(script.Parent.Parent.Enums)
local contexts = enumsModule.Contexts
local eventTypes = enumsModule.EventTypes
local subPages = enumsModule.SubPages
local pages = enumsModule.Pages
local btnValuesModule = require(script.Parent.BtnValues)

local var3 = function(p0)
	return tostring(p0)
end

return {
	[eventNamesModule.HomePage_Carousel_LuaProfile] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = btnValuesModule.PlayerProfile,
			subpage = subPages.PeekView,
			page = pages.PlayerProfile
		},
		formatRulesForAdditionalInfo = { uid = var3 }
	},
	[eventNamesModule.HomePage_Carousel_FriendsLanding] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.FriendsLanding },
		formatRulesForAdditionalInfo = { uid = var3 }
	},
	[eventNamesModule.MorePage_FriendsLanding] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.FriendsLanding },
		formatRulesForAdditionalInfo = { uid = var3 }
	}
}