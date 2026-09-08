local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local var1 = nil
local t = nil

if fFlagMigrateGameInfoToStore then
	var1 = signalsModule.createSignal(false)
	t = {}
end
return function(p1)
	-- upvalues: reactModule (ref), dataHydrationModule (ref), fFlagMigrateGameInfoToStore (ref), var1 (write), t (write), signalsReactModule (ref)
	local t_1 = {}
	
	for i, v in p1 do
		table.insert(t_1, tostring(v))
	end
	table.sort(t_1)
	local joined = table.concat(t_1, ",")
	local var2 = reactModule.useMemo(function()
		-- upvalues: joined (ref)
		return if joined == "" then {} else string.split(joined, ",")
	end, { joined })
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: dataHydrationModule (copy), var2 (ref), fFlagMigrateGameInfoToStore (copy), var1 (copy), t (copy)
		local gameInfos = dataHydrationModule.Game.getGameInfoStore(false).getGameInfos(var2)
		
		return function(p2)
			-- upvalues: fFlagMigrateGameInfoToStore (copy), gameInfos (ref), var1 (copy), t (copy)
			if fFlagMigrateGameInfoToStore and next(gameInfos) == nil then
				var1(p2)
				
				return t
			end
			local t_1 = {}
			
			for i, v in gameInfos do
				local var3 = v.data(p2)
				
				if var3 then
					t_1[i] = var3
				end
			end
			return t_1
		end
	end, { var2 }))
end