local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ReactTestingLibraryModule = require(Parent.Dev.ReactTestingLibrary)
local RenderFunction = ReactTestingLibraryModule.render
local ActFunction = ReactTestingLibraryModule.act
local BenchmarkFunction = require(Parent.Dev.JestBenchmark).benchmark
local BenchmarkUtilsModule = require(Parent.Dev.BenchmarkUtils)
local BenchFileFunction: (any, any) -> () = BenchmarkUtilsModule.benchFile
local MountComponentTimesFunction = BenchmarkUtilsModule.mountComponentTimes
local MeasureFPSFunction = BenchmarkUtilsModule.measureFPS
local ChatInputBarModule = require(AppChat.Components.ChatConversation.ChatInputBar)
local WrapWithProvidersModule = require(script.Parent.Utils.wrapWithProviders)
local UserInputService = game:GetService("UserInputService")

local function createInputBarProps(p1)
	-- upvalues: UserInputService (copy), CryoModule (copy)
	local config = {
		initialInputText = "",
		placeholderText = "Write a message",
		inputBarDisabledText = "Chat Disabled",
		inputBoxRef = nil,
		inputBarRef = nil,
		LayoutOrder = 0,
		maxCharacterLength = 160,
		maxKeystrokeDataLength = 200,
		messageListRef = nil,
		isDisabled = false,
		disabledEndTimestampDisplay = nil,
		textChangedFallback = true,
		moreMenuEnabled = false,
		userInputService = UserInputService,
		onHeightChanged = function() end,
		onPositionChanged = function() end,
		onFocusLost = function() end,
		onSendBtnClicked = function() end,
		onSendChat = function() end,
		onTextChanged = function() end,
		onDisabledInputBarActivated = function() end,
		eventLoggingFunc = function() end
	}
	
	return if p1 then CryoModule.Dictionary.join(config, p1) else config
end

local Element = ReactModule.createElement(ChatInputBarModule, (createInputBarProps()))
local Element1 = ReactModule.createElement(ChatInputBarModule, (createInputBarProps({ initialInputText = "Hello, this is a test message!" })))
local Element2 = ReactModule.createElement(ChatInputBarModule, (createInputBarProps({
	isDisabled = true,
	disabledEndTimestampDisplay = os.time() + 300
})))
local Element3 = ReactModule.createElement(ChatInputBarModule, (createInputBarProps({ moreMenuEnabled = true })))
local WrapWithProvidersModuleResult = WrapWithProvidersModule(Element)
BenchFileFunction(script, function()
	-- upvalues: BenchmarkFunction (copy), RenderFunction (copy), WrapWithProvidersModule (copy), Element (copy), Element1 (copy), Element2 (copy), Element3 (copy), createInputBarProps (copy), ReactModule (copy), ChatInputBarModule (copy), ActFunction (copy), MountComponentTimesFunction (copy), WrapWithProvidersModuleResult (copy), MeasureFPSFunction (copy)
	BenchmarkFunction("Render empty ChatInputBar", function()
		-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), Element (upval)
		RenderFunction(WrapWithProvidersModule(Element)):unmount()
	end)
	BenchmarkFunction("Render ChatInputBar with initial text", function()
		-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), Element1 (upval)
		RenderFunction(WrapWithProvidersModule(Element1)):unmount()
	end)
	BenchmarkFunction("Render disabled ChatInputBar", function()
		-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), Element2 (upval)
		RenderFunction(WrapWithProvidersModule(Element2)):unmount()
	end)
	BenchmarkFunction("Render ChatInputBar with more menu enabled", function()
		-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), Element3 (upval)
		RenderFunction(WrapWithProvidersModule(Element3)):unmount()
	end)
	BenchmarkFunction("Re-render ChatInputBar with text changes", function()
		-- upvalues: createInputBarProps (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), ChatInputBarModule (upval), ActFunction (upval)
		local RenderResult = RenderFunction(WrapWithProvidersModule(ReactModule.createElement(ChatInputBarModule, (createInputBarProps()))))
		
		for _, InitialInputText in ipairs({
			"H", "He", "Hel", "Hell", "Hello", "Hello!"
		}) do
			ActFunction(function()
				-- upvalues: createInputBarProps (upval), InitialInputText (copy), RenderResult (copy), WrapWithProvidersModule (upval), ReactModule (upval), ChatInputBarModule (upval)
				RenderResult:rerender(WrapWithProvidersModule(ReactModule.createElement(ChatInputBarModule, (createInputBarProps({ initialInputText = InitialInputText })))))
			end)
		end
		RenderResult:unmount()
	end)
	BenchmarkFunction("Re-render ChatInputBar with long message", function()
		-- upvalues: createInputBarProps (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), ChatInputBarModule (upval), ActFunction (upval)
		local RenderResult = RenderFunction(WrapWithProvidersModule(ReactModule.createElement(ChatInputBarModule, (createInputBarProps()))))
		local Repeated = string.rep("a", 160)
		ActFunction(function()
			-- upvalues: createInputBarProps (upval), Repeated (copy), RenderResult (copy), WrapWithProvidersModule (upval), ReactModule (upval), ChatInputBarModule (upval)
			RenderResult:rerender(WrapWithProvidersModule(ReactModule.createElement(ChatInputBarModule, (createInputBarProps({ initialInputText = Repeated })))))
		end)
		RenderResult:unmount()
	end)
	MountComponentTimesFunction(WrapWithProvidersModuleResult, "ChatInputBar", 25)
	MountComponentTimesFunction(WrapWithProvidersModuleResult, "ChatInputBar", 50)
	BenchmarkFunction("ChatInputBar FPS (empty)", function(p1)
		-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), Element (upval), MeasureFPSFunction (upval)
		local RenderResult = RenderFunction(WrapWithProvidersModule(Element))
		MeasureFPSFunction(p1, 0.3)
		RenderResult:unmount()
	end)
	BenchmarkFunction("ChatInputBar FPS (with text)", function(p1)
		-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), Element1 (upval), MeasureFPSFunction (upval)
		local RenderResult = RenderFunction(WrapWithProvidersModule(Element1))
		MeasureFPSFunction(p1, 0.3)
		RenderResult:unmount()
	end)
end)