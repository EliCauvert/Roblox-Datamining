local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local RenderFunction = require(Parent.Dev.ReactTestingLibrary).render
local BenchmarkFunction = require(Parent.Dev.JestBenchmark).benchmark
local BenchmarkUtilsModule = require(Parent.Dev.BenchmarkUtils)
local BenchFileFunction: (any, any) -> () = BenchmarkUtilsModule.benchFile
local MountComponentTimesFunction = BenchmarkUtilsModule.mountComponentTimes
local ScrollComponentTimesFunction = BenchmarkUtilsModule.scrollComponentTimes
local ConfigModule = require(ExpChat.Config)
local Helpers = ExpChat.ChatWindow.Helpers
local GetMessageSettingsModule = require(Helpers.getMessageSettings)
local GetMessageTextModule = require(Helpers.getMessageText)
local TranslatedTextMessageV2Module = require(ExpChat.ChatWindow.UI.TranslatedTextMessageV2)
local ChatWindowSettings = {
	FontFace = ConfigModule.ChatWindowFont,
	TextColor3 = ConfigModule.ChatWindowTextColor3,
	TextSize = ConfigModule.ChatWindowTextSize,
	TextStrokeColor3 = ConfigModule.ChatWindowTextStrokeColor,
	TextStrokeTransparency = ConfigModule.ChatWindowTextStrokeTransparency,
	BackgroundColor3 = ConfigModule.ChatWindowBackgroundColor3,
	BackgroundTransparency = ConfigModule.ChatWindowBackgroundTransparency
}

local function createMessageElement(List) --[[ Line: 34 ]]
	-- upvalues: GetMessageSettingsModule (copy), ChatWindowSettings (copy), ReactModule (copy), TranslatedTextMessageV2Module (copy), GetMessageTextModule (copy)
	local config = {
		text = "Sample text chat message text!",
		translation = "Exemple de texte de message de chat !",
		useTranslation = false,
		prefixText = "<font color=\"#FFA500\">PrefixText</font>",
		chatWindowMessageProperties = nil,
		isUserVerified = false,
		isSpatialUIEnabled = false,
		isTrustedConnection = false,
		wasRewritten = false,
		isRewriteWindowOpen = false
	}
	
	if List then
		for i, value in List do
			config[i] = value
		end
	end
	local Message = {
		current = {
			userId = 0,
			messageId = "0",
			text = config.text,
			translation = config.translation,
			useTranslation = config.useTranslation,
			prefixText = config.prefixText,
			chatWindowMessageProperties = config.chatWindowMessageProperties
		}
	}
	local MessageSettingsModule = GetMessageSettingsModule(Message.current, ChatWindowSettings)
	
	return ReactModule.createElement(TranslatedTextMessageV2Module, {
		chatWindowSettings = ChatWindowSettings,
		textTransparency = ReactModule.createBinding(0),
		onTextMessageLabelButtonActivated = function() --[[ Line: 71 ]] end,
		isSpatialUIEnabled = config.isSpatialUIEnabled,
		originalBodyText = ReactModule.createBinding(GetMessageTextModule(Message.current.useTranslation, MessageSettingsModule.translation, MessageSettingsModule.text)),
		originalPrefixText = ReactModule.createBinding(MessageSettingsModule.prefixText or ""),
		shouldShowTranslationToggle = ReactModule.createBinding(false),
		bodyTextProperties = ReactModule.createBinding(MessageSettingsModule.bodyTextProperties),
		prefixTextProperties = ReactModule.createBinding(MessageSettingsModule.prefixTextProperties),
		layoutOrder = ReactModule.createBinding(0),
		visible = ReactModule.createBinding(true),
		isUserVerified = ReactModule.createBinding(config.isUserVerified),
		message = Message,
		isTrustedConnection = ReactModule.createBinding(config.isTrustedConnection),
		wasRewritten = ReactModule.createBinding(config.wasRewritten),
		isRewriteWindowOpen = ReactModule.createBinding(config.isRewriteWindowOpen),
		chatWindowTransparencyBindable = ReactModule.createBinding(0),
		arButtonPadding = ReactModule.createBinding(UDim.new(0, 0))
	})
end

local function _(p1) --[[ Line: 92 | Named "wrapWithProviders" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, p1)
end

local Element = ReactModule.createElement(FoundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, (createMessageElement()))
local Element1 = ReactModule.createElement(FoundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, (createMessageElement({ useTranslation = true })))
local Element2 = ReactModule.createElement(FoundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, (createMessageElement({ isUserVerified = true })))
BenchFileFunction(script, function() --[[ Line: 103 ]]
	-- upvalues: BenchmarkFunction (copy), RenderFunction (copy), Element (copy), Element1 (copy), Element2 (copy), MountComponentTimesFunction (copy), ScrollComponentTimesFunction (copy)
	BenchmarkFunction("Render TranslatedTextMessage", function() --[[ Line: 104 ]]
		-- upvalues: RenderFunction (upval), Element (upval)
		RenderFunction(Element):unmount()
	end)
	BenchmarkFunction("Render TranslatedTextMessage with translation", function() --[[ Line: 109 ]]
		-- upvalues: RenderFunction (upval), Element1 (upval)
		RenderFunction(Element1):unmount()
	end)
	BenchmarkFunction("Render TranslatedTextMessage (verified user)", function() --[[ Line: 114 ]]
		-- upvalues: RenderFunction (upval), Element2 (upval)
		RenderFunction(Element2):unmount()
	end)
	MountComponentTimesFunction(Element, "TranslatedTextMessage", 50)
	MountComponentTimesFunction(Element, "TranslatedTextMessage", 100)
	ScrollComponentTimesFunction(Element, "TranslatedTextMessage", 50)
end)