local _ = require(script.Parent.Parent.Types)
local _ = require(script.Parent.Parent.Enums.Categories)

return function(p1)
	local t = {}
	
	for i, v in p1 do
		if not v.hide then
			t[v.nameTranslationKey] = v.nameTranslationKey
		end
	end
	return t
end