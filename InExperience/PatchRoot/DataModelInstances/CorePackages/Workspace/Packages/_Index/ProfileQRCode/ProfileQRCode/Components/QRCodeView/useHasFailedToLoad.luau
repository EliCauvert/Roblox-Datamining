local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local EventNamesModule = require(ProfileQRCode.Analytics.EventNames)
local UseEffectOnceFunction = require(ProfileQRCode.Parent.RoactUtils).Hooks.useEffectOnce
local _ = require(ProfileQRCode.Analytics.useAnalytics)

return function(p1, p2) --[[ Line: 9 ]]
	-- upvalues: UseEffectOnceFunction (copy), EventNamesModule (copy)
	UseEffectOnceFunction(function() --[[ Line: 10 ]]
		-- upvalues: p1 (copy), EventNamesModule (upval)
		p1.fireEvent(EventNamesModule.QRPageLoadFailed)
	end, p2)
end