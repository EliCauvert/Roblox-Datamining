local Parent = script:FindFirstAncestor("BuildExperience").Parent
local DataHydrationModule = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)

return {
	useGameInfo = function(p1) --[[ Line: 14 ]]
		-- upvalues: ReactModule (copy), SignalsModule (copy), DataHydrationModule (copy), SignalsReactModule (copy)
		local Text = if p1 == nil then nil else tostring(p1)
		
		return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 16 ]]
			-- upvalues: SignalsModule (upval), Text (copy), DataHydrationModule (upval)
			return SignalsModule.createComputed(function(p2) --[[ Line: 17 ]]
				-- upvalues: Text (upval), DataHydrationModule (upval)
				return if Text == nil then nil else DataHydrationModule.Game.getGameInfoStore(p2).getAndFetchGameInfo(Text).data(p2)
			end)
		end, { Text })))
	end,
	isGameInfoReady = function(p1): boolean --[[ Line: 29 ]]
		return p1 ~= nil and not p1.isUnavailable
	end,
	getGameInfoName = function(p1) --[[ Line: 34 ]]
		return if p1 == nil or p1.isUnavailable or typeof(p1.name) ~= "string" or p1.name == "" then nil else p1.name
	end,
	isTitleDescriptionReady = function(p1): boolean --[[ Line: 44 ]]
		return (if p1 == nil or p1.isUnavailable or typeof(p1.name) ~= "string" or p1.name == "" then nil else p1.name) ~= nil
	end
}