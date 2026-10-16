local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local EventNamesModule = require(ProfileQRCode.Analytics.EventNames)
local UseEffectOnceFunction = require(ProfileQRCode.Parent.RoactUtils).Hooks.useEffectOnce
local UseShareLinkIdModule = require(ProfileQRCode.Rodux.useShareLinkId)
local _ = require(ProfileQRCode.Analytics.useAnalytics)

return function(p1, p2) --[[ Line: 9 ]]
	-- upvalues: UseShareLinkIdModule (copy), EventNamesModule (copy), UseEffectOnceFunction (copy)
	local UseShareLinkIdModuleResult = UseShareLinkIdModule()
	UseEffectOnceFunction(function() --[[ Line: 11 ]]
		-- upvalues: p1 (copy), EventNamesModule (upval), UseShareLinkIdModuleResult (copy)
		p1.fireEvent(EventNamesModule.QRPageLoad, { shareLinkId = UseShareLinkIdModuleResult })
	end, p2)
end