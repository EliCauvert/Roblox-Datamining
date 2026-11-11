local EventTypes = require(script:FindFirstAncestor("SocialOnboardingButtons").Parent.SocialLuaAnalytics).Analytics.Enums.EventTypes
local EventNamesModule = require(script.Parent.EventNames)
local BtnValuesModule = require(script.Parent.BtnValues)

return function(Context)
	-- upvalues: EventNamesModule (copy), EventTypes (copy), BtnValuesModule (copy)
	return {
		[EventNamesModule.AddFriendsBtn] = {
			context = Context,
			eventType = EventTypes.ButtonClick,
			additionalInfo = { btn = BtnValuesModule.AddFriends }
		},
		[EventNamesModule.FindContactsBtn] = {
			context = Context,
			eventType = EventTypes.ButtonClick,
			additionalInfo = { btn = BtnValuesModule.FindContacts }
		},
		[EventNamesModule.MyQRCodeBtn] = {
			context = Context,
			eventType = EventTypes.ButtonClick,
			additionalInfo = { btn = BtnValuesModule.MyQRCode }
		},
		[EventNamesModule.SearchPeopleBtn] = {
			context = Context,
			eventType = EventTypes.ButtonClick,
			additionalInfo = { btn = BtnValuesModule.SearchPeople }
		},
		[EventNamesModule.UnlockVoiceBtn] = {
			context = Context,
			eventType = EventTypes.ButtonClick,
			additionalInfo = { btn = BtnValuesModule.UnlockVoice }
		},
		[EventNamesModule.MyProfileBtn] = {
			context = Context,
			eventType = EventTypes.ButtonClick,
			additionalInfo = { btn = BtnValuesModule.MyProfile }
		}
	}
end