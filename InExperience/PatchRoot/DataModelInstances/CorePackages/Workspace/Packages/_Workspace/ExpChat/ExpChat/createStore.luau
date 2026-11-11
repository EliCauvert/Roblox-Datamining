local Parent = script:FindFirstAncestor("ExpChat").Parent
local ChatModerationStatusHydrationMiddlewareModule = require(Parent.AppChat.ChatModerationStatusHydrationMiddleware)
local RoduxModule = require(Parent.Rodux)
local RaiseActionAsEventMiddleware = require(Parent.ExpChatShared).RaiseActionAsEventMiddleware
local InstallReducerModule = require(script.Parent.installReducer)
local StickyTabMiddlewareModule = require(script.Parent.StickyTabs.stickyTabMiddleware)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local FFlagExpChatStickyTabs = require(Parent.SharedFlags).FFlagExpChatStickyTabs

return function(p1)
	-- upvalues: FFlagExpChatStickyTabs (copy), RoduxModule (copy), InstallReducerModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), ChatModerationStatusHydrationMiddlewareModule (copy), RaiseActionAsEventMiddleware (copy), StickyTabMiddlewareModule (copy)
	return if FFlagExpChatStickyTabs then RoduxModule.Store.new(InstallReducerModule, p1, if FFlagAppChatReactiveFeatureRestrictions then {
		RoduxModule.thunkMiddleware,
		ChatModerationStatusHydrationMiddlewareModule,
		RaiseActionAsEventMiddleware,
		StickyTabMiddlewareModule
	} else {
		RoduxModule.thunkMiddleware,
		RaiseActionAsEventMiddleware,
		StickyTabMiddlewareModule
	}) else RoduxModule.Store.new(InstallReducerModule, p1, if FFlagAppChatReactiveFeatureRestrictions then {
		RoduxModule.thunkMiddleware,
		ChatModerationStatusHydrationMiddlewareModule,
		RaiseActionAsEventMiddleware
	} else {
		RoduxModule.thunkMiddleware,
		RaiseActionAsEventMiddleware
	})
end