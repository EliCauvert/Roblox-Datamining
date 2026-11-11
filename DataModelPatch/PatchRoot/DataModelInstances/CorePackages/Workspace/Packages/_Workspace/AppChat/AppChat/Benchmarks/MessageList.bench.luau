local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RenderFunction = require(Parent.Dev.ReactTestingLibrary).render
local BenchmarkFunction = require(Parent.Dev.JestBenchmark).benchmark
local BenchmarkUtilsModule = require(Parent.Dev.BenchmarkUtils)
local MeasureFPSFunction = BenchmarkUtilsModule.measureFPS
local WrapWithProvidersModule = require(script.Parent.Utils.wrapWithProviders)
local CreateMockMessagesFunction = require(script.Parent.Utils.journeyUtils).createMockMessages
local MessageListModule = require(AppChat.Components.ChatConversation.MessageList)
local State = { ChatAppReducer = { Presence = { byUserId = {} } } }

local function createMessageListProps(p1)
	-- upvalues: CreateMockMessagesFunction (copy)
	return {
		conversationId = "test-conversation",
		itemList = CreateMockMessagesFunction(p1),
		loadNext = function() end,
		markAsRead = function() end,
		onDetailsOpened = function() end,
		openGameDetailsPage = function() end,
		openViewProfile = function() end,
		closeKeyboard = function() end
	}
end

local function createTestWrapper(p1)
	-- upvalues: WrapWithProvidersModule (copy), ReactModule (copy), State (copy)
	return WrapWithProvidersModule(ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(400, 600)
	}, p1), { rodux = { state = State } })
end

BenchmarkUtilsModule.benchFile(script, function()
	-- upvalues: BenchmarkFunction (copy), RenderFunction (copy), createTestWrapper (copy), ReactModule (copy), MessageListModule (copy), createMessageListProps (copy), MeasureFPSFunction (copy)
	BenchmarkFunction("Render MessageList with 10 messages", function()
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), MessageListModule (upval), createMessageListProps (upval)
		RenderFunction(createTestWrapper({
			List = ReactModule.createElement(MessageListModule, (createMessageListProps(10)))
		})):unmount()
	end)
	BenchmarkFunction("Render MessageList with 25 messages", function()
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), MessageListModule (upval), createMessageListProps (upval)
		RenderFunction(createTestWrapper({
			List = ReactModule.createElement(MessageListModule, (createMessageListProps(25)))
		})):unmount()
	end)
	BenchmarkFunction("Render MessageList with 50 messages", function()
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), MessageListModule (upval), createMessageListProps (upval)
		RenderFunction(createTestWrapper({
			List = ReactModule.createElement(MessageListModule, (createMessageListProps(50)))
		})):unmount()
	end)
	BenchmarkFunction("Render MessageList with 100 messages", function()
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), MessageListModule (upval), createMessageListProps (upval)
		RenderFunction(createTestWrapper({
			List = ReactModule.createElement(MessageListModule, (createMessageListProps(100)))
		})):unmount()
	end)
	BenchmarkFunction("MessageList FPS with 50 messages", function(p1)
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), MessageListModule (upval), createMessageListProps (upval), MeasureFPSFunction (upval)
		local RenderResult = RenderFunction(createTestWrapper({
			List = ReactModule.createElement(MessageListModule, (createMessageListProps(50)))
		}))
		MeasureFPSFunction(p1, 0.3)
		RenderResult:unmount()
	end)
	BenchmarkFunction("MessageList FPS with 100 messages", function(p1)
		-- upvalues: RenderFunction (upval), createTestWrapper (upval), ReactModule (upval), MessageListModule (upval), createMessageListProps (upval), MeasureFPSFunction (upval)
		local RenderResult = RenderFunction(createTestWrapper({
			List = ReactModule.createElement(MessageListModule, (createMessageListProps(100)))
		}))
		MeasureFPSFunction(p1, 0.3)
		RenderResult:unmount()
	end)
end)