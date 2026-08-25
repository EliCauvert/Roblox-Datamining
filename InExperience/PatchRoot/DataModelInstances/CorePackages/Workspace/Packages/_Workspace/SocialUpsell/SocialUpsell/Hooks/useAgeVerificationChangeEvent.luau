local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local reactModule = require(socialUpsell.Parent.React)
local getAgeVerifiedChangedSignalModule = require(socialUpsell.Signals.GetAgeVerifiedChangedSignal)

return function(p0)
	-- upvalues: reactModule (ref), getAgeVerifiedChangedSignalModule (ref)
	reactModule.useEffect(function()
		-- upvalues: getAgeVerifiedChangedSignalModule (copy), p0 (ref)
		local var3 = getAgeVerifiedChangedSignalModule()
		
		if p0 then
			var3:connect(p0)
		end
		return function() end
	end, { p0 })
	
	return nil
end