local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)

return function(p1)
	-- upvalues: reactModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, tostring(v))
	end
	table.sort(t)
	local joined = table.concat(t, ",")
	local var1 = reactModule.useMemo(function()
		-- upvalues: joined (ref)
		return if joined == "" then {} else string.split(joined, ",")
	end, { joined })
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: dataHydrationModule (copy), var1 (ref)
		local gameInfos = dataHydrationModule.Game.getGameInfoStore(false).getGameInfos(var1)
		
		return function(p2)
			-- upvalues: gameInfos (ref)
			local t = {}
			
			for i, v in gameInfos do
				local var2 = v.data(p2)
				
				if var2 then
					t[i] = var2
				end
			end
			return t
		end
	end, { var1 }))
end