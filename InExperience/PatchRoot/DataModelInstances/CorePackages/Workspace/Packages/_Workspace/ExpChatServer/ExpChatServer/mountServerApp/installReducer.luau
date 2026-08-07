local parent = script:FindFirstAncestor("ExpChatServer").Parent

return require(parent.Rodux).combineReducers({ Players = require(parent.ExpChatShared).Reducers.Players })