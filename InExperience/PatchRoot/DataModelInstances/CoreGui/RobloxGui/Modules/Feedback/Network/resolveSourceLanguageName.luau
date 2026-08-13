return function(p0, p1) --[[ line: 19 ]]
	if p0 == nil or p1 == nil then
		return nil
	end
	for i, v in pairs(p0) do
		local locale = v.locale
		
		if locale and locale.language and locale.language.languageCode == p1 then
			return locale.language.name
		end
	end
	return nil
end