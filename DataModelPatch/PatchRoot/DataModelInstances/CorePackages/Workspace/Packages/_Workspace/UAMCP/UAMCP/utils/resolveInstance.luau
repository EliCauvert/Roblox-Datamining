return function(Text: string)
	if not Text or Text == "" then
		return game
	end
	local List = {}
	
	for i in Text:gmatch("[^%.]+") do
		table.insert(List, i)
	end
	local v1: number = if List[1] == "game" then 2 else 1
	
	local function resolveFrom(Child, p1: number)
		-- upvalues: List (copy), v1 (ref), resolveFrom (copy)
		if #List < p1 then
			return Child
		end
		local Entry = List[p1]
		
		if p1 == v1 and Child == game then
			local Entry1 = game:FindFirstChild(Entry)
			
			if not Entry1 then
				local Success, Result = pcall(function()
					-- upvalues: Entry (copy)
					return game:GetService(Entry)
				end)
				
				if Success and Result then
					Entry1 = Result
				end
			end
			return if Entry1 then resolveFrom(Entry1, p1 + 1) else nil
		else
			local v2 = nil
			local ResolveFromResult = nil
			
			for _, child in ipairs((Child:GetChildren())) do
				if child.Name == Entry then
					if not v2 then
						v2 = child
					end
					ResolveFromResult = resolveFrom(child, p1 + 1)
					
					if ResolveFromResult then
						return ResolveFromResult
					end
				end
			end
			return nil
		end
	end
	
	return resolveFrom(game, v1)
end