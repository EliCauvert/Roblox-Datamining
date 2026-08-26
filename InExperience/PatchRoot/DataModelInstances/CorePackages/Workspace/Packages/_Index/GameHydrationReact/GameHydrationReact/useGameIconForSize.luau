local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)

return function(p1, p2)
	-- upvalues: reactModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var1 = tostring(p1)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: dataHydrationModule (copy), var1 (ref), p2 (ref)
		local gameIcon = dataHydrationModule.Game.getGameIconStore(false).getGameIcon(var1, p2)
		
		return function(p3)
			-- upvalues: gameIcon (ref)
			local var2 = gameIcon.data(p3)
			
			return if var2 then var2.url else nil
		end
	end, { var1, p2 }))
end