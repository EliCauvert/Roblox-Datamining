local foundation = script:FindFirstAncestor("Foundation")
local loggerModule = require(foundation.Utility.Logger)

return require(foundation.Parent.React).createContext(function() --[[ line: 10 ]]
	-- upvalues: loggerModule (ref)
	loggerModule:warning("No Style Provider found")
	
	return ""
end)