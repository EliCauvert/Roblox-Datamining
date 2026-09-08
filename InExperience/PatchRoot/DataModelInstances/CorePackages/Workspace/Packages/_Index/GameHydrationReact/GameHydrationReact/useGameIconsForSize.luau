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
return function(p1, p2, p3)
	-- upvalues: reactModule (ref), dataHydrationModule (ref), fFlagMigrateGameInfoToStore (ref), var1 (write), t (write), signalsReactModule (ref)
	local t_1 = {}
	
	for i, v in p1 do
		table.insert(t_1, tostring(v))
	end
	table.sort(t_1)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: dataHydrationModule (copy), p3 (ref), t_1 (ref), p2 (ref), fFlagMigrateGameInfoToStore (copy), var1 (copy), t (copy)
		local gameIconStore = dataHydrationModule.Game.getGameIconStore(false)
		local var2 = if p3 then gameIconStore.getAndFetchGameIcons(t_1, p2) else gameIconStore.getGameIcons(t_1, p2)
		
		return function(p4)
			-- upvalues: fFlagMigrateGameInfoToStore (copy), var2 (ref), var1 (copy), t (copy)
			if fFlagMigrateGameInfoToStore and next(var2) == nil then
				var1(p4)
				
				return t
			end
			local t_1 = {}
			
			for i, v in var2 do
				local var3 = v.data(p4)
				
				if var3 and var3.url then
					t_1[i] = var3.url
				end
			end
			return t_1
		end
	end, { table.concat(t_1, ","), p2, p3 }))
end