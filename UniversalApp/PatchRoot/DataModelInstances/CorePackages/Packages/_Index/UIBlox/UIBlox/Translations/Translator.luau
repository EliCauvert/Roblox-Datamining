local localizationService = game:GetService("LocalizationService")
local guiService = game:GetService("GuiService")
local parent = script.Parent
local constantsModule = require(parent.Constants)
local generatedTranslationsModule = require(parent.GeneratedTranslations)

local function _(p0)
	-- upvalues: guiService (ref), constantsModule (ref), generatedTranslationsModule (ref)
	if guiService:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME) then
		return
	end
	local localizationTable = Instance.new("LocalizationTable")
	localizationTable.Name = constantsModule.LOCALIZATION_TABLE_NAME
	localizationTable.Archivable = false
	localizationTable.SourceLocaleId = "en-us"
	localizationTable:SetEntries(generatedTranslationsModule)
	localizationTable.Parent = p0
end

if not guiService:FindFirstChild(constantsModule.LOCALIZATION_TABLE_NAME) then
	local localizationTable = Instance.new("LocalizationTable")
	localizationTable.Name = constantsModule.LOCALIZATION_TABLE_NAME
	localizationTable.Archivable = false
	localizationTable.SourceLocaleId = "en-us"
	localizationTable:SetEntries(generatedTranslationsModule)
	localizationTable.Parent = guiService
end
local var5 = guiService.UIBloxLocalization:GetTranslator("en-us")
local t = {}

local _ = function(p1)
	-- upvalues: t (ref), guiService (ref)
	local var9 = t[p1]
	
	if var9 then
		return var9
	end
	local var10 = guiService.UIBloxLocalization:GetTranslator(p1)
	t[p1] = var10
	
	return var10
end

local _ = function()
	-- upvalues: localizationService (ref), t (ref), guiService (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var11 = t[robloxLocaleId]
	
	if var11 then
		return var11
	end
	local var12 = guiService.UIBloxLocalization:GetTranslator(robloxLocaleId)
	t[robloxLocaleId] = var12
	
	return var12
end

local function formatByKeyWithFallback(p2, p3, p4)
	-- upvalues: var5 (ref)
	local ok, status = pcall(function()
		-- upvalues: p4 (ref), p2 (ref), p3 (ref)
		return p4:FormatByKey(p2, p3)
	end)
	
	return if ok then status elseif p4.LocaleId == "zh-cjv" then "" else var5:FormatByKey(p2, p3)
end

return {
	FormatByKey = function(_, p5, p6)
		-- upvalues: formatByKeyWithFallback (ref), localizationService (ref), t (ref), guiService (ref)
		local var14
		local robloxLocaleId = localizationService.RobloxLocaleId
		local var13 = t[robloxLocaleId]
		
		if var13 then
			var14 = var13
		else
			var13 = guiService.UIBloxLocalization:GetTranslator(robloxLocaleId)
			t[robloxLocaleId] = var13
			var14 = var13
		end
		return formatByKeyWithFallback(p5, p6, var14)
	end,
	FormatByKeyForLocale = function(_, p7, p8, p9)
		-- upvalues: formatByKeyWithFallback (ref), t (ref), guiService (ref)
		local var16
		local var15 = t[p8]
		
		if var15 then
			var16 = var15
		else
			var15 = guiService.UIBloxLocalization:GetTranslator(p8)
			t[p8] = var15
			var16 = var15
		end
		return formatByKeyWithFallback(p7, p9, var16)
	end
}