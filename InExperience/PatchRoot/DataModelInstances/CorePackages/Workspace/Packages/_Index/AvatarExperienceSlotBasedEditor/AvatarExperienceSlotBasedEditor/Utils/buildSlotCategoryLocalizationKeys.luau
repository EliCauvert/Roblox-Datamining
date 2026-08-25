local _ = require(script.Parent.Parent.Types)
local _ = require(script.Parent.Parent.Enums.Categories)

return function(p0)
	local t = {}
	
	for i, v in p0 do
		if not v.hide then
			t[v.nameTranslationKey] = v.nameTranslationKey
		end
	end
	return t
end