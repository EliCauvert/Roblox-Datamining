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
return function(List)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), FFlagMigrateGameInfoToStore (copy), Callback (ref), v1 (ref), SignalsReactModule (copy)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, (tostring(value)))
	end
	table.sort(List1)
	local Joined = table.concat(List1, ",")
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Joined (copy)
		return if Joined == "" then {} else string.split(Joined, ",")
	end, { Joined })
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: DataHydrationModule (upval), UseMemoResult (copy), FFlagMigrateGameInfoToStore (upval), Callback (upval), v1 (upval)
		local GameInfos = DataHydrationModule.Game.getGameInfoStore(false).getGameInfos(UseMemoResult)
		
		return function(p1)
			-- upvalues: FFlagMigrateGameInfoToStore (upval), GameInfos (copy), Callback (upval), v1 (upval)
			if FFlagMigrateGameInfoToStore and next(GameInfos) == nil then
				Callback(p1)
				
				return v1
			end
			local DataResults = {}
			
			for i, gameInfo in GameInfos do
				local DataResult = gameInfo.data(p1)
				
				if DataResult then
					DataResults[i] = DataResult
				end
			end
			return DataResults
		end
	end, { UseMemoResult })))
end