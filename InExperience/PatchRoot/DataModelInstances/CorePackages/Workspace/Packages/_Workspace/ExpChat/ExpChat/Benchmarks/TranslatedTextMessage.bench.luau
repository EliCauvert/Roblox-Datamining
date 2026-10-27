local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local RenderFunction = require(Parent.Dev.ReactTestingLibrary).render
local BenchmarkUtilsModule = require(Parent.Dev.BenchmarkUtils)
local BenchFileFunction: (any, any) -> () = BenchmarkUtilsModule.benchFile
local BenchmarkWarmFunction = BenchmarkUtilsModule.benchmarkWarm
local BenchmarkInstanceCountFunction = BenchmarkUtilsModule.benchmarkInstanceCount
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

local function createMessageElement(List)
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
		onTextMessageLabelButtonActivated = function() end,
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

local function messageList(p1)
	-- upvalues: createMessageElement (copy), ReactModule (copy), FoundationModule (copy)
	local t = {}
	
	for i = 1, 50 do
		t[i] = createMessageElement(p1)
	end
	return ReactModule.createElement(FoundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, {
		List = ReactModule.createElement("Frame", { Size = UDim2.fromScale(1, 1) }, t)
	})
end

local MessageListResult = messageList()
local MessageListResult1 = messageList({ useTranslation = true })
local MessageListResult2 = messageList({ isUserVerified = true })
BenchFileFunction(script, function()
	-- upvalues: BenchmarkWarmFunction (copy), RenderFunction (copy), MessageListResult (copy), MessageListResult1 (copy), MessageListResult2 (copy), BenchmarkInstanceCountFunction (copy)
	BenchmarkWarmFunction(`Render {50} TranslatedTextMessages`, function()
		-- upvalues: RenderFunction (upval), MessageListResult (upval)
		RenderFunction(MessageListResult):unmount()
	end)
	BenchmarkWarmFunction(`Render {50} TranslatedTextMessages with translation`, function()
		-- upvalues: RenderFunction (upval), MessageListResult1 (upval)
		RenderFunction(MessageListResult1):unmount()
	end)
	BenchmarkWarmFunction(`Render {50} TranslatedTextMessages (verified user)`, function()
		-- upvalues: RenderFunction (upval), MessageListResult2 (upval)
		RenderFunction(MessageListResult2):unmount()
	end)
	BenchmarkInstanceCountFunction(`Mount {50} TranslatedTextMessages`, MessageListResult)
end)