local Foundation = script:FindFirstAncestor("Foundation")
local LoggerModule = require(Foundation.Utility.Logger)

return (require(Foundation.Parent.React).createContext(function(): string --[[ Line: 10 ]]
	-- upvalues: LoggerModule (copy)
	LoggerModule:warning("No Style Provider found")
	
	return ""
end))