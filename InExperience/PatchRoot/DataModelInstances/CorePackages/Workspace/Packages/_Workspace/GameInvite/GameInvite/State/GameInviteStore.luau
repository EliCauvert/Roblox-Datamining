local parent = script.Parent
local roduxModule = require(parent.Parent.Parent.Rodux)

return roduxModule.Store.new(require(parent.Reducers.GameInviteReducer), nil, { roduxModule.thunkMiddleware })