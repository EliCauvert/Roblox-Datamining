local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local FriendStatusConnectorModule = require(script.FriendStatusConnector)
local LastInputTypeConnectorModule = require(script.LastInputTypeConnector)
local MouseOverrideManagerModule = require(script.MouseOverrideManager)
local FocusHighlightManagerModule = require(script.FocusHighlightManager)
local NativeCloseEventConnectorModule = require(script.NativeCloseEventConnector)
local StrictInterfaceResult = T.strictInterface({ isEducationalPopupEnabled = T.optional(T.boolean) })

return require(script.Parent.Parent.InGameMenuPolicy).connect(function(p1, _)
	return { isEducationalPopupEnabled = p1.enableEducationalPopup() }
end)(function(p1)
	-- upvalues: StrictInterfaceResult (copy), Roact (copy), FriendStatusConnectorModule (copy), LastInputTypeConnectorModule (copy), MouseOverrideManagerModule (copy), FocusHighlightManagerModule (copy), NativeCloseEventConnectorModule (copy)
	assert(StrictInterfaceResult)
	
	return Roact.createFragment({
		FriendStatusConnector = Roact.createElement(FriendStatusConnectorModule),
		LastInputTypeConnector = Roact.createElement(LastInputTypeConnectorModule),
		MouseOverrideManager = Roact.createElement(MouseOverrideManagerModule),
		FocusHighlightManager = Roact.createElement(FocusHighlightManagerModule),
		NativeCloseEventConnector = p1.isEducationalPopupEnabled and Roact.createElement(NativeCloseEventConnectorModule) or nil
	})
end)