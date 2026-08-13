local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)

return function(p0) --[[ line: 17 | named "useGameInfos" ]]
	-- upvalues: reactModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local t = {}
	
	for i, v in p0 do
		table.insert(t, tostring(v))
	end
	table.sort(t)
	local joined = table.concat(t, ",")
	local var5 = reactModule.useMemo(function() --[[ line: 26 ]]
		-- upvalues: joined (ref)
		return if joined == "" then {} else string.split(joined, ",")
	end, { joined })
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 30 ]]
		-- upvalues: dataHydrationModule (copy), var5 (ref)
		local gameInfos = dataHydrationModule.Game.getGameInfoStore(false).getGameInfos(var5)
		
		return function(p1) --[[ line: 32 ]]
			-- upvalues: gameInfos (ref)
			local t = {}
			
			for i, v in gameInfos do
				local var8 = v.data(p1)
				
				if var8 then
					t[i] = var8
				end
			end
			return t
		end
	end, { var5 }))
end