local _ = require(script.Parent.Parent.Types)

return function(p0)
	local t = {}
	
	for i, v in p0 do
		t[v.nameTranslationKey] = v.nameTranslationKey
	end
	return t
end