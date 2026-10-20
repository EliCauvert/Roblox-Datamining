local Foundation = script:FindFirstAncestor("Foundation")
local LoggerModule = require(Foundation.Utility.Logger)
local _ = require(Foundation.Enums.CursorType)
local _ = require(Foundation.Components.Types)

return (require(Foundation.Parent.React).createContext({
	refCache = {},
	setMountedCursors = function(_)
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("No Cursor Provider found")
	end,
	getCursor = function(_)
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("No Cursor Provider found")
	end
}))