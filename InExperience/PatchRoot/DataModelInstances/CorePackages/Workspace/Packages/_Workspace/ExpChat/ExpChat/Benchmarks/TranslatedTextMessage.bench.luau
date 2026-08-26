local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local render = require(parent.Dev.ReactTestingLibrary).render
local benchmark = require(parent.Dev.JestBenchmark).benchmark
local benchmarkUtilsModule = require(parent.Dev.BenchmarkUtils)
local benchFile = benchmarkUtilsModule.benchFile
local mountComponentTimes = benchmarkUtilsModule.mountComponentTimes
local scrollComponentTimes = benchmarkUtilsModule.scrollComponentTimes
local configModule = require(expChat.Config)
local helpers = expChat.ChatWindow.Helpers
local getMessageSettingsModule = require(helpers.getMessageSettings)
local getMessageTextModule = require(helpers.getMessageText)
local translatedTextMessageV2Module = require(expChat.ChatWindow.UI.TranslatedTextMessageV2)
local t = {
	FontFace = configModule.ChatWindowFont,
	TextColor3 = configModule.ChatWindowTextColor3,
	TextSize = configModule.ChatWindowTextSize,
	TextStrokeColor3 = configModule.ChatWindowTextStrokeColor,
	TextStrokeTransparency = configModule.ChatWindowTextStrokeTransparency,
	BackgroundColor3 = configModule.ChatWindowBackgroundColor3,
	BackgroundTransparency = configModule.ChatWindowBackgroundTransparency
}

local function createMessageElement(p1)
	-- upvalues: getMessageSettingsModule (ref), t (ref), reactModule (ref), translatedTextMessageV2Module (ref), getMessageTextModule (ref)
	local t_1 = {
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
	
	if p1 then
		for i, v in p1 do
			t_1[i] = v
		end
	end
	local t_2 = {
		current = {
			userId = 0,
			messageId = "0",
			text = t_1.text,
			translation = t_1.translation,
			useTranslation = t_1.useTranslation,
			prefixText = t_1.prefixText,
			chatWindowMessageProperties = t_1.chatWindowMessageProperties
		}
	}
	local var1 = getMessageSettingsModule(t_2.current, t)
	
	return reactModule.createElement(translatedTextMessageV2Module, {
		chatWindowSettings = t,
		textTransparency = reactModule.createBinding(0),
		onTextMessageLabelButtonActivated = function() end,
		isSpatialUIEnabled = t_1.isSpatialUIEnabled,
		originalBodyText = reactModule.createBinding(getMessageTextModule(t_2.current.useTranslation, var1.translation, var1.text)),
		originalPrefixText = reactModule.createBinding(var1.prefixText or ""),
		shouldShowTranslationToggle = reactModule.createBinding(false),
		bodyTextProperties = reactModule.createBinding(var1.bodyTextProperties),
		prefixTextProperties = reactModule.createBinding(var1.prefixTextProperties),
		layoutOrder = reactModule.createBinding(0),
		visible = reactModule.createBinding(true),
		isUserVerified = reactModule.createBinding(t_1.isUserVerified),
		message = t_2,
		isTrustedConnection = reactModule.createBinding(t_1.isTrustedConnection),
		wasRewritten = reactModule.createBinding(t_1.wasRewritten),
		isRewriteWindowOpen = reactModule.createBinding(t_1.isRewriteWindowOpen),
		chatWindowTransparencyBindable = reactModule.createBinding(0),
		arButtonPadding = reactModule.createBinding(UDim.new(0, 0))
	})
end

local function _(p2)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, p2)
end

local var2 = reactModule.createElement(foundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, createMessageElement())
local var3 = reactModule.createElement(foundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, createMessageElement({ useTranslation = true }))
local var4 = reactModule.createElement(foundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, createMessageElement({ isUserVerified = true }))
benchFile(script, function()
	-- upvalues: benchmark (ref), render (ref), var2 (ref), var3 (ref), var4 (ref), mountComponentTimes (ref), scrollComponentTimes (ref)
	benchmark("Render TranslatedTextMessage", function()
		-- upvalues: render (copy), var2 (copy)
		render(var2):unmount()
	end)
	benchmark("Render TranslatedTextMessage with translation", function()
		-- upvalues: render (copy), var3 (copy)
		render(var3):unmount()
	end)
	benchmark("Render TranslatedTextMessage (verified user)", function()
		-- upvalues: render (copy), var4 (copy)
		render(var4):unmount()
	end)
	mountComponentTimes(var2, "TranslatedTextMessage", 50)
	mountComponentTimes(var2, "TranslatedTextMessage", 100)
	scrollComponentTimes(var2, "TranslatedTextMessage", 50)
end)