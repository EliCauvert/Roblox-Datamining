local Parent = script:FindFirstAncestor("RobloxAppNavigation").Parent

return require(Parent.React).createContext(require(Parent.RobloxAppEnums).AppPage.None)