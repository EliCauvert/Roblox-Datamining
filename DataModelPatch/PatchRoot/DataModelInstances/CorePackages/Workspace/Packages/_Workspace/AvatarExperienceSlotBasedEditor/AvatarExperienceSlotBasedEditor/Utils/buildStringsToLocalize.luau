local _ = require(script.Parent.Parent.Types)

return function(List)
	local NameTranslationKeys = {}
	
	for _, value in List do
		NameTranslationKeys[value.nameTranslationKey] = value.nameTranslationKey
	end
	return NameTranslationKeys
end