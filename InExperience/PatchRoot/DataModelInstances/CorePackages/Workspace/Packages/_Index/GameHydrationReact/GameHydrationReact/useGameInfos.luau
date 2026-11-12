local Parent = script:FindFirstAncestor("GameHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local Signal = require(Parent.Signals).createSignal(false)
local t = {}

return function(List)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), Signal (copy), t (copy), SignalsReactModule (copy)
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
		-- upvalues: DataHydrationModule (upval), UseMemoResult (copy), Signal (upval), t (upval)
		local GameInfos = DataHydrationModule.Game.getGameInfoStore(false).getGameInfos(UseMemoResult)
		
		return function(p1)
			-- upvalues: GameInfos (copy), Signal (upval), t (upval)
			if next(GameInfos) == nil then
				Signal(p1)
				
				return t
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