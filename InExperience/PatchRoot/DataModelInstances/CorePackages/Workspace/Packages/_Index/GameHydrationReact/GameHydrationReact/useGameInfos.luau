local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local var4 = nil
local t = nil

if fFlagMigrateGameInfoToStore then
	var4 = signalsModule.createSignal(false)
	t = {}
end
return function(p0)
	-- upvalues: reactModule (ref), dataHydrationModule (ref), fFlagMigrateGameInfoToStore (ref), var4 (write), t (write), signalsReactModule (ref)
	local t_1 = {}
	
	for i, v in p0 do
		table.insert(t_1, tostring(v))
	end
	table.sort(t_1)
	local joined = table.concat(t_1, ",")
	local var8 = reactModule.useMemo(function()
		-- upvalues: joined (ref)
		return if joined == "" then {} else string.split(joined, ",")
	end, { joined })
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: dataHydrationModule (copy), var8 (ref), fFlagMigrateGameInfoToStore (copy), var4 (copy), t (copy)
		local gameInfos = dataHydrationModule.Game.getGameInfoStore(false).getGameInfos(var8)
		
		return function(p1)
			-- upvalues: fFlagMigrateGameInfoToStore (copy), gameInfos (ref), var4 (copy), t (copy)
			if fFlagMigrateGameInfoToStore and next(gameInfos) == nil then
				var4(p1)
				
				return t
			end
			local t_1 = {}
			
			for i, v in gameInfos do
				local var11 = v.data(p1)
				
				if var11 then
					t_1[i] = var11
				end
			end
			return t_1
		end
	end, { var8 }))
end