-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local wrappersModule = require(foundation.Utility.Wrappers)
local localizationService = wrappersModule.Services.LocalizationService
local guiService = wrappersModule.Services.GuiService
local constantsModule = require(parent.Constants)
local flagsModule = require(foundation.Utility.Flags)
local generatedTranslationsModule = require(foundation.Generated.Translations.GeneratedTranslations)
local var5 = if flagsModule.FoundationTranslatorUseScript then foundation else guiService

local function createFoundationLocalizationTable(p0) --[[ line: 14 ]]
	-- upvalues: constantsModule (ref), generatedTranslationsModule (ref), flagsModule (ref)
	local localization_table_name = p0:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME)
	
	if localization_table_name == nil or not localization_table_name:IsA("LocalizationTable") then
		local localizationTable = Instance.new("LocalizationTable")
		localizationTable.Name = constantsModule.LOCALIZATION_TABLE_NAME
		localizationTable.Archivable = false
		localizationTable.SourceLocaleId = "en-us"
		localizationTable:SetEntries(generatedTranslationsModule)
		localizationTable.Parent = p0
		
		return if flagsModule.FoundationTranslatorLocalizationRecovery then localizationTable else nil
	end
	localization_table_name:SetEntries(generatedTranslationsModule)
	
	return if flagsModule.FoundationTranslatorLocalizationRecovery then localization_table_name else nil
end

local var7 = createFoundationLocalizationTable(var5)
local var8 = var5:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME):GetTranslator("en-us")
local t = {}

local function getTranslatorForLocale(p1) --[[ line: 49 ]]
	-- upvalues: flagsModule (ref), var7 (write), createFoundationLocalizationTable (ref), var5 (ref), t (write), constantsModule (ref)
	if flagsModule.FoundationTranslatorLocalizationRecovery and (var7 == nil or var7.Parent == nil) then
		var7 = createFoundationLocalizationTable(var5)
		t = {}
	end
	local var14 = t[p1]
	
	if var14 then
		return var14
	end
	local var15 = var5:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME):GetTranslator(p1)
	t[p1] = var15
	
	return var15
end

local function _() --[[ line: 70 | named "getTranslator" ]]
	-- upvalues: getTranslatorForLocale (ref), localizationService (ref)
	return getTranslatorForLocale(localizationService.RobloxLocaleId)
end

local function formatByKeyWithFallback(p2, p3, p4) --[[ line: 74 ]]
	-- upvalues: flagsModule (ref), getTranslatorForLocale (ref), var8 (ref)
	local ok, status = pcall(function() --[[ line: 75 ]]
		-- upvalues: p4 (ref), p2 (ref), p3 (ref)
		return p4:FormatByKey(p2, p3)
	end)
	
	return if ok then status elseif p4.LocaleId == "zh-cjv" then "" elseif flagsModule.FoundationTranslatorLocalizationRecovery then getTranslatorForLocale("en-us"):FormatByKey(p2, p3) else var8:FormatByKey(p2, p3)
end

return {
	FormatByKey = function(_, p5, p6) --[[ line: 94 ]]
		-- upvalues: formatByKeyWithFallback (ref), getTranslatorForLocale (ref), localizationService (ref)
		return formatByKeyWithFallback(p5, p6, getTranslatorForLocale(localizationService.RobloxLocaleId))
	end,
	FormatByKeyForLocale = function(_, p7, p8, p9) --[[ line: 98 ]]
		-- upvalues: formatByKeyWithFallback (ref), getTranslatorForLocale (ref)
		return formatByKeyWithFallback(p7, p9, getTranslatorForLocale(p8))
	end
}