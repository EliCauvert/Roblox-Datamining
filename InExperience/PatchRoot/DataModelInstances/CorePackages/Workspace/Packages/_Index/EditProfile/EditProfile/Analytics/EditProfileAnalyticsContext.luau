local parent = script:FindFirstAncestor("EditProfile").Parent

return require(parent.React).createContext({ fireAnalyticsEvent = require(parent.Dash).noop })