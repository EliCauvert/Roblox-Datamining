local DependenciesModule = require(script:FindFirstAncestor("AccountSwitching").dependencies)
local CentralOverlayType = DependenciesModule.RobloxAppEnums.CentralOverlayType
local SetCentralOverlayFunction = DependenciesModule.CentralOverlay.Actions.SetCentralOverlay

return function(TitleTextKey, BodyTextKey, PrimaryButtonTextKey, SecondaryButtonTextKey, PrimaryButtonCallback, SecondaryButtonCallback, ErrorType, BodyUsername, ForceDarkTheme)
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), TitleTextKey (copy), BodyTextKey (copy), PrimaryButtonTextKey (copy), SecondaryButtonTextKey (copy), PrimaryButtonCallback (copy), SecondaryButtonCallback (copy), ErrorType (copy), BodyUsername (copy), ForceDarkTheme (copy)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.AccountSwitchingErrorOverlay, {
			titleTextKey = TitleTextKey,
			bodyTextKey = BodyTextKey,
			primaryButtonTextKey = PrimaryButtonTextKey,
			secondaryButtonTextKey = SecondaryButtonTextKey,
			primaryButtonCallback = PrimaryButtonCallback,
			secondaryButtonCallback = SecondaryButtonCallback,
			errorType = ErrorType,
			bodyUsername = BodyUsername,
			forceDarkTheme = ForceDarkTheme
		}))
	end
end