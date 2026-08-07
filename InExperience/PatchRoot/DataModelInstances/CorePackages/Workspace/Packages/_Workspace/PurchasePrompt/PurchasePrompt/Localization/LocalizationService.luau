local parent = script.Parent.Parent
local itemTypeModule = require(parent.Enums.ItemType)
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local symbolModule = require(parent.Symbols.Symbol)
local keyMappingsModule = require(script.Parent.KeyMappings)
local _ = {
	["en-us"] = ",",
	["en-gb"] = ",",
	["es-mx"] = ",",
	["es-es"] = ".",
	["fr-fr"] = " ",
	["de-de"] = " ",
	["pt-br"] = ".",
	["zh-cn"] = ",",
	["zh-cjv"] = ",",
	["zh-tw"] = ",",
	["ko-kr"] = ",",
	["ja-jp"] = ",",
	["it-it"] = " ",
	["ru-ru"] = ".",
	["id-id"] = ".",
	["vi-vn"] = ".",
	["th-th"] = ",",
	["tr-tr"] = "."
}
local formattedParam = symbolModule.named("FormattedParam")

local function _(p0) --[[ line: 44 | named "isFormattedParam" ]]
	-- upvalues: formattedParam (ref)
	return typeof(p0) == "table" and p0[formattedParam] == true
end

local _ = function(p1) --[[ line: 48 | named "createFormattedParam" ]]
	-- upvalues: formattedParam (ref)
	return { [formattedParam] = true, format = p1 }
end

local _ = function(p2, p3) --[[ line: 58 | named "getLocalizedString" ]]
	local translations = p2.translations
	local fallbackTranslations = p2.fallbackTranslations
	
	return if fallbackTranslations == nil or translations[p3] ~= nil then translations[p3] else fallbackTranslations[p3]
end

local _ = function(p4, p5) --[[ line: 81 | named "addGroupDelimiters" ]]
	local formattedText = string.format("%%1%s%%2", p5)
	local _ = nil
	repeat
		local replaced, replaced_1 = string.gsub(p4, "^(-?%d+)(%d%d%d)", formattedText)
		p4 = replaced
	until replaced_1 == 0
	return p4
end

return {
	getKeyFromItemType = function(p6) --[[ line: 98 ]]
		-- upvalues: itemTypeModule (ref), keyMappingsModule (ref)
		assert(itemTypeModule.isMember(p6) or (if typeof(p6) ~= "number" then typeof(p6) == "string" else true), "provided item type " .. tostring(p6) .. " must be a number, string, or ItemType enum")
		local _ = nil
		
		return if p6 == itemTypeModule.Bundle then "CoreScripts.PurchasePrompt.ItemType.Bundle" else keyMappingsModule.AssetTypeById[tostring(p6)]
	end,
	getErrorKey = function(p7) --[[ line: 122 ]]
		-- upvalues: purchaseErrorModule (ref), keyMappingsModule (ref)
		assert(purchaseErrorModule.isMember(p7), "provided value " .. tostring(p7) .. " is not a member of PurchaseError enum")
		
		return keyMappingsModule.PurchaseErrorKey[p7]
	end
}