local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local UseInExperienceLocalizationModule = require(script.Parent.useInExperienceLocalization)
local MessageLayoutContainer = require(Parent.ChatUIPrimitives).MessageLayoutContainer

return function(p1)
	-- upvalues: FoundationModule (copy), UseInExperienceLocalizationModule (copy), ReactModule (copy), MessageLayoutContainer (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseInExperienceLocalizationModuleResult = UseInExperienceLocalizationModule()
	
	return if p1.channelState == "no-channel" then ReactModule.createElement(FoundationModule.Empty, {
		icon = { name = "icons/status/oof_xlarge" },
		text = UseInExperienceLocalizationModuleResult("CoreScripts.TextChat.Error.NoChannelSelected")
	}) elseif p1.channelState == "not-member" then ReactModule.createElement(FoundationModule.Empty, {
		icon = { name = "icons/status/oof_xlarge" },
		text = UseInExperienceLocalizationModuleResult("CoreScripts.TextChat.Error.NoChannelAccess")
	}) elseif p1.channelState == "member" then ReactModule.createElement(MessageLayoutContainer, {
		layoutStyle = "textLine",
		messagesSignal = p1.messagesSignal,
		Size = UDim2.fromScale(1, 1),
		contentPadding = {
			top = UDim.new(0, UseTokensResult.Size.Size_100),
			bottom = UDim.new(0, UseTokensResult.Size.Size_100),
			left = UDim.new(0, UseTokensResult.Size.Size_200),
			right = UDim.new(0, 56)
		}
	}) else ReactModule.createElement(FoundationModule.Empty, {
		icon = { name = "icons/status/oof_xlarge" },
		text = UseInExperienceLocalizationModuleResult("CoreScripts.TextChat.InputBar.Hint.ChatUnavailable")
	})
end