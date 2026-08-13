local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local localizationService = require(foundation.Utility.Wrappers).Services.LocalizationService
local constantsModule = require(parent.Constants)
local generatedTranslationsModule = require(foundation.Generated.Translations.GeneratedTranslations)

local function createFoundationLocalizationTable(p0) --[[ line: 11 ]]
	-- upvalues: constantsModule (ref), generatedTranslationsModule (ref)
	local localization_table_name = p0:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME)
	
	if localization_table_name == nil or not localization_table_name:IsA("LocalizationTable") then
		local localizationTable = Instance.new("LocalizationTable")
		localizationTable.Name = constantsModule.LOCALIZATION_TABLE_NAME
		localizationTable.Archivable = false
		localizationTable.SourceLocaleId = "en-us"
		localizationTable:SetEntries(generatedTranslationsModule)
		localizationTable.Parent = p0
		
		return localizationTable
	end
	localization_table_name:SetEntries(generatedTranslationsModule)
	
	return localization_table_name
end

local var4 = createFoundationLocalizationTable(foundation)
local t = {}

local function getTranslatorForLocale(p1) --[[ line: 32 ]]
	-- upvalues: var4 (write), createFoundationLocalizationTable (ref), foundation (ref), t (write), constantsModule (ref)
	if var4 == nil or var4.Parent == nil then
		var4 = createFoundationLocalizationTable(foundation)
		t = {}
	end
	local var10 = t[p1]
	
	if var10 then
		return var10
	end
	local var11 = foundation:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME):GetTranslator(p1)
	t[p1] = var11
	
	return var11
end

local function _() --[[ line: 51 | named "getTranslator" ]]
	-- upvalues: getTranslatorForLocale (ref), localizationService (ref)
	return getTranslatorForLocale(localizationService.RobloxLocaleId)
end

local function formatByKeyWithFallback(p2, p3, p4) --[[ line: 55 ]]
	-- upvalues: getTranslatorForLocale (ref)
	local ok, status = pcall(function() --[[ line: 56 ]]
		-- upvalues: p4 (ref), p2 (ref), p3 (ref)
		return p4:FormatByKey(p2, p3)
	end)
	
	return if ok then status elseif p4.LocaleId == "zh-cjv" then "" else getTranslatorForLocale("en-us"):FormatByKey(p2, p3)
end

return {
	FormatByKey = function(_, p5, p6) --[[ line: 71 ]]
		-- upvalues: formatByKeyWithFallback (ref), getTranslatorForLocale (ref), localizationService (ref)
		return formatByKeyWithFallback(p5, p6, getTranslatorForLocale(localizationService.RobloxLocaleId))
	end,
	FormatByKeyForLocale = function(_, p7, p8, p9) --[[ line: 75 ]]
		-- upvalues: formatByKeyWithFallback (ref), getTranslatorForLocale (ref)
		return formatByKeyWithFallback(p7, p9, getTranslatorForLocale(p8))
	end
}