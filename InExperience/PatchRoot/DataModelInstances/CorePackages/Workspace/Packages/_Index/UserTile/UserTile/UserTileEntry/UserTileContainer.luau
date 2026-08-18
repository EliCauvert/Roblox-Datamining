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
local var6 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p0) --[[ line: 42 | named "UserTileContainer" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), var6 (ref), useSignalState (ref), cryoModule (ref), userTileModule (ref)
	local _ = nil
	local var7 = useSignalState(reactModule.useMemo(function() --[[ line: 44 ]]
		-- upvalues: signalsModule (copy), p0 (ref), var6 (copy)
		return signalsModule.createComputed(function(p1) --[[ line: 45 ]]
			-- upvalues: p0 (copy), var6 (copy)
			return if p0.userId and p0.userId ~= "" then var6.getIsTrustedConnection(p0.userId).data(p1) else nil
		end)
	end, { p0.userId }))
	
	return reactModule.createElement(userTileModule, reactModule.useMemo(function() --[[ line: 55 ]]
		-- upvalues: cryoModule (copy), p0 (ref), var7 (write)
		return cryoModule.Dictionary.join(p0 or {}, { isTrustedConnection = var7 })
	end, { p0, var7 }))
end