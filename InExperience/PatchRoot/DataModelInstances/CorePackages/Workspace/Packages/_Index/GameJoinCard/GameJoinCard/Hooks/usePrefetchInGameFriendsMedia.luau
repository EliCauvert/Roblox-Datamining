local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local reactModule = require(gameJoinCard.Parent.React)
local prefetchGameJoinCardMediaModule = require(gameJoinCard.prefetchGameJoinCardMedia)

return function(p0) --[[ line: 21 | named "usePrefetchInGameFriendsMedia" ]]
	-- upvalues: reactModule (ref), prefetchGameJoinCardMediaModule (ref)
	local var3 = reactModule.useMemo(function() --[[ line: 24 ]]
		-- upvalues: p0 (ref)
		if not p0 then
			return ""
		end
		local t = {}
		local t_1 = {}
		
		for i, v in p0 do
			local presence = v.presence
			
			if presence and presence.userPresenceType == "InGame" then
				local var6 = tostring(presence.universeId or "")
				
				if var6 ~= "" and not t[var6] then
					t[var6] = true
					table.insert(t_1, var6)
				end
			end
		end
		table.sort(t_1)
		
		return table.concat(t_1, ",")
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 45 ]]
		-- upvalues: var3 (ref), prefetchGameJoinCardMediaModule (copy)
		if var3 == "" then return end
		local t = {}
		
		for i, v in string.split(var3, ",") do
			table.insert(t, { universeId = v })
		end
		prefetchGameJoinCardMediaModule(t)
	end, { var3 })
end