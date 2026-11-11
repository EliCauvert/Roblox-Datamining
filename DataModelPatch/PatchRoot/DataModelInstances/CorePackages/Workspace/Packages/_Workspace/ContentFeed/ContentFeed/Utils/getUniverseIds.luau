local _ = require(script.Parent.Parent.Types)

return function(List)
	local List1 = {}
	local t = {}
	
	for _, value in pairs(List) do
		local Text = tostring(value.experienceContext.experienceId)
		
		if not t[Text] then
			table.insert(List1, Text)
			t[Text] = true
		end
	end
	return List1
end