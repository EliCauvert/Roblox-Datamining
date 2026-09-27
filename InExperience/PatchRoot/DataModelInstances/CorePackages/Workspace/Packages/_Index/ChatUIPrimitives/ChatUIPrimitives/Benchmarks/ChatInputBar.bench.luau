local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local benchmark = require(parent.Dev.JestBenchmark).benchmark
local benchmarkUtilsModule = require(parent.Dev.BenchmarkUtils)
local benchFile = benchmarkUtilsModule.benchFile
local mountComponentTimes = benchmarkUtilsModule.mountComponentTimes
local chatInputBarViewModule = require(chatUIPrimitives.Components.ChatInputBar.ChatInputBarView)

local function inputBarProps()
	return {
		canLocalUserChat = true,
		placeholderText = "Write a message",
		onSend = function(_) end,
		autocomplete = { commands = nil, emojis = true }
	}
end

local function wrapped()
	-- upvalues: reactModule (ref), foundationModule (ref), chatInputBarViewModule (ref), inputBarProps (ref)
	return reactModule.createElement(foundationModule.FoundationProvider, nil, reactModule.createElement(chatInputBarViewModule, inputBarProps()))
end

benchFile(script, function()
	-- upvalues: benchmark (ref), parent (ref), wrapped (ref), mountComponentTimes (ref), reactModule (ref), foundationModule (ref), chatInputBarViewModule (ref), inputBarProps (ref)
	benchmark("Render ChatInputBarView (emoji autocomplete)", function()
		-- upvalues: parent (copy), wrapped (copy)
		require(parent.Dev.ReactTestingLibrary).render(wrapped()):unmount()
	end)
	mountComponentTimes(reactModule.createElement(foundationModule.FoundationProvider, nil, reactModule.createElement(chatInputBarViewModule, inputBarProps())), "ChatInputBarView", 25)
	mountComponentTimes(reactModule.createElement(foundationModule.FoundationProvider, nil, reactModule.createElement(chatInputBarViewModule, inputBarProps())), "ChatInputBarView", 50)
end)