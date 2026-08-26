local localizationService = game:GetService("LocalizationService")
local guiService = game:GetService("GuiService")
local parent = script.Parent
local constantsModule = require(parent.Constants)
local generatedTranslationsModule = require(parent.GeneratedTranslations)

local function _(p1)
	-- upvalues: guiService (ref), constantsModule (ref), generatedTranslationsModule (ref)
	if guiService:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME) then
		return
	end
	local localizationTable = Instance.new("LocalizationTable")
	localizationTable.Name = constantsModule.LOCALIZATION_TABLE_NAME
	localizationTable.Archivable = false
	localizationTable.SourceLocaleId = "en-us"
	localizationTable:SetEntries(generatedTranslationsModule)
	localizationTable.Parent = p1
end

if not guiService:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME) then
	local localizationTable = Instance.new("LocalizationTable")
	localizationTable.Name = constantsModule.LOCALIZATION_TABLE_NAME
	localizationTable.Archivable = false
	localizationTable.SourceLocaleId = "en-us"
	localizationTable:SetEntries(generatedTranslationsModule)
	localizationTable.Parent = guiService
end
local var1 = guiService.UIBloxLocalization:GetTranslator("en-us")
local t = {}

local _ = function(p1)
	-- upvalues: t (ref), guiService (ref)
	local var2 = t[p1]
	
	if var2 then
		return var2
	end
	local var3 = guiService.UIBloxLocalization:GetTranslator(p1)
	t[p1] = var3
	
	return var3
end

local _ = function()
	-- upvalues: localizationService (ref), t (ref), guiService (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var2 = t[robloxLocaleId]
	
	if var2 then
		return var2
	end
	local var3 = guiService.UIBloxLocalization:GetTranslator(robloxLocaleId)
	t[robloxLocaleId] = var3
	
	return var3
end

local function formatByKeyWithFallback(p1, p2, p3)
	-- upvalues: var1 (ref)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref), p1 (ref), p2 (ref)
		return p3:FormatByKey(p1, p2)
	end)
	
	return if ok then status elseif p3.LocaleId == "zh-cjv" then "" else var1:FormatByKey(p1, p2)
end

return {
	FormatByKey = function(_, p1, p2)
		-- upvalues: formatByKeyWithFallback (ref), localizationService (ref), t (ref), guiService (ref)
		local var2
		local robloxLocaleId = localizationService.RobloxLocaleId
		local var3 = t[robloxLocaleId]
		
		if var3 then
			var2 = var3
		else
			var3 = guiService.UIBloxLocalization:GetTranslator(robloxLocaleId)
			t[robloxLocaleId] = var3
			var2 = var3
		end
		return formatByKeyWithFallback(p1, p2, var2)
	end,
	FormatByKeyForLocale = function(_, p1, p2, p3)
		-- upvalues: formatByKeyWithFallback (ref), t (ref), guiService (ref)
		local var2
		local var3 = t[p2]
		
		if var3 then
			var2 = var3
		else
			var3 = guiService.UIBloxLocalization:GetTranslator(p2)
			t[p2] = var3
			var2 = var3
		end
		return formatByKeyWithFallback(p1, p3, var2)
	end
}