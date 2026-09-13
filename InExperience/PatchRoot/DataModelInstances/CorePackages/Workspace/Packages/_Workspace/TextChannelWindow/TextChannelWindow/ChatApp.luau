local parent = script.Parent.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local textChatWindowInputBarHostModule = require(script.Parent.TextChatWindowInputBarHost)
local chatWindowTopBannerModule = require(script.Parent.ChatWindowTopBanner)
local messageListAreaModule = require(script.Parent.MessageListArea)
local _ = require(script.Parent.Message)
local themeFromBackgroundColorModule = require(script.Parent.themeFromBackgroundColor)
local fFlagExpChatTextChannelWindowThemeByBackgroundModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowThemeByBackground)
local createNextOrder = reactUtilsModule.createNextOrder

local function ChatAppInner(p1)
	-- upvalues: foundationModule (ref), createNextOrder (ref), reactModule (ref), fFlagExpChatTextChannelWindowThemeByBackgroundModule (ref), messageListAreaModule (ref), textChatWindowInputBarHostModule (ref), chatWindowTopBannerModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = createNextOrder()
	
	return reactModule.createElement(foundationModule.View, { Size = p1.Size or UDim2.fromScale(1, 1) }, {
		chatView = reactModule.createElement(foundationModule.View, {
			tag = "col fill clip",
			cornerRadius = if not fFlagExpChatTextChannelWindowThemeByBackgroundModule then UDim.new(0, var1.Radius.Medium) else nil,
			Size = UDim2.fromScale(1, 1),
			backgroundStyle = if not fFlagExpChatTextChannelWindowThemeByBackgroundModule then {
				Transparency = 0.3,
				Color3 = var1.DarkMode.Surface.Surface_100.Color3
			} else nil
		}, {
			messageList = reactModule.createElement(foundationModule.View, {
				tag = "fill",
				LayoutOrder = var2(),
				Size = UDim2.fromScale(1, 0)
			}, {
				content = reactModule.createElement(messageListAreaModule, {
					channelState = p1.channelState,
					messagesSignal = p1.messagesSignal,
					fontFace = p1.fontFace,
					windowName = p1.windowName
				})
			}),
			inputBar = reactModule.createElement(foundationModule.View, {
				tag = "auto-y padding-small",
				LayoutOrder = var2(),
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				host = reactModule.createElement(textChatWindowInputBarHostModule, {
					targetChannel = p1.targetChannel,
					canLocalUserChat = p1.canLocalUserChat,
					localUserId = p1.localUserId,
					fontFace = p1.fontFace
				})
			})
		}),
		topBanner = reactModule.createElement(chatWindowTopBannerModule, {
			ZIndex = 2,
			messagesSignal = p1.messagesSignal,
			targetChannel = p1.targetChannel
		})
	})
end

return function(p1)
	-- upvalues: fFlagExpChatTextChannelWindowThemeByBackgroundModule (ref), themeFromBackgroundColorModule (ref), foundationModule (ref), reactModule (ref), ChatAppInner (ref)
	return reactModule.createElement(foundationModule.FoundationProvider, {
		colorMode = if fFlagExpChatTextChannelWindowThemeByBackgroundModule and p1.backgroundColor then themeFromBackgroundColorModule(p1.backgroundColor) else foundationModule.Enums.ColorMode.Dark
	}, { inner = reactModule.createElement(ChatAppInner, p1) })
end