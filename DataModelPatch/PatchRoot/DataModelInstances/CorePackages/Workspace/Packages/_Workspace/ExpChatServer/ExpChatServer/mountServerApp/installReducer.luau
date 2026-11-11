local Parent = script:FindFirstAncestor("ExpChatServer").Parent

return require(Parent.Rodux).combineReducers({ Players = require(Parent.ExpChatShared).Reducers.Players })