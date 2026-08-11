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
local expChatTextChannelWindowThemeByBackground = game:DefineFastFlag("ExpChatTextChannelWindowThemeByBackground", false)
local createNextOrder = reactUtilsModule.createNextOrder

local function ChatAppInner(p0) --[[ line: 33 ]]
	-- upvalues: foundationModule (ref), createNextOrder (ref), reactModule (ref), expChatTextChannelWindowThemeByBackground (ref), messageListAreaModule (ref), textChatWindowInputBarHostModule (ref), chatWindowTopBannerModule (ref)
	local var9 = foundationModule.Hooks.useTokens()
	local var10 = createNextOrder()
	
	return reactModule.createElement(foundationModule.View, { Size = p0.Size or UDim2.fromScale(1, 1) }, {
		chatView = reactModule.createElement(foundationModule.View, {
			tag = "col fill clip",
			cornerRadius = if not expChatTextChannelWindowThemeByBackground then UDim.new(0, var9.Radius.Medium) else nil,
			Size = UDim2.fromScale(1, 1),
			backgroundStyle = if not expChatTextChannelWindowThemeByBackground then {
				Transparency = 0.3,
				Color3 = var9.DarkMode.Surface.Surface_100.Color3
			} else nil
		}, {
			messageList = reactModule.createElement(foundationModule.View, {
				tag = "fill",
				LayoutOrder = var10(),
				Size = UDim2.fromScale(1, 0)
			}, {
				content = reactModule.createElement(messageListAreaModule, {
					channelState = p0.channelState,
					messagesSignal = p0.messagesSignal,
					windowName = p0.windowName
				})
			}),
			inputBar = reactModule.createElement(foundationModule.View, {
				tag = "auto-y padding-small",
				LayoutOrder = var10(),
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				host = reactModule.createElement(textChatWindowInputBarHostModule, {
					targetChannel = p0.targetChannel,
					canLocalUserChat = p0.canLocalUserChat,
					localUserId = p0.localUserId
				})
			})
		}),
		topBanner = reactModule.createElement(chatWindowTopBannerModule, {
			ZIndex = 2,
			messagesSignal = p0.messagesSignal,
			targetChannel = p0.targetChannel
		})
	})
end

return function(p1) --[[ line: 89 | named "ChatApp" ]]
	-- upvalues: expChatTextChannelWindowThemeByBackground (ref), themeFromBackgroundColorModule (ref), foundationModule (ref), reactModule (ref), ChatAppInner (ref)
	return reactModule.createElement(foundationModule.FoundationProvider, {
		theme = if expChatTextChannelWindowThemeByBackground and p1.backgroundColor then themeFromBackgroundColorModule(p1.backgroundColor) else foundationModule.Enums.Theme.Dark
	}, { inner = reactModule.createElement(ChatAppInner, p1) })
end