local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local eventNamesModule = require(profileQRCode.Analytics.EventNames)
local useEffectOnce = require(profileQRCode.Parent.RoactUtils).Hooks.useEffectOnce
local useShareLinkIdModule = require(profileQRCode.Rodux.useShareLinkId)
local _ = require(profileQRCode.Analytics.useAnalytics)

return function(p0, p1)
	-- upvalues: useShareLinkIdModule (ref), eventNamesModule (ref), useEffectOnce (ref)
	local var3 = useShareLinkIdModule()
	useEffectOnce(function()
		-- upvalues: p0 (ref), eventNamesModule (copy), var3 (ref)
		p0.fireEvent(eventNamesModule.QRPageLoad, { shareLinkId = var3 })
	end, p1)
end