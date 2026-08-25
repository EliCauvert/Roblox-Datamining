local _ = require(script.Parent.EventNames)

return require(script:FindFirstAncestor("Groups").Parent.React).createContext({ fireAnalyticsEvent = function() end })