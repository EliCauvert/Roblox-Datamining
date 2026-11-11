local Parent = script.Parent.Parent
local ItemTypeModule = require(Parent.Enums.ItemType)
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local KeyMappingsModule = require(script.Parent.KeyMappings)
local FormattedParam = require(Parent.Symbols.Symbol).named("FormattedParam")

local function _(p1): boolean
	-- upvalues: FormattedParam (copy)
	return typeof(p1) == "table" and p1[FormattedParam] == true
end

local _ = function(Format)
	-- upvalues: FormattedParam (copy)
	return { [FormattedParam] = true, format = Format }
end

local _ = function(p1, p2)
	local Translations = p1.translations
	local FallbackTranslations = p1.fallbackTranslations
	
	return if FallbackTranslations == nil or Translations[p2] ~= nil then Translations[p2] else FallbackTranslations[p2]
end

local _ = function(Text: string, p1): string
	local Formatted = string.format("%%1%s%%2", p1)
	repeat
		local Replaced2
		Text, Replaced2 = string.gsub(Text, "^(-?%d+)(%d%d%d)", Formatted)
	until Replaced2 == 0
	return Text
end

return {
	getKeyFromItemType = function(Bundle)
		-- upvalues: ItemTypeModule (copy), KeyMappingsModule (copy)
		assert(ItemTypeModule.isMember(Bundle) or (typeof(Bundle) == "number" or typeof(Bundle) == "string"), "provided item type " .. tostring(Bundle) .. " must be a number, string, or ItemType enum")
		
		return if Bundle == ItemTypeModule.Bundle then "CoreScripts.PurchasePrompt.ItemType.Bundle" else KeyMappingsModule.AssetTypeById[tostring(Bundle)]
	end,
	getErrorKey = function(p1)
		-- upvalues: PurchaseErrorModule (copy), KeyMappingsModule (copy)
		assert(PurchaseErrorModule.isMember(p1), "provided value " .. tostring(p1) .. " is not a member of PurchaseError enum")
		
		return KeyMappingsModule.PurchaseErrorKey[p1]
	end
}