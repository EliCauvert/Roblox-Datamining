local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local DescribeFunction = require(Parent.Dev.JestGlobals).describe
local RenderFunction = require(Parent.Dev.ReactTestingLibrary).render
local BenchmarkFunction = require(Parent.Dev.JestBenchmark).benchmark
local BenchmarkUtilsModule = require(Parent.Dev.BenchmarkUtils)
local BenchFileFunction: (any, any) -> () = BenchmarkUtilsModule.benchFile
local MountComponentTimesFunction = BenchmarkUtilsModule.mountComponentTimes
local ScrollComponentTimesFunction = BenchmarkUtilsModule.scrollComponentTimes
local CreateMockConversationFunction = require(script.Parent.Utils.journeyUtils).createMockConversation
local WrapWithProvidersModule = require(script.Parent.Utils.wrapWithProviders)
local ConversationEntryModule = require(AppChat.Components.ChatLanding.ConversationEntry)

local function createMockConversationForIndex(p1: number)
	-- upvalues: CreateMockConversationFunction (copy)
	return CreateMockConversationFunction("conversation-" .. tostring(p1), {
		title = "Conversation " .. tostring(p1),
		hasUnreadMessages = p1 % 3 == 0
	})
end

local function createTestWrapper(p1)
	-- upvalues: WrapWithProvidersModule (copy), ReactModule (copy)
	return WrapWithProvidersModule(ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, p1))
end

local function createConversationEntry(Conversation)
	-- upvalues: ReactModule (copy), ConversationEntryModule (copy)
	return ReactModule.createElement(ConversationEntryModule, {
		entryHeight = 64,
		boldTitle = true,
		conversation = Conversation,
		onActivated = function() end,
		fireImpressionEvent = function() end,
		fireClickEvent = function() end
	})
end

local ConversationEntry = createConversationEntry((CreateMockConversationFunction("conversation-" .. tostring(1), {
	hasUnreadMessages = false,
	title = "Conversation " .. tostring(1)
})))
local WrapWithProvidersModuleResult = WrapWithProvidersModule(ConversationEntry)
BenchFileFunction(script, function()
	-- upvalues: DescribeFunction (copy), BenchmarkFunction (copy), RenderFunction (copy), createTestWrapper (copy), ConversationEntry (copy), CreateMockConversationFunction (copy), createConversationEntry (copy), MountComponentTimesFunction (copy), WrapWithProvidersModuleResult (copy), ScrollComponentTimesFunction (copy), createMockConversationForIndex (copy)
	DescribeFunction("ConversationEntry", function()
		-- upvalues: BenchmarkFunction (upval), RenderFunction (upval), createTestWrapper (upval), ConversationEntry (upval), CreateMockConversationFunction (upval), createConversationEntry (upval), MountComponentTimesFunction (upval), WrapWithProvidersModuleResult (upval), ScrollComponentTimesFunction (upval)
		BenchmarkFunction("Render single ConversationEntry", function()
			-- upvalues: RenderFunction (upval), createTestWrapper (upval), ConversationEntry (upval)
			RenderFunction(createTestWrapper({ Entry = ConversationEntry })):unmount()
		end)
		BenchmarkFunction("Render ConversationEntry with unread messages", function()
			-- upvalues: CreateMockConversationFunction (upval), RenderFunction (upval), createTestWrapper (upval), createConversationEntry (upval)
			RenderFunction(createTestWrapper({
				Entry = createConversationEntry((CreateMockConversationFunction("conversation-" .. tostring(3), {
					hasUnreadMessages = true,
					title = "Conversation " .. tostring(3)
				})))
			})):unmount()
		end)
		MountComponentTimesFunction(WrapWithProvidersModuleResult, "ConversationEntry", 25)
		MountComponentTimesFunction(WrapWithProvidersModuleResult, "ConversationEntry", 50)
		MountComponentTimesFunction(WrapWithProvidersModuleResult, "ConversationEntry", 100)
		ScrollComponentTimesFunction(WrapWithProvidersModuleResult, "ConversationEntry", 25)
		ScrollComponentTimesFunction(WrapWithProvidersModuleResult, "ConversationEntry", 50)
	end)
	DescribeFunction("ConversationList simulation", function()
		-- upvalues: BenchmarkFunction (upval), createConversationEntry (upval), createMockConversationForIndex (upval), RenderFunction (upval), createTestWrapper (upval)
		BenchmarkFunction("Render list of 10 conversations", function()
			-- upvalues: createConversationEntry (upval), createMockConversationForIndex (upval), RenderFunction (upval), createTestWrapper (upval)
			local t = {}
			
			for i = 1, 10 do
				t["entry" .. i] = createConversationEntry(createMockConversationForIndex(i))
			end
			RenderFunction(createTestWrapper(t)):unmount()
		end)
		BenchmarkFunction("Render list of 25 conversations", function()
			-- upvalues: createConversationEntry (upval), createMockConversationForIndex (upval), RenderFunction (upval), createTestWrapper (upval)
			local t = {}
			
			for i = 1, 25 do
				t["entry" .. i] = createConversationEntry(createMockConversationForIndex(i))
			end
			RenderFunction(createTestWrapper(t)):unmount()
		end)
		BenchmarkFunction("Render list of 50 conversations", function()
			-- upvalues: createConversationEntry (upval), createMockConversationForIndex (upval), RenderFunction (upval), createTestWrapper (upval)
			local t = {}
			
			for i = 1, 50 do
				t["entry" .. i] = createConversationEntry(createMockConversationForIndex(i))
			end
			RenderFunction(createTestWrapper(t)):unmount()
		end)
	end)
end)