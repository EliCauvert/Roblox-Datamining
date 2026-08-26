local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local addUnifiedEventLoggingModule = require(script.Parent.addUnifiedEventLogging)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

return function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref), unifiedEventLogConstantsModule (ref), addUnifiedEventLoggingModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), unifiedEventLogConstantsModule (copy), p1 (ref)
		return cryoModule.Dictionary.join({
			hasDeferredActions = true,
			sessionTagName = unifiedEventLogConstantsModule.L2_SESSION_TAG_NAME
		}, p1.options or {})
	end, { p1.options })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), addUnifiedEventLoggingModule (copy), var1 (ref)
		if p1.isReady == false then
			return
		end
		addUnifiedEventLoggingModule(p1.ref, p1.payload, var1)
	end, { p1.ref, p1.payload, p1.isReady, var1 })
end