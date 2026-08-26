return function(p1, p2)
	if p1 == nil or p2 == nil then
		return nil
	end
	for i, v in pairs(p1) do
		local locale = v.locale
		
		if locale and locale.language and locale.language.languageCode == p2 then
			return locale.language.name
		end
	end
	return nil
end