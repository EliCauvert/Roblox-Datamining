local GetIsPlaceholderModule = require(script.Parent.Parent.Utils.getIsPlaceholder)

return function(p1)
	-- upvalues: GetIsPlaceholderModule (copy)
	local List = {}
	
	if p1.current then
		for _, child in pairs(p1.current:GetChildren()) do
			local Name: string = child.Name
			local IsPlaceholderModule = GetIsPlaceholderModule(Name)
			
			if string.match(Name, "[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+") or IsPlaceholderModule then
				table.insert(List, child)
			end
		end
	end
	return List
end