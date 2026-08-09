local parent = script.Parent.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local textChatWindowInputBarHostModule = require(script.Parent.TextChatWindowInputBarHost)
local chatWindowTopBannerModule = require(script.Parent.ChatWindowTopBanner)
local createNextOrder = reactUtilsModule.createNextOrder
local messageLayoutContainer = chatUIPrimitivesModule.MessageLayoutContainer
local _ = { Pending = "pending", Failed = "failed" }

local function ChatAppInner(p0) --[[ line: 48 ]]
	-- upvalues: foundationModule (ref), createNextOrder (ref), reactModule (ref), messageLayoutContainer (ref), textChatWindowInputBarHostModule (ref), chatWindowTopBannerModule (ref)
	local var7 = foundationModule.Hooks.useTokens()
	local var8 = createNextOrder()
	
	return reactModule.createElement(foundationModule.View, { Size = p0.Size or UDim2.fromScale(1, 1) }, {
		chatView = reactModule.createElement(foundationModule.View, {
			tag = "col fill clip",
			cornerRadius = UDim.new(0, var7.Radius.Medium),
			Size = UDim2.fromScale(1, 1),
			backgroundStyle = {
				Transparency = 0.3,
				Color3 = var7.DarkMode.Surface.Surface_100.Color3
			}
		}, {
			messageList = reactModule.createElement(foundationModule.View, {
				tag = "fill",
				LayoutOrder = var8(),
				Size = UDim2.fromScale(1, 0)
			}, {
				container = reactModule.createElement(messageLayoutContainer, {
					layoutStyle = "textLine",
					messagesSignal = p0.messagesSignal,
					Size = UDim2.fromScale(1, 1),
					contentPadding = {
						top = UDim.new(0, var7.Size.Size_100),
						bottom = UDim.new(0, var7.Size.Size_100),
						left = UDim.new(0, var7.Size.Size_200),
						right = UDim.new(0, 56)
					}
				})
			}),
			inputBar = reactModule.createElement(foundationModule.View, {
				tag = "auto-y padding-small",
				LayoutOrder = var8(),
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

return function(p1) --[[ line: 106 | named "ChatApp" ]]
	-- upvalues: reactModule (ref), foundationModule (ref), ChatAppInner (ref)
	return reactModule.createElement(foundationModule.FoundationProvider, { theme = foundationModule.Enums.Theme.Dark }, { inner = reactModule.createElement(ChatAppInner, p1) })
end