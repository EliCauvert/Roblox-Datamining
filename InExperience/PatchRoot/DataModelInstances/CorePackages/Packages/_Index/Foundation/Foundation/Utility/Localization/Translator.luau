local var1
local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local parent_1 = script.Parent.Parent.Parent
local flagsModule = require(parent_1.Utility.Flags)
local localizationService = require(parent_1.Utility.Wrappers).Services.LocalizationService
local constantsModule = require(parent.Constants)
local generatedTranslationsModule = require(parent_1.Generated.Translations.GeneratedTranslations)
local devAssertModule = require(parent_1.Utility.devAssert)
local getMainGuiModule = require(parent_1.Utility.getMainGui)
local _ = nil

if flagsModule.FoundationDontParentToFoundationModule then
	local var2 = getMainGuiModule()
	devAssertModule(var2 ~= nil, "MainGui not found")
	var1 = var2
else
	var1 = foundation
end
local text = constantsModule.LOCALIZATION_TABLE_NAME .. game:GetService("HttpService"):GenerateGUID(false)

local function createFoundationLocalizationTable(p1)
	-- upvalues: flagsModule (ref), text (ref), generatedTranslationsModule (ref), constantsModule (ref)
	if flagsModule.FoundationDontParentToFoundationModule then
		local var3 = p1:FindFirstChild(text)
		
		if var3 == nil or not var3:IsA("LocalizationTable") then
			local localizationTable = Instance.new("LocalizationTable")
			localizationTable.Name = if flagsModule.FoundationDontParentToFoundationModule then text else constantsModule.LOCALIZATION_TABLE_NAME
			localizationTable.Archivable = false
			localizationTable.SourceLocaleId = "en-us"
			localizationTable:SetEntries(generatedTranslationsModule)
			localizationTable.Parent = p1
			
			return localizationTable
		else
			var3:SetEntries(generatedTranslationsModule)
			
			return var3
		end
	else
		local localization_table_name = p1:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME)
		
		if localization_table_name == nil or not localization_table_name:IsA("LocalizationTable") then
		else
			localization_table_name:SetEntries(generatedTranslationsModule)
			
			return localization_table_name
		end
	end
end

local var3 = createFoundationLocalizationTable(var1)
local t = {}

local function getTranslatorForLocale(p1)
	-- upvalues: var3 (write), createFoundationLocalizationTable (ref), var1 (write), t (write), flagsModule (ref), text (ref), constantsModule (ref)
	if var3 == nil or var3.Parent == nil then
		var3 = createFoundationLocalizationTable(var1)
		t = {}
	end
	local var4 = t[p1]
	
	if var4 then
		return var4
	end
	local var5 = if flagsModule.FoundationDontParentToFoundationModule then var1:FindFirstChild(text):GetTranslator(p1) else var1:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME):GetTranslator(p1)
	t[p1] = var5
	
	return var5
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