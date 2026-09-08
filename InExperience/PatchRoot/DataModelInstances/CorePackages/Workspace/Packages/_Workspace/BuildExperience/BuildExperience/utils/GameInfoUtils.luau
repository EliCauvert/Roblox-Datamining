local parent = script:FindFirstAncestor("BuildExperience").Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return {
	useGameInfo = function(p1)
		-- upvalues: reactModule (ref), signalsModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
		local var1 = if p1 == nil then nil else tostring(p1)
		
		return signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var1 (ref), dataHydrationModule (copy)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var1 (copy), dataHydrationModule (copy)
				return if var1 == nil then nil else dataHydrationModule.Game.getGameInfoStore(p2).getAndFetchGameInfo(var1).data(p2)
			end)
		end, { var1 }))
	end,
	isGameInfoReady = function(p1)
		return p1 ~= nil and not p1.isUnavailable
	end,
	getGameInfoName = function(p1)
		return if p1 == nil or p1.isUnavailable or (typeof(p1.name) ~= "string" or p1.name == "") then nil else p1.name
	end,
	isTitleDescriptionReady = function(p1)
		return (if p1 == nil or p1.isUnavailable or (typeof(p1.name) ~= "string" or p1.name == "") then nil else p1.name) ~= nil
	end
}