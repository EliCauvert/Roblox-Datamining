local parent = script:FindFirstAncestor("RobloxAppNavigation").Parent

return require(parent.React).createContext(require(parent.RobloxAppEnums).AppPage.None)