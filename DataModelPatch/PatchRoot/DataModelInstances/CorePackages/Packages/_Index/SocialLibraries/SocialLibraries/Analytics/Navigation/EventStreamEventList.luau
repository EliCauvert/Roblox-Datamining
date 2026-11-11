local EventNamesModule = require(script.Parent.EventNames)
local EnumsModule = require(script.Parent.Parent.Enums)
local Contexts = EnumsModule.Contexts
local EventTypes = EnumsModule.EventTypes
local BtnValuesModule = require(script.Parent.BtnValues)

local function Uid(p1): string
	return (tostring(p1))
end

return {
	[EventNamesModule.HomePage_Carousel_LuaProfile] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = BtnValuesModule.PlayerProfile,
			subpage = EnumsModule.SubPages.PeekView,
			page = EnumsModule.Pages.PlayerProfile
		},
		formatRulesForAdditionalInfo = { uid = Uid }
	},
	[EventNamesModule.HomePage_Carousel_FriendsLanding] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.FriendsLanding },
		formatRulesForAdditionalInfo = { uid = Uid }
	},
	[EventNamesModule.MorePage_FriendsLanding] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.FriendsLanding },
		formatRulesForAdditionalInfo = { uid = Uid }
	}
}