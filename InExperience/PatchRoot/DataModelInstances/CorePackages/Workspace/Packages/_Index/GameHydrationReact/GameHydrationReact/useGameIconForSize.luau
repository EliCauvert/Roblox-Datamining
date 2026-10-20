local Parent = script:FindFirstAncestor("GameHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)

return function(p1, p2)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), SignalsReactModule (copy)
	local Text = tostring(p1)
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: DataHydrationModule (upval), Text (copy), p2 (copy)
		local GameIcon = DataHydrationModule.Game.getGameIconStore(false).getGameIcon(Text, p2)
		
		return function(p3)
			-- upvalues: GameIcon (copy)
			local DataResult = GameIcon.data(p3)
			
			return if DataResult then DataResult.url else nil
		end
	end, { Text, p2 })))
end