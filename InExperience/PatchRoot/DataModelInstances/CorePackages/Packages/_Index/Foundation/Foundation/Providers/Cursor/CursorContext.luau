local foundation = script:FindFirstAncestor("Foundation")
local loggerModule = require(foundation.Utility.Logger)
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.CursorType)
local _ = require(foundation.Components.Types)

return reactModule.createContext({
	refCache = {},
	setMountedCursors = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("No Cursor Provider found")
	end,
	getCursor = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("No Cursor Provider found")
	end
})