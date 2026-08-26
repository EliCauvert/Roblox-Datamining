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
local var1 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), var1 (ref), useSignalState (ref), cryoModule (ref), userTileModule (ref)
	local _ = nil
	local var2 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref), var1 (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy), var1 (copy)
			return if p1.userId and p1.userId ~= "" then var1.getIsTrustedConnection(p1.userId).data(p2) else nil
		end)
	end, { p1.userId }))
	
	return reactModule.createElement(userTileModule, reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref), var2 (write)
		return cryoModule.Dictionary.join(p1 or {}, { isTrustedConnection = var2 })
	end, { p1, var2 }))
end