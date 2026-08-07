local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local userModel = require(parent.UserLib).Models.UserModel
local mockUser = require(parent.UserLib).Models.MockUser
local mockUserDataModule = require(appChat.Users.MockUserData)
local var2 = mockUser.new()
local _1 = mockUserDataModule.USERS["1"]
var2.name = _1.displayName
var2.id = _1.id
var2.presence = userModel.PresenceType.ONLINE
var2.lastLocation = _1.lastLocation
var2.isFriend = true
local var3 = mockUser.new()
local _2 = mockUserDataModule.USERS["2"]
var3.name = _2.displayName
var3.id = _2.id
var3.presence = userModel.PresenceType.IN_GAME
var3.lastLocation = _2.lastLocation
var3.isFriend = true
local var4 = mockUser.new()
local _3 = mockUserDataModule.USERS["3"]
var4.name = _3.displayName
var4.id = _3.id
var4.isFriend = true

return {
	Users = { [1] = var2, [2] = var3, [3] = var4 },
	ChatAppReducer = {
		Presence = { byUserId = mockUserDataModule.createMockPresenceData() }
	}
}