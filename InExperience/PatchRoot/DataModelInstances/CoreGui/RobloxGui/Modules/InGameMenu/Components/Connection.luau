local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local friendStatusConnectorModule = require(script.FriendStatusConnector)
local lastInputTypeConnectorModule = require(script.LastInputTypeConnector)
local mouseOverrideManagerModule = require(script.MouseOverrideManager)
local focusHighlightManagerModule = require(script.FocusHighlightManager)
local nativeCloseEventConnectorModule = require(script.NativeCloseEventConnector)
local var6 = t.strictInterface({ isEducationalPopupEnabled = t.optional(t.boolean) })

return require(script.Parent.Parent.InGameMenuPolicy).connect(function(p1, _) --[[ line: 32 ]]
	return { isEducationalPopupEnabled = p1.enableEducationalPopup() }
end)(function(p0) --[[ line: 20 | named "Connection" ]]
	-- upvalues: var6 (ref), roact (ref), friendStatusConnectorModule (ref), lastInputTypeConnectorModule (ref), mouseOverrideManagerModule (ref), focusHighlightManagerModule (ref), nativeCloseEventConnectorModule (ref)
	assert(var6)
	
	return roact.createFragment({
		FriendStatusConnector = roact.createElement(friendStatusConnectorModule),
		LastInputTypeConnector = roact.createElement(lastInputTypeConnectorModule),
		MouseOverrideManager = roact.createElement(mouseOverrideManagerModule),
		FocusHighlightManager = roact.createElement(focusHighlightManagerModule),
		NativeCloseEventConnector = p0.isEducationalPopupEnabled and roact.createElement(nativeCloseEventConnectorModule) or nil
	})
end)