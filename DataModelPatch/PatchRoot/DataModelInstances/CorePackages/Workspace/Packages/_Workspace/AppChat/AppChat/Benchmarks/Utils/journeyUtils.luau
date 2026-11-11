local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local MessageModelModule = require(AppChat.Models.MessageModel)
local MockProvidersModule = require(AppChat.Components.MockProviders)

local function _(p1: number): number
	return (math.floor(p1 / 60))
end

local _ = function(p1: number): number
	return (math.floor(p1 / 3600))
end

local _ = function(p1: number): number
	return (math.floor(p1 / 86400))
end

local function createMockSentDate(Largest)
	local Largest1 = Largest or 0
	local Elapsed = os.time() - Largest1
	
	return {
		GetLongRelativeTime = function(): string
			-- upvalues: Largest1 (ref)
			return if Largest1 < 60 then "Just now" elseif Largest1 < 3600 then tostring((math.floor(Largest1 / 60))) .. " minutes ago" elseif Largest1 < 86400 then tostring((math.floor(Largest1 / 3600))) .. " hours ago" else tostring((math.floor(Largest1 / 86400))) .. " days ago"
		end,
		GetShortRelativeTime = function(): string
			-- upvalues: Largest1 (ref)
			return if Largest1 < 60 then "now" elseif Largest1 < 3600 then tostring((math.floor(Largest1 / 60))) .. "m" elseif Largest1 < 86400 then tostring((math.floor(Largest1 / 3600))) .. "h" else tostring((math.floor(Largest1 / 86400))) .. "d"
		end,
		GetUnixTimestamp = function()
			-- upvalues: Elapsed (copy)
			return Elapsed
		end
	}
end

local function createMockMessage(p1: number, p2)
	-- upvalues: EnumMessageTypesModule (copy), MessageModelModule (copy), createMockSentDate (copy)
	local P5 = p2 or {}
	local IsIncoming = P5.isIncoming
	
	if IsIncoming == nil then
		IsIncoming = p1 % 2 == 0
	end
	local Largest = math.max(0, (100 - p1) * 60)
	
	return {
		failed = false,
		moderated = false,
		filteredForReceivers = false,
		messageId = "journey-msg-" .. tostring(p1),
		stable_key = "journey-msg-" .. tostring(p1),
		content = P5.content or "This is test message number " .. tostring(p1),
		messageType = P5.messageType or EnumMessageTypesModule.PlainText,
		senderType = P5.senderType or MessageModelModule.SenderTypes.User,
		isIncoming = IsIncoming,
		isNewSender = p1 % 3 == 0,
		isLastMessageInMessageGroup = p1 % 3 == 2,
		showDateTime = p1 % 5 == 0,
		showDisplayName = p1 % 3 == 0,
		sent = P5.sent or createMockSentDate(Largest),
		isSending = P5.isSending or false,
		read = P5.read ~= false,
		sender = P5.sender or {
			thumbnail = "",
			id = tostring(p1 % 5 + 1),
			displayName = "User " .. tostring(p1 % 5 + 1),
			shouldShowName = p1 % 3 == 0
		}
	}
end

local function createMockConversation(p1, p2)
	local P9 = p2 or {}
	
	return {
		id = p1 or "journey-conversation-1",
		title = P9.title or "Test Conversation",
		hasUnreadMessages = P9.hasUnreadMessages or false,
		hasGroupUp = P9.hasGroupUp or false,
		conversationType = P9.conversationType or "OneToOneConversation",
		lastMessage = P9.lastMessage or {
			content = "Last message content",
			sent = DateTime.now():ToIsoDate()
		},
		participants = P9.participants or {
			{ id = "1", displayName = "Test User 1", thumbnail = "" },
			{ id = "2", displayName = "Test User 2", thumbnail = "" }
		}
	}
end

local function createMockRoduxState(p1)
	local P12 = p1 or {}
	
	return {
		AppChat = {
			conversations = P12.conversations or {},
			messages = P12.messages or {},
			users = P12.users or {},
			currentConversationId = P12.currentConversationId
		},
		LocalUserId = P12.localUserId or "123456"
	}
end

local function createMockStore(State)
	-- upvalues: createMockRoduxState (copy), RoduxModule (copy)
	local MockRoduxState = createMockRoduxState(State)
	
	return RoduxModule.Store.new(function(p1, p2)
		-- upvalues: MockRoduxState (copy)
		return if p2.type == "@@INIT" then MockRoduxState else p1 or MockRoduxState
	end, MockRoduxState, { RoduxModule.thunkMiddleware })
end

return {
	createMockSentDate = createMockSentDate,
	createMockMessage = createMockMessage,
	createMockMessages = function(p1, p2)
		-- upvalues: createMockMessage (copy)
		local List = {}
		
		for i = 1, p1 do
			table.insert(List, (createMockMessage(i, p2)))
		end
		return List
	end,
	createMockConversation = createMockConversation,
	createMockConversations = function(p3, p4)
		-- upvalues: createMockConversation (copy)
		local P11 = p4 or {}
		local List = {}
		
		for i = 1, p3 do
			table.insert(List, (createMockConversation("conversation-" .. tostring(i), {
				title = P11.title or "Conversation " .. tostring(i),
				hasUnreadMessages = if P11.hasUnreadMessages == nil then i % 3 == 0 else P11.hasUnreadMessages,
				hasGroupUp = P11.hasGroupUp,
				conversationType = P11.conversationType,
				lastMessage = P11.lastMessage,
				participants = P11.participants
			})))
		end
		return List
	end,
	createMockRoduxState = createMockRoduxState,
	createMockStore = createMockStore,
	wrapWithJourneyProviders = function(Content, p5)
		-- upvalues: ReactModule (copy), MockProvidersModule (copy), createMockStore (copy)
		local P17 = p5 or {}
		
		return ReactModule.createElement(MockProvidersModule, {
			withLayerCollector = true,
			rodux = { store = P17.store or createMockStore(P17.state) },
			themeName = P17.themeName or "Dark"
		}, {
			ScreenGui = ReactModule.createElement("ScreenGui", {}, {
				Frame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = P17.size or UDim2.fromOffset(400, 700)
				}, { Content = Content })
			})
		})
	end,
	simulateTyping = function(p5, Text: string, p6)
		local Delay = (p6 or {}).delay or 0.01
		
		for i = 1, #Text do
			p5.Text ..= string.sub(Text, i, i)
			
			if Delay > 0 then
				task.wait(Delay)
			end
		end
	end,
	simulateScroll = function(ScrollFrame, p7)
		local P21 = p7 or {}
		local Duration = P21.duration or 0.5
		local Y1 = ScrollFrame.CanvasPosition.Y
		local Y = Y1 + (P21.distance or 1000)
		local ClockTime = os.clock()
		while os.clock() - ClockTime < Duration do
			ScrollFrame.CanvasPosition = Vector2.new(0, Y1 + (Y - Y1) * ((os.clock() - ClockTime) / Duration))
			task.wait()
		end
		ScrollFrame.CanvasPosition = Vector2.new(0, Y)
	end,
	waitForCondition = function(Callback, p8): boolean
		local P22 = p8 or {}
		local Timeout = P22.timeout or 5
		local Interval = P22.interval or 0.1
		local ClockTime = os.clock()
		while os.clock() - ClockTime < Timeout do
			if Callback() then
				return true
			end
			task.wait(Interval)
		end
		return false
	end
}