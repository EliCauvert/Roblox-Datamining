local Parent = script:FindFirstAncestor("GameHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)

return function(p1)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), SignalsReactModule (copy)
	local Text = tostring(p1)
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: DataHydrationModule (upval), Text (copy)
		return DataHydrationModule.Game.getGameInfoStore(false).getGameInfo(Text).data
	end, { Text })))
end