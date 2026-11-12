local Parent = script:FindFirstAncestor("GameHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local Signal = require(Parent.Signals).createSignal(false)
local t = {}

return function(List, p1, p2)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), Signal (copy), t (copy), SignalsReactModule (copy)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, (tostring(value)))
	end
	table.sort(List1)
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: DataHydrationModule (upval), p2 (copy), List1 (copy), p1 (copy), Signal (upval), t (upval)
		local GameIconStore = DataHydrationModule.Game.getGameIconStore(false)
		local AndFetchGameIcons = if p2 then GameIconStore.getAndFetchGameIcons(List1, p1) else GameIconStore.getGameIcons(List1, p1)
		
		return function(p3)
			-- upvalues: AndFetchGameIcons (copy), Signal (upval), t (upval)
			if next(AndFetchGameIcons) == nil then
				Signal(p3)
				
				return t
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