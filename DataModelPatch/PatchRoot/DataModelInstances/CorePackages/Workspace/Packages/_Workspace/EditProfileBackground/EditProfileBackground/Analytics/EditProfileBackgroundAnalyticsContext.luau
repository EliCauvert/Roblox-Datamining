local Parent = script:FindFirstAncestor("EditProfileBackground").Parent

return require(Parent.React).createContext({ fireAnalyticsEvent = require(Parent.Dash).noop })