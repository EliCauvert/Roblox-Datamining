local parent = script:FindFirstAncestor("EditProfileBackground").Parent

return require(parent.React).createContext({ fireAnalyticsEvent = require(parent.Dash).noop })