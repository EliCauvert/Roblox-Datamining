local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local ReactModule = require(SocialUpsell.Parent.React)
local GetAgeVerifiedChangedSignalModule = require(SocialUpsell.Signals.GetAgeVerifiedChangedSignal)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: ReactModule (copy), GetAgeVerifiedChangedSignalModule (copy)
	ReactModule.useEffect(function() --[[ Line: 9 ]]
		-- upvalues: GetAgeVerifiedChangedSignalModule (upval), p1 (copy)
		local AgeVerifiedChangedSignalModule = GetAgeVerifiedChangedSignalModule()
		
		if p1 then
			AgeVerifiedChangedSignalModule:connect(p1)
		end
		return function() --[[ Line: 15 ]] end
	end, { p1 })
	
	return nil
end