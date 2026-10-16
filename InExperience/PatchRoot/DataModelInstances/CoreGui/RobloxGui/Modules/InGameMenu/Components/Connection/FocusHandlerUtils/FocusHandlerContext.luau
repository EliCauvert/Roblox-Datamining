return require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact.createContext({
	currentHandlerId = nil,
	candidateHandlerId = nil,
	previousSelections = {},
	requestFocusForHandlerId = function() --[[ Line: 9 ]] end,
	forgetLastSelectionForHandlerId = function() --[[ Line: 10 ]] end,
	blurCurrentFocusHandler = function() --[[ Line: 11 ]] end
})