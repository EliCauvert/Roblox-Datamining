local userTile = script:FindFirstAncestor("UserTile")
local parent = userTile.Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local dataHydrationModule = require(parent.DataHydration)
local useSignalState = require(parent.SignalsReact).useSignalState
local signalsModule = require(parent.Signals)
local userTileModule = require(userTile.Components.UserTile)
local _ = require(script.Parent.Parent.Enums.LayoutMode)
local TCIndicatorHydration = game:DefineFastFlag("TCIndicatorHydration", false)
local var7 = if TCIndicatorHydration then dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get() else nil

return function(p0) --[[ line: 47 | named "UserTileContainer" ]]
	-- upvalues: TCIndicatorHydration (ref), reactModule (ref), signalsModule (ref), var7 (ref), useSignalState (ref), cryoModule (ref), userTileModule (ref)
	local var8 = if TCIndicatorHydration then useSignalState(reactModule.useMemo(function() --[[ line: 50 ]]
		-- upvalues: signalsModule (copy), p0 (ref), var7 (copy)
		return signalsModule.createComputed(function(p1) --[[ line: 51 ]]
			-- upvalues: p0 (copy), var7 (copy)
			return if p0.userId and p0.userId ~= "" then var7.getIsTrustedConnection(p0.userId).data(p1) else nil
		end)
	end, { p0.userId })) else nil
	
	return reactModule.createElement(userTileModule, if TCIndicatorHydration then reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: cryoModule (copy), p0 (ref), var8 (write)
		return cryoModule.Dictionary.join(p0 or {}, { isTrustedConnection = var8 })
	end, { p0, var8 }) else table.clone(p0))
end