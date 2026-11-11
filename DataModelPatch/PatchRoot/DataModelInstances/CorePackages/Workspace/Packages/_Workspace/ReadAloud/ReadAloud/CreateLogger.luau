local Logger = require(script:FindFirstAncestor("ReadAloud").Parent.Loggers).Logger

return function(Text)
	-- upvalues: Logger (copy)
	return Logger:new("ReadAloud." .. Text)
end