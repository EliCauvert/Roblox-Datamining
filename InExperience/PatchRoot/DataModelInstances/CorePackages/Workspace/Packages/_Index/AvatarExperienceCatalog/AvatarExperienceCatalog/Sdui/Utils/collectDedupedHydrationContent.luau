local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Components.ResultsList.WidgetListInfoViewModel)
local config = { Asset = true, Bundle = true, Look = true }

return function(p1, List, p2, p3: number) --[[ Line: 22 | Named "collectDedupedHydrationContent" ]]
	-- upvalues: config (copy)
	local Smallest: number = if p3 then math.min(p3, #p1) else #p1
	for i = 1, Smallest do
		local v1 = p1[i]
		local Text = tostring(v1.type)
		local Text1 = tostring(v1.id)
		
		if config[Text] then
			local v2 = p2[Text] or {}
			
			if not v2[Text1] then
				v2[Text1] = true
				p2[Text] = v2
				table.insert(List, v1)
			end
		end
	end
end