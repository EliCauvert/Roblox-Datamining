local UserTile = script:FindFirstAncestor("UserTile")
local Parent = UserTile.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local CryoModule = require(Parent.Cryo)
local DataHydrationModule = require(Parent.DataHydration)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local SignalsModule = require(Parent.Signals)
local UserTileModule = require(UserTile.Components.UserTile)
local _ = require(script.Parent.Parent.Enums.LayoutMode)
local TCIndicatorHydration = game:DefineFastFlag("TCIndicatorHydration", false)
local GetResult = if TCIndicatorHydration then DataHydrationModule.TrustedConnections.TrustedConnectionsStore.get() else nil

return function(Tbl)
	-- upvalues: TCIndicatorHydration (copy), ReactModule (copy), SignalsModule (copy), GetResult (copy), UseSignalStateFunction (copy), CryoModule (copy), UserTileModule (copy)
	local UseSignalStateResult = if TCIndicatorHydration then UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Tbl (copy), GetResult (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Tbl (upval), GetResult (upval)
			return if Tbl.userId and Tbl.userId ~= "" then GetResult.getIsTrustedConnection(Tbl.userId).data(p1) else nil
		end)
	end, { Tbl.userId }))) else nil
	
	return ReactModule.createElement(UserTileModule, if TCIndicatorHydration then ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), Tbl (copy), UseSignalStateResult (ref)
		return CryoModule.Dictionary.join(Tbl or {}, { isTrustedConnection = UseSignalStateResult })
	end, { Tbl, UseSignalStateResult }) else table.clone(Tbl))
end