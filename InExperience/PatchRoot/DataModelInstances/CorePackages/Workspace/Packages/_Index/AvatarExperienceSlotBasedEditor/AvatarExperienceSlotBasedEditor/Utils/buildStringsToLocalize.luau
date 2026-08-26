local _ = require(script.Parent.Parent.Types)

return function(p1)
	local t = {}
	
	for i, v in p1 do
		t[v.nameTranslationKey] = v.nameTranslationKey
	end
	return t
end