local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)

return function(p0, p1) --[[ line: 17 | named "useGameIconForSize" ]]
	-- upvalues: reactModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var3 = tostring(p0)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 20 ]]
		-- upvalues: dataHydrationModule (copy), var3 (ref), p1 (ref)
		local gameIcon = dataHydrationModule.Game.getGameIconStore(false).getGameIcon(var3, p1)
		
		return function(p2) --[[ line: 22 ]]
			-- upvalues: gameIcon (ref)
			local var5 = gameIcon.data(p2)
			
			return if var5 then var5.url else nil
		end
	end, { var3, p1 }))
end