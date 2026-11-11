local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local Logger = require(Parent.Loggers).Logger
local LoggerModule = require(AppChat.Logger)
require(Parent.Dev.JestGlobals).beforeAll(function()
	-- upvalues: LoggerModule (copy), Logger (copy)
	LoggerModule:setParent(Logger)
end)