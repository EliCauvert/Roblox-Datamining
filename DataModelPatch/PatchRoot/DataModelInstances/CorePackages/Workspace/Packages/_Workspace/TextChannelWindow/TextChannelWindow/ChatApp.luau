local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local TextChatWindowInputBarHostModule = require(script.Parent.TextChatWindowInputBarHost)
local ChatWindowTopBannerModule = require(script.Parent.ChatWindowTopBanner)
local MessageListAreaModule = require(script.Parent.MessageListArea)
local _ = require(script.Parent.Message)
local ThemeFromBackgroundColorModule = require(script.Parent.themeFromBackgroundColor)
local ExpChatTextChannelWindowThemeByBackground = game:DefineFastFlag("ExpChatTextChannelWindowThemeByBackground", false)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder

local function ChatAppInner(p1)
	-- upvalues: FoundationModule (copy), CreateNextOrderFunction (copy), ReactModule (copy), ExpChatTextChannelWindowThemeByBackground (copy), MessageListAreaModule (copy), TextChatWindowInputBarHostModule (copy), ChatWindowTopBannerModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local NextOrder = CreateNextOrderFunction()
	
	return ReactModule.createElement(FoundationModule.View, { Size = p1.Size or UDim2.fromScale(1, 1) }, {
		chatView = ReactModule.createElement(FoundationModule.View, {
			tag = "col fill clip",
			cornerRadius = if ExpChatTextChannelWindowThemeByBackground then nil else UDim.new(0, UseTokensResult.Radius.Medium),
			Size = UDim2.fromScale(1, 1),
			backgroundStyle = if ExpChatTextChannelWindowThemeByBackground then nil else {
				Transparency = 0.3,
				Color3 = UseTokensResult.DarkMode.Surface.Surface_100.Color3
			}
		}, {
			messageList = ReactModule.createElement(FoundationModule.View, {
				tag = "fill",
				LayoutOrder = NextOrder(),
				Size = UDim2.fromScale(1, 0)
			}, {
				content = ReactModule.createElement(MessageListAreaModule, {
					channelState = p1.channelState,
					messagesSignal = p1.messagesSignal
				})
			}),
			inputBar = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-y padding-small",
				LayoutOrder = NextOrder(),
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				host = ReactModule.createElement(TextChatWindowInputBarHostModule, {
					targetChannel = p1.targetChannel,
					canLocalUserChat = p1.canLocalUserChat,
					localUserId = p1.localUserId
				})
			})
		}),
		topBanner = ReactModule.createElement(ChatWindowTopBannerModule, {
			ZIndex = 2,
			messagesSignal = p1.messagesSignal,
			targetChannel = p1.targetChannel
		})
	})
end

return function(p1)
	-- upvalues: ExpChatTextChannelWindowThemeByBackground (copy), ThemeFromBackgroundColorModule (copy), FoundationModule (copy), ReactModule (copy), ChatAppInner (copy)
	return ReactModule.createElement(FoundationModule.FoundationProvider, {
		theme = if ExpChatTextChannelWindowThemeByBackground and p1.backgroundColor then ThemeFromBackgroundColorModule(p1.backgroundColor) else FoundationModule.Enums.Theme.Dark
	}, { inner = ReactModule.createElement(ChatAppInner, p1) })
end