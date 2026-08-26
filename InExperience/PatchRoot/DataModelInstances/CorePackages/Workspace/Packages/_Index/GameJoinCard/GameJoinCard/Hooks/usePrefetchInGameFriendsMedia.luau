local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local reactModule = require(gameJoinCard.Parent.React)
local prefetchGameJoinCardMediaModule = require(gameJoinCard.prefetchGameJoinCardMedia)

return function(p1)
	-- upvalues: reactModule (ref), prefetchGameJoinCardMediaModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		if not p1 then
			return ""
		end
		local t = {}
		local t_1 = {}
		
		for i, v in p1 do
			local presence = v.presence
			
			if presence and presence.userPresenceType == "InGame" then
				local var2 = tostring(presence.universeId or "")
				
				if var2 ~= "" and not t[var2] then
					t[var2] = true
					table.insert(t_1, var2)
				end
			end
		end
		table.sort(t_1)
		
		return table.concat(t_1, ",")
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), prefetchGameJoinCardMediaModule (copy)
		if var1 == "" then return end
		local t = {}
		
		for i, v in string.split(var1, ",") do
			table.insert(t, { universeId = v })
		end
		prefetchGameJoinCardMediaModule(t)
	end, { var1 })
end