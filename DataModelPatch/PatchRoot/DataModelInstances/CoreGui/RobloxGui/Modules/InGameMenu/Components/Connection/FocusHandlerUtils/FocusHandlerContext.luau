return require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact.createContext({
	currentHandlerId = nil,
	candidateHandlerId = nil,
	previousSelections = {},
	requestFocusForHandlerId = function() end,
	forgetLastSelectionForHandlerId = function() end,
	blurCurrentFocusHandler = function() end
})