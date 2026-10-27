local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local RenderFunction = require(Parent.Dev.ReactTestingLibrary).render
local BenchmarkUtilsModule = require(Parent.Dev.BenchmarkUtils)
local BenchmarkWarmFunction = BenchmarkUtilsModule.benchmarkWarm
local BenchmarkInstanceCountFunction = BenchmarkUtilsModule.benchmarkInstanceCount
local Element = ReactModule.createElement(require(Parent.Foundation).FoundationProvider, nil, ReactModule.createElement(require(ChatUIPrimitives.Components.ChatInputBar.ChatInputBarView), {
	canLocalUserChat = true,
	placeholderText = "Write a message",
	onSend = function(_) end,
	autocomplete = { commands = nil, emojis = true }
}))
BenchmarkUtilsModule.benchFile(script, function()
	-- upvalues: BenchmarkWarmFunction (copy), RenderFunction (copy), Element (copy), BenchmarkInstanceCountFunction (copy)
	BenchmarkWarmFunction("Render ChatInputBarView (emoji autocomplete)", function()
		-- upvalues: RenderFunction (upval), Element (upval)
		RenderFunction(Element):unmount()
	end)
	BenchmarkInstanceCountFunction("Mount ChatInputBarView (emoji autocomplete)", Element)
end)