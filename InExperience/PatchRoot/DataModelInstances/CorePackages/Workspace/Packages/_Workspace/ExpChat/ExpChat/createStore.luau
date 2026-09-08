local parent = script:FindFirstAncestor("ExpChat").Parent
local chatModerationStatusHydrationMiddlewareModule = require(parent.AppChat.ChatModerationStatusHydrationMiddleware)
local roduxModule = require(parent.Rodux)
local raiseActionAsEventMiddleware = require(parent.ExpChatShared).RaiseActionAsEventMiddleware
local installReducerModule = require(script.Parent.installReducer)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return function(p1)
	-- upvalues: roduxModule (ref), installReducerModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), chatModerationStatusHydrationMiddlewareModule (ref), raiseActionAsEventMiddleware (ref)
	return roduxModule.Store.new(installReducerModule, p1, if fFlagAppChatReactiveFeatureRestrictions then {
		roduxModule.thunkMiddleware,
		chatModerationStatusHydrationMiddlewareModule,
		raiseActionAsEventMiddleware
	} else {
		roduxModule.thunkMiddleware,
		raiseActionAsEventMiddleware
	})
end