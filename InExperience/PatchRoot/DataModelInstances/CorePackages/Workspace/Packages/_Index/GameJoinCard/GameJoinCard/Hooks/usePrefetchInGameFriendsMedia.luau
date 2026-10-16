local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local ReactModule = require(GameJoinCard.Parent.React)
local PrefetchGameJoinCardMediaModule = require(GameJoinCard.prefetchGameJoinCardMedia)

return function(p1) --[[ Line: 21 | Named "usePrefetchInGameFriendsMedia" ]]
	-- upvalues: ReactModule (copy), PrefetchGameJoinCardMediaModule (copy)
	local UseMemoResult = ReactModule.useMemo(function(): string --[[ Line: 24 ]]
		-- upvalues: p1 (copy)
		if not p1 then
			return ""
		end
		local t = {}
		local List = {}
		
		for _, value in p1 do
			local Presence = value.presence
			
			if Presence and Presence.userPresenceType == "InGame" then
				local Text = tostring(Presence.universeId or "")
				
				if Text ~= "" and not t[Text] then
					t[Text] = true
					table.insert(List, Text)
				end
			end
		end
		table.sort(List)
		
		return table.concat(List, ",")
	end, { p1 })
	ReactModule.useEffect(function() --[[ Line: 45 ]]
		-- upvalues: UseMemoResult (copy), PrefetchGameJoinCardMediaModule (upval)
		if UseMemoResult == "" then return end
		local List = {}
		
		for _, UniverseId in string.split(UseMemoResult, ",") do
			table.insert(List, { universeId = UniverseId })
		end
		PrefetchGameJoinCardMediaModule(List)
	end, { UseMemoResult })
end