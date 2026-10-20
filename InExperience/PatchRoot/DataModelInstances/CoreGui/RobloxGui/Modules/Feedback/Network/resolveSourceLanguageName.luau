return function(List, LanguageCode)
	if List == nil or LanguageCode == nil then
		return nil
	end
	local Locale = nil
	for _, value in pairs(List) do
		Locale = value.locale
		
		if Locale and Locale.language and Locale.language.languageCode == LanguageCode then
			return Locale.language.name
		end
	end
	return nil
end