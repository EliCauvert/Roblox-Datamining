local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UserModel = require(Parent.UserLib).Models.UserModel
local MockUser = require(Parent.UserLib).Models.MockUser
local MockUserDataModule = require(AppChat.Users.MockUserData)
local NewMockUser = MockUser.new()
local _1 = MockUserDataModule.USERS["1"]
NewMockUser.name = _1.displayName
NewMockUser.id = _1.id
NewMockUser.presence = UserModel.PresenceType.ONLINE
NewMockUser.lastLocation = _1.lastLocation
NewMockUser.isFriend = true
local NewMockUser1 = MockUser.new()
local _2 = MockUserDataModule.USERS["2"]
NewMockUser1.name = _2.displayName
NewMockUser1.id = _2.id
NewMockUser1.presence = UserModel.PresenceType.IN_GAME
NewMockUser1.lastLocation = _2.lastLocation
NewMockUser1.isFriend = true
local NewMockUser2 = MockUser.new()
local _3 = MockUserDataModule.USERS["3"]
NewMockUser2.name = _3.displayName
NewMockUser2.id = _3.id
NewMockUser2.isFriend = true

return {
	Users = {
		[1] = NewMockUser,
		[2] = NewMockUser1,
		[3] = NewMockUser2
	},
	ChatAppReducer = {
		Presence = { byUserId = MockUserDataModule.createMockPresenceData() }
	}
}