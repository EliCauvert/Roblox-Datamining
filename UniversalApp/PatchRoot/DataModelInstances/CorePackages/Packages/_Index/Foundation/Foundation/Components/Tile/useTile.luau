local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local reactModule = require(foundation.Parent.React)
local tileContextModule = require(script.Parent.TileContext)

return function() --[[ line: 17 ]]
	-- upvalues: reactModule (ref), tileContextModule (ref)
	return reactModule.useContext(tileContextModule)
end