local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local BenchmarkFunction = require(Parent.Dev.JestBenchmark).benchmark
local BenchmarkUtilsModule = require(Parent.Dev.BenchmarkUtils)
local MountComponentTimesFunction = BenchmarkUtilsModule.mountComponentTimes
local ChatInputBarViewModule = require(ChatUIPrimitives.Components.ChatInputBar.ChatInputBarView)

local function inputBarProps() --[[ Line: 17 ]]
	return {
		canLocalUserChat = true,
		placeholderText = "Write a message",
		onSend = function(_) --[[ Line: 19 ]] end,
		autocomplete = { commands = nil, emojis = true }
	}
end

local function wrapped() --[[ Line: 26 ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), ChatInputBarViewModule (copy), inputBarProps (copy)
	return ReactModule.createElement(FoundationModule.FoundationProvider, nil, ReactModule.createElement(ChatInputBarViewModule, (inputBarProps())))
end

BenchmarkUtilsModule.benchFile(script, function() --[[ Line: 34 ]]
	-- upvalues: BenchmarkFunction (copy), Parent (copy), wrapped (copy), MountComponentTimesFunction (copy), ReactModule (copy), FoundationModule (copy), ChatInputBarViewModule (copy), inputBarProps (copy)
	BenchmarkFunction("Render ChatInputBarView (emoji autocomplete)", function() --[[ Line: 35 ]]
		-- upvalues: Parent (upval), wrapped (upval)
		require(Parent.Dev.ReactTestingLibrary).render(wrapped()):unmount()
	end)
	MountComponentTimesFunction(ReactModule.createElement(FoundationModule.FoundationProvider, nil, ReactModule.createElement(ChatInputBarViewModule, (inputBarProps()))), "ChatInputBarView", 25)
	MountComponentTimesFunction(ReactModule.createElement(FoundationModule.FoundationProvider, nil, ReactModule.createElement(ChatInputBarViewModule, (inputBarProps()))), "ChatInputBarView", 50)
end)