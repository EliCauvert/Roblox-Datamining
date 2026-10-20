local Parent = script.Parent
local RoduxModule = require(Parent.Parent.Parent.Rodux)

return RoduxModule.Store.new(require(Parent.Reducers.GameInviteReducer), nil, { RoduxModule.thunkMiddleware })