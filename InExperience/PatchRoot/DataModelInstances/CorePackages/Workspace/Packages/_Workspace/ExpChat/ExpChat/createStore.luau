local Parent = script:FindFirstAncestor("ExpChat").Parent
local ChatModerationStatusHydrationMiddlewareModule = require(Parent.AppChat.ChatModerationStatusHydrationMiddleware)
local RoduxModule = require(Parent.Rodux)
local RaiseActionAsEventMiddleware = require(Parent.ExpChatShared).RaiseActionAsEventMiddleware
local InstallReducerModule = require(script.Parent.installReducer)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return function(p1) --[[ Line: 12 | Named "createStore" ]]
	-- upvalues: RoduxModule (copy), InstallReducerModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), ChatModerationStatusHydrationMiddlewareModule (copy), RaiseActionAsEventMiddleware (copy)
	return RoduxModule.Store.new(InstallReducerModule, p1, if FFlagAppChatReactiveFeatureRestrictions then {
		RoduxModule.thunkMiddleware,
		ChatModerationStatusHydrationMiddlewareModule,
		RaiseActionAsEventMiddleware
	} else {
		RoduxModule.thunkMiddleware,
		RaiseActionAsEventMiddleware
	})
end