local Parent = script:FindFirstAncestor("GameHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local FFlagMigrateGameInfoToStore = require(Parent.SharedFlags).FFlagMigrateGameInfoToStore
local Callback = nil
local v1 = nil

if FFlagMigrateGameInfoToStore then
	Callback = SignalsModule.createSignal(false)
	v1 = {}
end
return function(List, p1, p2)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), FFlagMigrateGameInfoToStore (copy), Callback (ref), v1 (ref), SignalsReactModule (copy)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, (tostring(value)))
	end
	table.sort(List1)
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: DataHydrationModule (upval), p2 (copy), List1 (copy), p1 (copy), FFlagMigrateGameInfoToStore (upval), Callback (upval), v1 (upval)
		local GameIconStore = DataHydrationModule.Game.getGameIconStore(false)
		local AndFetchGameIcons = if p2 then GameIconStore.getAndFetchGameIcons(List1, p1) else GameIconStore.getGameIcons(List1, p1)
		
		return function(p3)
			-- upvalues: FFlagMigrateGameInfoToStore (upval), AndFetchGameIcons (copy), Callback (upval), v1 (upval)
			if FFlagMigrateGameInfoToStore and next(AndFetchGameIcons) == nil then
				Callback(p3)
				
				return v1
			end
			local Urls = {}
			
			for i, andFetchGameIcon in AndFetchGameIcons do
				local DataResult = andFetchGameIcon.data(p3)
				
				if DataResult and DataResult.url then
					Urls[i] = DataResult.url
				end
			end
			return Urls
		end
	end, { table.concat(List1, ","), p1, p2 })))
end