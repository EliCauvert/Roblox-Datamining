local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)

return function(p0, p1, p2) --[[ line: 14 | named "useGameIconsForSize" ]]
	-- upvalues: reactModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local t = {}
	
	for i, v in p0 do
		table.insert(t, tostring(v))
	end
	table.sort(t)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 27 ]]
		-- upvalues: dataHydrationModule (copy), p2 (ref), t (ref), p1 (ref)
		local gameIconStore = dataHydrationModule.Game.getGameIconStore(false)
		local var5 = if p2 then gameIconStore.getAndFetchGameIcons(t, p1) else gameIconStore.getGameIcons(t, p1)
		
		return function(p3) --[[ line: 32 ]]
			-- upvalues: var5 (ref)
			local t = {}
			
			for i, v in var5 do
				local var7 = v.data(p3)
				
				if var7 and var7.url then
					t[i] = var7.url
				end
			end
			return t
		end
	end, { table.concat(t, ","), p1, p2 }))
end