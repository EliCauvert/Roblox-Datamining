local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local reactModule = require(socialUpsell.Parent.React)
local getAgeVerifiedChangedSignalModule = require(socialUpsell.Signals.GetAgeVerifiedChangedSignal)

return function(p1)
	-- upvalues: reactModule (ref), getAgeVerifiedChangedSignalModule (ref)
	reactModule.useEffect(function()
		-- upvalues: getAgeVerifiedChangedSignalModule (copy), p1 (ref)
		local var1 = getAgeVerifiedChangedSignalModule()
		
		if p1 then
			var1:connect(p1)
		end
		return function() end
	end, { p1 })
	
	return nil
end