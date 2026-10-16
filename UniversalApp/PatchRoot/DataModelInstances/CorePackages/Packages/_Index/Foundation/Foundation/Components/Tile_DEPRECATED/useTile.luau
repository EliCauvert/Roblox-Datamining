local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local ReactModule = require(Foundation.Parent.React)
local TileContextModule = require(script.Parent.TileContext)

return function() --[[ Line: 17 ]]
	-- upvalues: ReactModule (copy), TileContextModule (copy)
	return ReactModule.useContext(TileContextModule)
end