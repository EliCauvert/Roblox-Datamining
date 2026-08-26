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

local function _(p1)
	-- upvalues: formattedParam (ref)
	return typeof(p1) == "table" and p1[formattedParam] == true
end

local _ = function(p1)
	-- upvalues: formattedParam (ref)
	return { [formattedParam] = true, format = p1 }
end

local _ = function(p1, p2)
	local translations = p1.translations
	local fallbackTranslations = p1.fallbackTranslations
	
	return if fallbackTranslations == nil or translations[p2] ~= nil then translations[p2] else fallbackTranslations[p2]
end

local _ = function(p1, p2)
	local formattedText = string.format("%%1%s%%2", p2)
	local _ = nil
	repeat
		local replaced, replaced_1 = string.gsub(p1, "^(-?%d+)(%d%d%d)", formattedText)
		p1 = replaced
	until replaced_1 == 0
	return p1
end

return {
	getKeyFromItemType = function(p1)
		-- upvalues: itemTypeModule (ref), keyMappingsModule (ref)
		assert(itemTypeModule.isMember(p1) or (if typeof(p1) ~= "number" then typeof(p1) == "string" else true), "provided item type " .. tostring(p1) .. " must be a number, string, or ItemType enum")
		local _ = nil
		
		return if p1 == itemTypeModule.Bundle then "CoreScripts.PurchasePrompt.ItemType.Bundle" else keyMappingsModule.AssetTypeById[tostring(p1)]
	end,
	getErrorKey = function(p1)
		-- upvalues: purchaseErrorModule (ref), keyMappingsModule (ref)
		assert(purchaseErrorModule.isMember(p1), "provided value " .. tostring(p1) .. " is not a member of PurchaseError enum")
		
		return keyMappingsModule.PurchaseErrorKey[p1]
	end
}