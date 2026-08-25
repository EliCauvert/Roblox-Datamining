local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local responsiveModule = require(parent.Responsive)
local useIsWideMode = require(parent.SocialCommon).Hooks.useIsWideMode
local fIntAppChatWideBreakpointMinHeightModule = require(appChat.Flags.FIntAppChatWideBreakpointMinHeight)
local fIntAppChatWideBreakpointMinWidthModule = require(appChat.Flags.FIntAppChatWideBreakpointMinWidth)

return function(p0)
	-- upvalues: useIsWideMode (ref), responsiveModule (ref), fIntAppChatWideBreakpointMinWidthModule (ref), fIntAppChatWideBreakpointMinHeightModule (ref)
	return if p0 then if responsiveModule.useOrientation() == responsiveModule.Keys.Portrait or not (responsiveModule.useResponsive({
		{
			Key = "wide",
			minWidth = fIntAppChatWideBreakpointMinWidthModule,
			minHeight = fIntAppChatWideBreakpointMinHeightModule
		}
	}) == "wide") then false else true else useIsWideMode()
end