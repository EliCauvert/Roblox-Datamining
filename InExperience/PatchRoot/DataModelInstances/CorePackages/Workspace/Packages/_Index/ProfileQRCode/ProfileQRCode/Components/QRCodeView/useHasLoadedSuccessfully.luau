local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local eventNamesModule = require(profileQRCode.Analytics.EventNames)
local useEffectOnce = require(profileQRCode.Parent.RoactUtils).Hooks.useEffectOnce
local useShareLinkIdModule = require(profileQRCode.Rodux.useShareLinkId)
local _ = require(profileQRCode.Analytics.useAnalytics)

return function(p1, p2)
	-- upvalues: useShareLinkIdModule (ref), eventNamesModule (ref), useEffectOnce (ref)
	local var1 = useShareLinkIdModule()
	useEffectOnce(function()
		-- upvalues: p1 (ref), eventNamesModule (copy), var1 (ref)
		p1.fireEvent(eventNamesModule.QRPageLoad, { shareLinkId = var1 })
	end, p2)
end