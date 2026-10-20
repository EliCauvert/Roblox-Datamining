local Foundation = script:FindFirstAncestor("Foundation")
local Parent = script.Parent.Parent.Parent
local FlagsModule = require(Parent.Utility.Flags)
local LocalizationService = require(Parent.Utility.Wrappers).Services.LocalizationService
local ConstantsModule = require(script.Parent.Constants)
local GeneratedTranslationsModule = require(Parent.Generated.Translations.GeneratedTranslations)
local DevAssertModule: (any, any) -> () = require(Parent.Utility.devAssert)
local GetMainGuiModule = require(Parent.Utility.getMainGui)
local Object = nil

if FlagsModule.FoundationDontParentToFoundationModule then
	local MainGuiModule = GetMainGuiModule()
	DevAssertModule(MainGuiModule ~= nil, "MainGui not found")
	Object = MainGuiModule
else
	Object = Foundation
end
local Text = ConstantsModule.LOCALIZATION_TABLE_NAME .. game:GetService("HttpService"):GenerateGUID(false)

local function createFoundationLocalizationTable(Object)
	-- upvalues: FlagsModule (copy), Text (copy), GeneratedTranslationsModule (copy), ConstantsModule (copy)
	if FlagsModule.FoundationDontParentToFoundationModule then
		local Text1 = Object:FindFirstChild(Text)
		
		if Text1 ~= nil and Text1:IsA("LocalizationTable") then
			Text1:SetEntries(GeneratedTranslationsModule)
			
			return Text1
		end
	else
		local LOCALIZATIONTABLENAME = Object:FindFirstChild(ConstantsModule.LOCALIZATION_TABLE_NAME)
		
		if LOCALIZATIONTABLENAME ~= nil and LOCALIZATIONTABLENAME:IsA("LocalizationTable") then
			LOCALIZATIONTABLENAME:SetEntries(GeneratedTranslationsModule)
			
			return LOCALIZATIONTABLENAME
		end
	end
	local LocalizationTable = Instance.new("LocalizationTable")
	LocalizationTable.Name = if FlagsModule.FoundationDontParentToFoundationModule then Text else ConstantsModule.LOCALIZATION_TABLE_NAME
	LocalizationTable.Archivable = false
	LocalizationTable.SourceLocaleId = "en-us"
	LocalizationTable:SetEntries(GeneratedTranslationsModule)
	LocalizationTable.Parent = Object
	
	return LocalizationTable
end

local FoundationLocalizationTable = createFoundationLocalizationTable(Object)
local Translators = {}

local function getTranslatorForLocale(RobloxLocaleId)
	-- upvalues: FoundationLocalizationTable (ref), createFoundationLocalizationTable (copy), Object (ref), Translators (ref), FlagsModule (copy), Text (copy), ConstantsModule (copy)
	if FoundationLocalizationTable == nil or FoundationLocalizationTable.Parent == nil then
		FoundationLocalizationTable = createFoundationLocalizationTable(Object)
		Translators = {}
	end
	local Translator = Translators[RobloxLocaleId]
	
	if Translator then
		return Translator
	else
		local Translator1 = if FlagsModule.FoundationDontParentToFoundationModule then Object:FindFirstChild(Text):GetTranslator(RobloxLocaleId) else Object:FindFirstChild(ConstantsModule.LOCALIZATION_TABLE_NAME):GetTranslator(RobloxLocaleId)
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