local Foundation = script:FindFirstAncestor("Foundation")
local LoggerModule = require(Foundation.Utility.Logger)
local _ = require(Foundation.Enums.CursorType)
local _ = require(Foundation.Components.Types)

return (require(Foundation.Parent.React).createContext({
	refCache = {},
	setMountedCursors = function(_) --[[ Line: 12 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("No Cursor Provider found")
	end,
	getCursor = function(_) --[[ Line: 15 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("No Cursor Provider found")
	end
}))