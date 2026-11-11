local Parent = script:FindFirstAncestor("UnitTestHelpersJest").Parent
local CryoModule = require(Parent.Cryo)
local Jest = require(Parent.JestGlobals).jest

return function(p1)
	-- upvalues: CryoModule (copy), Jest (copy)
	return CryoModule.Dictionary.join({
		network = Jest.fn(),
		closeCentralOverlay = Jest.fn(),
		launchGame = Jest.fn(),
		resolveLinkFromLinkId = Jest.fn().mockReturnValue({}),
		analyticsImpls = {
			shareLinksAnalytics = {
				openAppViaShareLink = Jest.fn(),
				resolveLink = Jest.fn(),
				errorDialogButtonClick = Jest.fn(),
				errorJoinDialogButtonClick = Jest.fn(),
				gameLaunch = Jest.fn()
			}
		}
	}, p1 or {})
end