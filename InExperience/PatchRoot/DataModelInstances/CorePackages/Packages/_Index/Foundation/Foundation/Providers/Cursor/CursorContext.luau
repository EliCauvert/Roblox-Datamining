local foundation = script:FindFirstAncestor("Foundation")
local loggerModule = require(foundation.Utility.Logger)
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.CursorType)
local _ = require(foundation.Components.Types)

return reactModule.createContext({
	refCache = {},
	setMountedCursors = function(_) --[[ line: 12 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("No Cursor Provider found")
	end,
	getCursor = function(_) --[[ line: 15 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("No Cursor Provider found")
	end
})