local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, tostring(v))
	end
	table.sort(t)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: dataHydrationModule (copy), p3 (ref), t (ref), p2 (ref)
		local gameIconStore = dataHydrationModule.Game.getGameIconStore(false)
		local var1 = if p3 then gameIconStore.getAndFetchGameIcons(t, p2) else gameIconStore.getGameIcons(t, p2)
		
		return function(p4)
			-- upvalues: var1 (ref)
			local t = {}
			
			for i, v in var1 do
				local var2 = v.data(p4)
				
				if var2 and var2.url then
					t[i] = var2.url
				end
			end
			return t
		end
	end, { table.concat(t, ","), p2, p3 }))
end