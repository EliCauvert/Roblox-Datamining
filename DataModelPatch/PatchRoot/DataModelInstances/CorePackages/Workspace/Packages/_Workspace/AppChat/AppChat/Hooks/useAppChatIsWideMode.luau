local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ResponsiveModule = require(Parent.Responsive)
local UseIsWideModeFunction = require(Parent.SocialCommon).Hooks.useIsWideMode
local FIntAppChatWideBreakpointMinHeightModule = require(AppChat.Flags.FIntAppChatWideBreakpointMinHeight)
local FIntAppChatWideBreakpointMinWidthModule = require(AppChat.Flags.FIntAppChatWideBreakpointMinWidth)

return function(p1)
	-- upvalues: UseIsWideModeFunction (copy), ResponsiveModule (copy), FIntAppChatWideBreakpointMinWidthModule (copy), FIntAppChatWideBreakpointMinHeightModule (copy)
	local UseIsWideModeResult = UseIsWideModeFunction()
	local UseOrientationResult = ResponsiveModule.useOrientation()
	local IsWide = ResponsiveModule.useResponsive({
		{
			Key = "wide",
			minWidth = FIntAppChatWideBreakpointMinWidthModule,
			minHeight = FIntAppChatWideBreakpointMinHeightModule
		}
	}) == "wide"
	
	return if p1 then UseOrientationResult ~= ResponsiveModule.Keys.Portrait and IsWide else UseIsWideModeResult
end