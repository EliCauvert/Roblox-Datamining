local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RenderFunction = require(Parent.Dev.ReactTestingLibrary).render
local BenchmarkFunction = require(Parent.Dev.JestBenchmark).benchmark
local BenchmarkUtilsModule = require(Parent.Dev.BenchmarkUtils)
local BenchFileFunction: (any, any) -> () = BenchmarkUtilsModule.benchFile
local MountComponentTimesFunction = BenchmarkUtilsModule.mountComponentTimes
local ScrollComponentTimesFunction = BenchmarkUtilsModule.scrollComponentTimes
local ChatBubbleModule = require(AppChat.Components.ChatConversation.Bubble.ChatBubble)
local WrapWithProvidersModule = require(script.Parent.Utils.wrapWithProviders)

local function createBubbleProps(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy)
	local config = {
		contentWidth = 200,
		isIncoming = false,
		isRepliedTo = false,
		imageTransparency = 0,
		padding = 12,
		hasTail = true,
		imageColor = Color3.new(0.2, 0.4, 0.8),
		onAbsoluteSizeChanged = function() end,
		setContentWidth = function() end,
		handleEvent = function() end,
		containerChildren = {
			TextLabel = ReactModule.createElement("TextLabel", {
				Text = "Hello, this is a test message!",
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 150, 0, 20)
			})
		}
	}
	
	return if p1 then CryoModule.Dictionary.join(config, p1) else config
end

local Element = ReactModule.createElement(ChatBubbleModule, (createBubbleProps({ isIncoming = true })))
local Element1 = ReactModule.createElement(ChatBubbleModule, (createBubbleProps({ isIncoming = false })))
local Element2 = ReactModule.createElement(ChatBubbleModule, (createBubbleProps({ hasTail = true })))
local Element3 = ReactModule.createElement(ChatBubbleModule, (createBubbleProps({ hasTail = false })))
local WrapWithProvidersModuleResult = WrapWithProvidersModule(Element)
local WrapWithProvidersModuleResult1 = WrapWithProvidersModule(Element1)
BenchFileFunction(script, function()
	-- upvalues: BenchmarkFunction (copy), RenderFunction (copy), WrapWithProvidersModule (copy), Element (copy), Element1 (copy), Element2 (copy), Element3 (copy), MountComponentTimesFunction (copy), WrapWithProvidersModuleResult (copy), WrapWithProvidersModuleResult1 (copy), ScrollComponentTimesFunction (copy)
	BenchmarkFunction("Render incoming ChatBubble", function()
		-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), Element (upval)
		RenderFunction(WrapWithProvidersModule(Element)):unmount()
	end)
	BenchmarkFunction("Render outgoing ChatBubble", function()
		-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), Element1 (upval)
		RenderFunction(WrapWithProvidersModule(Element1)):unmount()
	end)
	BenchmarkFunction("Render ChatBubble with tail", function()
		-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), Element2 (upval)
		RenderFunction(WrapWithProvidersModule(Element2)):unmount()
	end)
	BenchmarkFunction("Render ChatBubble without tail", function()
		-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), Element3 (upval)
		RenderFunction(WrapWithProvidersModule(Element3)):unmount()
	end)
	MountComponentTimesFunction(WrapWithProvidersModuleResult, "ChatBubble (incoming)", 50)
	MountComponentTimesFunction(WrapWithProvidersModuleResult1, "ChatBubble (outgoing)", 50)
	MountComponentTimesFunction(WrapWithProvidersModuleResult, "ChatBubble (incoming)", 100)
	ScrollComponentTimesFunction(WrapWithProvidersModuleResult, "ChatBubble", 50)
	ScrollComponentTimesFunction(WrapWithProvidersModuleResult, "ChatBubble", 100)
end)