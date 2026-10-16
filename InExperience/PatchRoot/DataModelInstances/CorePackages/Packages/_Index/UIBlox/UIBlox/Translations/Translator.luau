local LocalizationService = game:GetService("LocalizationService")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent
local ConstantsModule = require(Parent.Constants)
local GeneratedTranslationsModule = require(Parent.GeneratedTranslations)

local function _(Parent) --[[ Line: 9 | Named "createUIBloxLocalizationTable" ]]
	-- upvalues: GuiService (copy), ConstantsModule (copy), GeneratedTranslationsModule (copy)
	if not GuiService:FindFirstChild(ConstantsModule.LOCALIZATION_TABLE_NAME) then
		local LocalizationTable = Instance.new("LocalizationTable")
		LocalizationTable.Name = ConstantsModule.LOCALIZATION_TABLE_NAME
		LocalizationTable.Archivable = false
		LocalizationTable.SourceLocaleId = "en-us"
		LocalizationTable:SetEntries(GeneratedTranslationsModule)
		LocalizationTable.Parent = Parent
		
		return
	end
end

if not GuiService:FindFirstChild(ConstantsModule.LOCALIZATION_TABLE_NAME) then
	local LocalizationTable = Instance.new("LocalizationTable")
	LocalizationTable.Name = ConstantsModule.LOCALIZATION_TABLE_NAME
	LocalizationTable.Archivable = false
	LocalizationTable.SourceLocaleId = "en-us"
	LocalizationTable:SetEntries(GeneratedTranslationsModule)
	LocalizationTable.Parent = GuiService
end
local EnUsTranslator = GuiService.UIBloxLocalization:GetTranslator("en-us")
local Translators = {}

local _ = function(Key) --[[ Line: 28 | Named "getTranslatorForLocale" ]]
	-- upvalues: Translators (copy), GuiService (copy)
	local Translator = Translators[Key]
	
	if Translator then
		return Translator
	else
		local Translator1 = GuiService.UIBloxLocalization:GetTranslator(Key)
		Translators[Key] = Translator1
		
		return Translator1
	end
end

local _ = function() --[[ Line: 40 | Named "getTranslator" ]]
	-- upvalues: LocalizationService (copy), Translators (copy), GuiService (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local Translator = Translators[RobloxLocaleId]
	
	if Translator then
		return Translator
	else
		local Translator1 = GuiService.UIBloxLocalization:GetTranslator(RobloxLocaleId)
		Translators[RobloxLocaleId] = Translator1
		
		return Translator1
	end
end

local function formatByKeyWithFallback(p1, p2, Translator) --[[ Line: 44 ]]
	-- upvalues: EnUsTranslator (copy)
	local Success, Result = pcall(function() --[[ Line: 45 ]]
		-- upvalues: Translator (copy), p1 (copy), p2 (copy)
		return Translator:FormatByKey(p1, p2)
	end)
	
	return if Success then Result elseif Translator.LocaleId == "zh-cjv" then "" else EnUsTranslator:FormatByKey(p1, p2)
end

return {
	FormatByKey = function(_, p1, p2) --[[ Line: 60 ]]
		-- upvalues: formatByKeyWithFallback (copy), LocalizationService (copy), Translators (copy), GuiService (copy)
		local RobloxLocaleId = LocalizationService.RobloxLocaleId
		local Translator = Translators[RobloxLocaleId]
		local Translator1 = nil
		
		if Translator then
			Translator1 = Translator
		else
			local Translator2 = GuiService.UIBloxLocalization:GetTranslator(RobloxLocaleId)
			Translators[RobloxLocaleId] = Translator2
			Translator1 = Translator2
		end
		return formatByKeyWithFallback(p1, p2, Translator1)
	end,
	FormatByKeyForLocale = function(_, p1, Key, p2) --[[ Line: 64 ]]
		-- upvalues: formatByKeyWithFallback (copy), Translators (copy), GuiService (copy)
		local Translator = Translators[Key]
		local Translator1 = nil
		
		if Translator then
			Translator1 = Translator
		else
			local Translator2 = GuiService.UIBloxLocalization:GetTranslator(Key)
			Translators[Key] = Translator2
			Translator1 = Translator2
		end
		return formatByKeyWithFallback(p1, p2, Translator1)
	end
}