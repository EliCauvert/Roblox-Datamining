local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local Jest = require(Parent.Dev.JestGlobals).jest
Jest.mock(Parent.SocialExperiments, function()
	-- upvalues: Jest (copy), Parent (copy)
	local RequireActualResult = Jest.requireActual(Parent.SocialExperiments)
	RequireActualResult.ScheduledPartiesExperimentation = {
		getScheduledPartiesTooltipEnabled = function(): boolean
			return false
		end,
		logExposure = function() end
	}
	
	return RequireActualResult
end)
local RenderFunction = require(Parent.Dev.ReactTestingLibrary).render
local BenchmarkFunction = require(Parent.Dev.JestBenchmark).benchmark
local BenchmarkUtilsModule = require(Parent.Dev.BenchmarkUtils)
local MeasureFPSFunction = BenchmarkUtilsModule.measureFPS
local WrapWithProvidersModule = require(script.Parent.Utils.wrapWithProviders)
local CreateMockMessagesFunction = require(script.Parent.Utils.journeyUtils).createMockMessages
local ChatConversationModule = require(AppChat.Components.ChatConversation.ChatConversation)
local State = { ChatAppReducer = { Presence = { byUserId = {} } } }

local function createChatConversationProps(p1)
	-- upvalues: CreateMockMessagesFunction (copy)
	return {
		conversationId = "test-conversation-123",
		conversationTitle = "Test Conversation",
		topBarHeight = 48,
		wideMode = false,
		chatInputPlaceholder = "Say something...",
		itemList = CreateMockMessagesFunction(p1),
		getOlderMessages = function() end,
		sendMessage = function() end,
		navigateToToast = function() end,
		markConversationAsRead = function() end,
		postTypingStatus = function() end,
		navigateBack = function() end,
		openViewProfile = function() end,
		updateConversationTitle = function() end,
		openGameDetailsPage = function() end,
		navigateToScreen = function() end,
		navigateToSquadLobby = function() end,
		usersTyping = {}
	}
end

local function createTestWrapper(p1)
	-- upvalues: WrapWithProvidersModule (copy), ReactModule (copy), State (copy)
	return WrapWithProvidersModule(ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(400, 700)
	}, p1), { rodux = { state = State } })
end

BenchmarkUtilsModule.benchFile(script, function()
	-- upvalues: BenchmarkFunction (copy), RenderFunction (copy), createTestWrapper (copy), ReactModule (copy), ChatConversationModule (copy), createChatConversationProps (copy), MeasureFPSFunction (copy)
	BenchmarkFunction("Render ChatConversation with 10 messages", function()
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), ChatConversationModule (upval), createChatConversationProps (upval)
		RenderFunction(createTestWrapper({
			Conversation = ReactModule.createElement(ChatConversationModule, (createChatConversationProps(10)))
		})):unmount()
	end)
	BenchmarkFunction("Render ChatConversation with 25 messages", function()
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), ChatConversationModule (upval), createChatConversationProps (upval)
		RenderFunction(createTestWrapper({
			Conversation = ReactModule.createElement(ChatConversationModule, (createChatConversationProps(25)))
		})):unmount()
	end)
	BenchmarkFunction("Render ChatConversation with 50 messages", function()
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), ChatConversationModule (upval), createChatConversationProps (upval)
		RenderFunction(createTestWrapper({
			Conversation = ReactModule.createElement(ChatConversationModule, (createChatConversationProps(50)))
		})):unmount()
	end)
	BenchmarkFunction("Render ChatConversation wideMode with 25 messages", function()
		-- upvalues: createChatConversationProps (upval), RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), ChatConversationModule (upval)
		local ChatConversationProps = createChatConversationProps(25)
		ChatConversationProps.wideMode = true
		RenderFunction(createTestWrapper({
			Conversation = ReactModule.createElement(ChatConversationModule, ChatConversationProps)
		})):unmount()
	end)
	BenchmarkFunction("ChatConversation FPS with 25 messages", function(p1)
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), ChatConversationModule (upval), createChatConversationProps (upval), MeasureFPSFunction (upval)
		local RenderResult = RenderFunction(createTestWrapper({
			Conversation = ReactModule.createElement(ChatConversationModule, (createChatConversationProps(25)))
		}))
		MeasureFPSFunction(p1, 0.3)
		RenderResult:unmount()
	end)
	BenchmarkFunction("ChatConversation FPS with 50 messages", function(p1)
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), ChatConversationModule (upval), createChatConversationProps (upval), MeasureFPSFunction (upval)
		local RenderResult = RenderFunction(createTestWrapper({
			Conversation = ReactModule.createElement(ChatConversationModule, (createChatConversationProps(50)))
		}))
		MeasureFPSFunction(p1, 0.3)
		RenderResult:unmount()
	end)
end)