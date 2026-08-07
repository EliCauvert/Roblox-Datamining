local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local eventNamesModule = require(profileQRCode.Analytics.EventNames)
local useEffectOnce = require(profileQRCode.Parent.RoactUtils).Hooks.useEffectOnce
local _ = require(profileQRCode.Analytics.useAnalytics)

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: useEffectOnce (ref), eventNamesModule (ref)
	useEffectOnce(function() --[[ line: 10 ]]
		-- upvalues: p0 (ref), eventNamesModule (copy)
		p0.fireEvent(eventNamesModule.QRPageLoadFailed)
	end, p1)
end