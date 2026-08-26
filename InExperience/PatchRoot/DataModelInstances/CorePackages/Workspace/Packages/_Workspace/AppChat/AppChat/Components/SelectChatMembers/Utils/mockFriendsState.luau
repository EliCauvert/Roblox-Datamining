local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local userModel = require(parent.UserLib).Models.UserModel
local mockUser = require(parent.UserLib).Models.MockUser
local mockUserDataModule = require(appChat.Users.MockUserData)
local var1 = mockUser.new()
local _1 = mockUserDataModule.USERS["1"]
var1.name = _1.displayName
var1.id = _1.id
var1.presence = userModel.PresenceType.ONLINE
var1.lastLocation = _1.lastLocation
var1.isFriend = true
local var2 = mockUser.new()
local _2 = mockUserDataModule.USERS["2"]
var2.name = _2.displayName
var2.id = _2.id
var2.presence = userModel.PresenceType.IN_GAME
var2.lastLocation = _2.lastLocation
var2.isFriend = true
local var3 = mockUser.new()
local _3 = mockUserDataModule.USERS["3"]
var3.name = _3.displayName
var3.id = _3.id
var3.isFriend = true

return {
	Users = { [1] = var1, [2] = var2, [3] = var3 },
	ChatAppReducer = {
		Presence = { byUserId = mockUserDataModule.createMockPresenceData() }
	}
}