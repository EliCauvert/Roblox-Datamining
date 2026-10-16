local _ = require(script.Parent.Parent.Types)
local _ = require(script.Parent.Parent.Enums.Categories)

return function(List) --[[ Line: 8 | Named "buildSlotCategoryLocalizationKeys" ]]
	local NameTranslationKeys = {}
	
	for _, value in List do
		if not value.hide then
			NameTranslationKeys[value.nameTranslationKey] = value.nameTranslationKey
		end
	end
	return NameTranslationKeys
end