local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local localizationService = require(foundation.Utility.Wrappers).Services.LocalizationService
local constantsModule = require(parent.Constants)
local generatedTranslationsModule = require(foundation.Generated.Translations.GeneratedTranslations)

local function createFoundationLocalizationTable(p1)
	-- upvalues: constantsModule (ref), generatedTranslationsModule (ref)
	local localization_table_name = p1:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME)
	
	if localization_table_name == nil or not localization_table_name:IsA("LocalizationTable") then
		local localizationTable = Instance.new("LocalizationTable")
		localizationTable.Name = constantsModule.LOCALIZATION_TABLE_NAME
		localizationTable.Archivable = false
		localizationTable.SourceLocaleId = "en-us"
		localizationTable:SetEntries(generatedTranslationsModule)
		localizationTable.Parent = p1
		
		return localizationTable
	end
	localization_table_name:SetEntries(generatedTranslationsModule)
	
	return localization_table_name
end

local var1 = createFoundationLocalizationTable(foundation)
local t = {}

local function getTranslatorForLocale(p1)
	-- upvalues: var1 (write), createFoundationLocalizationTable (ref), foundation (ref), t (write), constantsModule (ref)
	if var1 == nil or var1.Parent == nil then
		var1 = createFoundationLocalizationTable(foundation)
		t = {}
	end
	local var2 = t[p1]
	
	if var2 then
		return var2
	end
	local var3 = foundation:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME):GetTranslator(p1)
	t[p1] = var3
	
	return var3
end

local function _()
	-- upvalues: getTranslatorForLocale (ref), localizationService (ref)
	return getTranslatorForLocale(localizationService.RobloxLocaleId)
end

local function formatByKeyWithFallback(p1, p2, p3)
	-- upvalues: getTranslatorForLocale (ref)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref), p1 (ref), p2 (ref)
		return p3:FormatByKey(p1, p2)
	end)
	
	return if ok then status elseif p3.LocaleId == "zh-cjv" then "" else getTranslatorForLocale("en-us"):FormatByKey(p1, p2)
end

return {
	FormatByKey = function(_, p1, p2)
		-- upvalues: formatByKeyWithFallback (ref), getTranslatorForLocale (ref), localizationService (ref)
		return formatByKeyWithFallback(p1, p2, getTranslatorForLocale(localizationService.RobloxLocaleId))
	end,
	FormatByKeyForLocale = function(_, p1, p2, p3)
		-- upvalues: formatByKeyWithFallback (ref), getTranslatorForLocale (ref)
		return formatByKeyWithFallback(p1, p3, getTranslatorForLocale(p2))
	end
}