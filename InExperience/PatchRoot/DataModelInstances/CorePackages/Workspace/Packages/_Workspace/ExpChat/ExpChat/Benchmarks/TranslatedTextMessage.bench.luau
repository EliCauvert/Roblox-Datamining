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

local function createMessageElement(p0) --[[ line: 34 ]]
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
	
	if p0 then
		for i, v in p0 do
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
	local var15 = getMessageSettingsModule(t_2.current, t)
	
	return reactModule.createElement(translatedTextMessageV2Module, {
		chatWindowSettings = t,
		textTransparency = reactModule.createBinding(0),
		onTextMessageLabelButtonActivated = function() --[[ line: 71 ]] end,
		isSpatialUIEnabled = t_1.isSpatialUIEnabled,
		originalBodyText = reactModule.createBinding(getMessageTextModule(t_2.current.useTranslation, var15.translation, var15.text)),
		originalPrefixText = reactModule.createBinding(var15.prefixText or ""),
		shouldShowTranslationToggle = reactModule.createBinding(false),
		bodyTextProperties = reactModule.createBinding(var15.bodyTextProperties),
		prefixTextProperties = reactModule.createBinding(var15.prefixTextProperties),
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

local function _(p1) --[[ line: 92 | named "wrapWithProviders" ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, p1)
end

local var10 = reactModule.createElement(foundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, createMessageElement())
local var11 = reactModule.createElement(foundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, createMessageElement({ useTranslation = true }))
local var12 = reactModule.createElement(foundationModule.FoundationProvider, { device = "Desktop", colorMode = "Dark" }, createMessageElement({ isUserVerified = true }))
benchFile(script, function() --[[ line: 103 ]]
	-- upvalues: benchmark (ref), render (ref), var10 (ref), var11 (ref), var12 (ref), mountComponentTimes (ref), scrollComponentTimes (ref)
	benchmark("Render TranslatedTextMessage", function() --[[ line: 104 ]]
		-- upvalues: render (copy), var10 (copy)
		render(var10):unmount()
	end)
	benchmark("Render TranslatedTextMessage with translation", function() --[[ line: 109 ]]
		-- upvalues: render (copy), var11 (copy)
		render(var11):unmount()
	end)
	benchmark("Render TranslatedTextMessage (verified user)", function() --[[ line: 114 ]]
		-- upvalues: render (copy), var12 (copy)
		render(var12):unmount()
	end)
	mountComponentTimes(var10, "TranslatedTextMessage", 50)
	mountComponentTimes(var10, "TranslatedTextMessage", 100)
	scrollComponentTimes(var10, "TranslatedTextMessage", 50)
end)