local Parent = script.Parent.Parent.Parent
local LocalizationService = require(Parent.Utility.Wrappers).Services.LocalizationService
local ConstantsModule = require(script.Parent.Constants)
local GeneratedTranslationsModule = require(Parent.Generated.Translations.GeneratedTranslations)
local Parent1 = require(Parent.Utility.getMainGui)()
require(Parent.Utility.devAssert)(Parent1 ~= nil, "MainGui not found")
local Text = ConstantsModule.LOCALIZATION_TABLE_NAME .. game:GetService("HttpService"):GenerateGUID(false)

local function createFoundationLocalizationTable(Parent)
	-- upvalues: Text (copy), GeneratedTranslationsModule (copy)
	local Text1 = Parent:FindFirstChild(Text)
	
	if Text1 == nil or not Text1:IsA("LocalizationTable") then
		local LocalizationTable = Instance.new("LocalizationTable")
		LocalizationTable.Name = Text
		LocalizationTable.Archivable = false
		LocalizationTable.SourceLocaleId = "en-us"
		LocalizationTable:SetEntries(GeneratedTranslationsModule)
		LocalizationTable.Parent = Parent
		
		return LocalizationTable
	else
		Text1:SetEntries(GeneratedTranslationsModule)
		
		return Text1
	end
end

local FoundationLocalizationTable = createFoundationLocalizationTable(Parent1)
local Translators = {}

local function getTranslatorForLocale(RobloxLocaleId)
	-- upvalues: FoundationLocalizationTable (ref), createFoundationLocalizationTable (copy), Parent1 (copy), Translators (ref), Text (copy)
	if FoundationLocalizationTable == nil or FoundationLocalizationTable.Parent == nil then
		FoundationLocalizationTable = createFoundationLocalizationTable(Parent1)
		Translators = {}
	end
	local Translator = Translators[RobloxLocaleId]
	
	if Translator then
		return Translator
	else
		local Translator1 = Parent1:FindFirstChild(Text):GetTranslator(RobloxLocaleId)
		Translators[RobloxLocaleId] = Translator1
		
		return Translator1
	end
end

local function _()
	-- upvalues: getTranslatorForLocale (copy), LocalizationService (copy)
	return (getTranslatorForLocale(LocalizationService.RobloxLocaleId))
end

local function formatByKeyWithFallback(Key, p1, Translator)
	-- upvalues: getTranslatorForLocale (copy)
	local Success, Result = pcall(function()
		-- upvalues: Translator (copy), Key (copy), p1 (copy)
		return Translator:FormatByKey(Key, p1)
	end)
	
	return if Success then Result elseif Translator.LocaleId == "zh-cjv" then "" else getTranslatorForLocale("en-us"):FormatByKey(Key, p1)
end

return {
	FormatByKey = function(_, Key, p1)
		-- upvalues: formatByKeyWithFallback (copy), getTranslatorForLocale (copy), LocalizationService (copy)
		return formatByKeyWithFallback(Key, p1, (getTranslatorForLocale(LocalizationService.RobloxLocaleId)))
	end,
	FormatByKeyForLocale = function(_, p1, p2, p3)
		-- upvalues: formatByKeyWithFallback (copy), getTranslatorForLocale (copy)
		return formatByKeyWithFallback(p1, p3, (getTranslatorForLocale(p2)))
	end
}