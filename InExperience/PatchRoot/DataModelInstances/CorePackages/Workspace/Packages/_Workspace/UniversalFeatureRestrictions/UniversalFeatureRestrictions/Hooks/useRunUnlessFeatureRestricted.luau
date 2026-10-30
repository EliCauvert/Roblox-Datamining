local UniversalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local ReactModule = require(UniversalFeatureRestrictions.Parent.React)
local _ = require(UniversalFeatureRestrictions.Common.AbuseVector)
local RunUnlessFeatureRestrictedModule = require(UniversalFeatureRestrictions.Utils.runUnlessFeatureRestricted)
local _ = require(UniversalFeatureRestrictions.Utils.showFeatureRestrictionDirect)

return function(p1)
	-- upvalues: ReactModule (copy), RunUnlessFeatureRestrictedModule (copy)
	local Settled, Settled2 = ReactModule.useState("Settled")
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = true
		
		return function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current = false
		end
	end, {})
	
	return ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), RunUnlessFeatureRestrictedModule (upval), p1 (copy), UseRefResult1 (copy), Settled2 (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			local OnRestrictedFunction = p2.onRestricted
			RunUnlessFeatureRestrictedModule(p1, {
				onProceed = function(p3)
					-- upvalues: UseRefResult1 (upval), p2 (copy)
					if UseRefResult1.current then
						p2.onProceed(p3)
					end
				end,
				onRestricted = function(p3)
					-- upvalues: UseRefResult1 (upval), OnRestrictedFunction (copy)
					if UseRefResult1.current and OnRestrictedFunction then
						OnRestrictedFunction(p3)
					end
				end,
				dialogOptions = p2.dialogOptions,
				timeoutSeconds = p2.timeoutSeconds,
				onPhaseChanged = function(p3)
					-- upvalues: UseRefResult (upval), UseRefResult1 (upval), Settled2 (upval)
					if p3 == "Settled" then
						UseRefResult.current = false
					end
					if UseRefResult1.current then
						Settled2(p3)
					end
				end
			})
			
			return
		end
	end, { p1 }), Settled == "Checking" or Settled == "Acknowledging"
end