local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local reactModule = require(socialUpsell.Parent.React)
local getAgeVerifiedChangedSignalModule = require(socialUpsell.Signals.GetAgeVerifiedChangedSignal)

return function(p0) --[[ line: 8 ]]
	-- upvalues: reactModule (ref), getAgeVerifiedChangedSignalModule (ref)
	reactModule.useEffect(function() --[[ line: 9 ]]
		-- upvalues: getAgeVerifiedChangedSignalModule (copy), p0 (ref)
		local var3 = getAgeVerifiedChangedSignalModule()
		
		if p0 then
			var3:connect(p0)
		end
		return function() --[[ line: 15 ]] end
	end, { p0 })
	
	return nil
end