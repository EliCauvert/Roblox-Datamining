local _ = require(script.Parent.ChatPlatformTypes)

return require(script:FindFirstAncestor("ExpChatIntegration").Parent.React).createContext(require(script.Parent.createDefaultChatPlatformValue)())