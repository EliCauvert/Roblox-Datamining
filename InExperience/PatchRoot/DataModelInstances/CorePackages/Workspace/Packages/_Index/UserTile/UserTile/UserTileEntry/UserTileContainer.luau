local UserTile = script:FindFirstAncestor("UserTile")
local Parent = UserTile.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local CryoModule = require(Parent.Cryo)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local SignalsModule = require(Parent.Signals)
local UserTileModule = require(UserTile.Components.UserTile)
local _ = require(script.Parent.Parent.Enums.LayoutMode)
local GetResult = require(Parent.DataHydration).TrustedConnections.TrustedConnectionsStore.get()

return function(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetResult (copy), UseSignalStateFunction (copy), CryoModule (copy), UserTileModule (copy)
	local UseSignalStateResult = nil
	UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy), GetResult (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: p1 (upval), GetResult (upval)
			return if p1.userId and p1.userId ~= "" then GetResult.getIsTrustedConnection(p1.userId).data(p2) else nil
		end)
	end, { p1.userId })))
	
	return ReactModule.createElement(UserTileModule, (ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy), UseSignalStateResult (ref)
		return CryoModule.Dictionary.join(p1 or {}, { isTrustedConnection = UseSignalStateResult })
	end, { p1, UseSignalStateResult })))
end