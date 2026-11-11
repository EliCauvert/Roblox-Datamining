local DiagEventTypes = require(script:FindFirstAncestor("SocialOnboardingButtons").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes
local EventNamesModule = require(script.Parent.EventNames)

return {
	[EventNamesModule.AddFriendsBtn] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("AddFriendsBtnCounter", "AddFriendsBtnCounter")
	},
	[EventNamesModule.FindContactsBtn] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("FindContactsBtnCounter", "FindContactsBtnCounter")
	},
	[EventNamesModule.MyQRCodeBtn] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("MyQRCodeBtnCounter", "MyQRCodeBtnCounter")
	},
	[EventNamesModule.SearchPeopleBtn] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("SearchPeopleBtnCounter", "SearchPeopleBtnCounter")
	},
	[EventNamesModule.UnlockVoiceBtn] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("UnlockVoiceBtnCounter", "UnlockVoiceBtnCounter")
	},
	[EventNamesModule.MyProfileBtn] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("MyProfileBtnCounter", "MyProfileBtnCounter")
	}
}