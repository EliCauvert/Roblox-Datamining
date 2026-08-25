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
return function(p0, p1, p2)
	-- upvalues: reactModule (ref), dataHydrationModule (ref), fFlagMigrateGameInfoToStore (ref), var4 (write), t (write), signalsReactModule (ref)
	local t_1 = {}
	
	for i, v in p0 do
		table.insert(t_1, tostring(v))
	end
	table.sort(t_1)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: dataHydrationModule (copy), p2 (ref), t_1 (ref), p1 (ref), fFlagMigrateGameInfoToStore (copy), var4 (copy), t (copy)
		local gameIconStore = dataHydrationModule.Game.getGameIconStore(false)
		local var8 = if p2 then gameIconStore.getAndFetchGameIcons(t_1, p1) else gameIconStore.getGameIcons(t_1, p1)
		
		return function(p3)
			-- upvalues: fFlagMigrateGameInfoToStore (copy), var8 (ref), var4 (copy), t (copy)
			if fFlagMigrateGameInfoToStore and next(var8) == nil then
				var4(p3)
				
				return t
			end
			local t_1 = {}
			
			for i, v in var8 do
				local var10 = v.data(p3)
				
				if var10 and var10.url then
					t_1[i] = var10.url
				end
			end
			return t_1
		end
	end, { table.concat(t_1, ","), p1, p2 }))
end