local Foundation = script:FindFirstAncestor("Foundation")
local WrappersModule = require(Foundation.Utility.Wrappers)
local LocalizationService = WrappersModule.Services.LocalizationService
local GuiService = WrappersModule.Services.GuiService
local ConstantsModule = require(script.Parent.Constants)
local FlagsModule = require(Foundation.Utility.Flags)
local GeneratedTranslationsModule = require(Foundation.Generated.Translations.GeneratedTranslations)
local Foundation1 = if FlagsModule.FoundationTranslatorUseScript then Foundation else GuiService

local function createFoundationLocalizationTable(Parent)
	-- upvalues: ConstantsModule (copy), GeneratedTranslationsModule (copy), FlagsModule (copy)
	local LOCALIZATIONTABLENAME = Parent:FindFirstChild(ConstantsModule.LOCALIZATION_TABLE_NAME)
	
	if LOCALIZATIONTABLENAME == nil or not LOCALIZATIONTABLENAME:IsA("LocalizationTable") then
		local LocalizationTable = Instance.new("LocalizationTable")
		LocalizationTable.Name = ConstantsModule.LOCALIZATION_TABLE_NAME
		LocalizationTable.Archivable = false
		LocalizationTable.SourceLocaleId = "en-us"
		LocalizationTable:SetEntries(GeneratedTranslationsModule)
		LocalizationTable.Parent = Parent
		
		return if FlagsModule.FoundationTranslatorLocalizationRecovery then LocalizationTable else nil
	else
		LOCALIZATIONTABLENAME:SetEntries(GeneratedTranslationsModule)
		
		return if FlagsModule.FoundationTranslatorLocalizationRecovery then LOCALIZATIONTABLENAME else nil
	end
end

local FoundationLocalizationTable = createFoundationLocalizationTable(Foundation1)
local EnUsTranslator = Foundation1:FindFirstChild(ConstantsModule.LOCALIZATION_TABLE_NAME):GetTranslator("en-us")
local Translators = {}

local function getTranslatorForLocale(RobloxLocaleId)
	-- upvalues: FlagsModule (copy), FoundationLocalizationTable (ref), createFoundationLocalizationTable (copy), Foundation1 (copy), Translators (ref), ConstantsModule (copy)
	if FlagsModule.FoundationTranslatorLocalizationRecovery and (FoundationLocalizationTable == nil or FoundationLocalizationTable.Parent == nil) then
		FoundationLocalizationTable = createFoundationLocalizationTable(Foundation1)
		Translators = {}
	end
	local Translator = Translators[RobloxLocaleId]
	
	if Translator then
		return Translator
	else
		local Translator1 = Foundation1:FindFirstChild(ConstantsModule.LOCALIZATION_TABLE_NAME):GetTranslator(RobloxLocaleId)
		Translators[RobloxLocaleId] = Translator1
		
		return Translator1
	end
end

local function _()
	-- upvalues: getTranslatorForLocale (copy), LocalizationService (copy)
	return (getTranslatorForLocale(LocalizationService.RobloxLocaleId))
end

local function formatByKeyWithFallback(Key, p1, Translator)
	-- upvalues: FlagsModule (copy), getTranslatorForLocale (copy), EnUsTranslator (copy)
	local Success, Result = pcall(function()
		-- upvalues: Translator (copy), Key (copy), p1 (copy)
		return Translator:FormatByKey(Key, p1)
	end)
	
	return if Success then Result elseif Translator.LocaleId == "zh-cjv" then "" elseif FlagsModule.FoundationTranslatorLocalizationRecovery then getTranslatorForLocale("en-us"):FormatByKey(Key, p1) else EnUsTranslator:FormatByKey(Key, p1)
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