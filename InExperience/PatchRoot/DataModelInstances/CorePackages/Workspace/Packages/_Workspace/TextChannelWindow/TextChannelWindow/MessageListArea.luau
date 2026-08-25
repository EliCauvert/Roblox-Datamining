local parent = script.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local textChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local useInExperienceLocalization = require(parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local messageLayoutContainer = chatUIPrimitivesModule.MessageLayoutContainer

return function(p0)
	-- upvalues: foundationModule (ref), useInExperienceLocalization (ref), reactModule (ref), textChannelWindowAnalyticsModule (ref), messageLayoutContainer (ref)
	local var4 = foundationModule.Hooks.useTokens()
	local var5 = useInExperienceLocalization()
	
	return if p0.channelState == "no-channel" then reactModule.createElement(foundationModule.Empty, {
		icon = { name = "icons/status/oof_xlarge" },
		text = var5("CoreScripts.TextChat.Error.NoChannelSelected")
	}) elseif p0.channelState == "not-member" then reactModule.createElement(foundationModule.Empty, {
		icon = { name = "icons/status/oof_xlarge" },
		text = var5("CoreScripts.TextChat.Error.NoChannelAccess")
	}) elseif p0.channelState == "member" then reactModule.createElement(messageLayoutContainer, {
		layoutStyle = "textLine",
		messagesSignal = p0.messagesSignal,
		fontFace = p0.fontFace,
		Size = UDim2.fromScale(1, 1),
		contentPadding = {
			top = UDim.new(0, var4.Size.Size_100),
			bottom = UDim.new(0, var4.Size.Size_100),
			left = UDim.new(0, var4.Size.Size_200),
			right = UDim.new(0, var4.Size.Size_1400)
		},
		onScroll = reactModule.useMemo(function()
			-- upvalues: textChannelWindowAnalyticsModule (copy), p0 (ref)
			return textChannelWindowAnalyticsModule.createOnScrollCallback(p0.windowName)
		end, { p0.windowName })
	}) else reactModule.createElement(foundationModule.Empty, {
		icon = { name = "icons/status/oof_xlarge" },
		text = var5("CoreScripts.TextChat.InputBar.Hint.ChatUnavailable")
	})
end