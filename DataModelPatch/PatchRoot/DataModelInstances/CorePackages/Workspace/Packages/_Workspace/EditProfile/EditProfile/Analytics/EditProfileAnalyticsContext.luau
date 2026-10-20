local Parent = script:FindFirstAncestor("EditProfile").Parent

return require(Parent.React).createContext({ fireAnalyticsEvent = require(Parent.Dash).noop })