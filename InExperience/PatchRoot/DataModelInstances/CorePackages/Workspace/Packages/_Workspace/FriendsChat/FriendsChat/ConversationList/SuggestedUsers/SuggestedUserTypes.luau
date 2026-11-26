local Parent = script:FindFirstAncestor("FriendsChat").Parent
local _ = require(Parent.AppChat.ConversationListTrailingItems)
local _ = require(Parent.DataHydration.FriendsRequests)
local UserListModule = require(Parent.UserList)
local _ = UserListModule.Enums.RowLayoutMode
local _ = UserListModule.Enums.RowSize

return {}