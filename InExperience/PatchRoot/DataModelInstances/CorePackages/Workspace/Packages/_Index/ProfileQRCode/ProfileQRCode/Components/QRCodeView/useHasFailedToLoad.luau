local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local eventNamesModule = require(profileQRCode.Analytics.EventNames)
local useEffectOnce = require(profileQRCode.Parent.RoactUtils).Hooks.useEffectOnce
local _ = require(profileQRCode.Analytics.useAnalytics)

return function(p1, p2)
	-- upvalues: useEffectOnce (ref), eventNamesModule (ref)
	useEffectOnce(function()
		-- upvalues: p1 (ref), eventNamesModule (copy)
		p1.fireEvent(eventNamesModule.QRPageLoadFailed)
	end, p2)
end