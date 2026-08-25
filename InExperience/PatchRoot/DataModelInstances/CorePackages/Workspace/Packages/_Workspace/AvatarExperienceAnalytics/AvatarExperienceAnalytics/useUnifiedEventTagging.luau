local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local addUnifiedEventLoggingModule = require(script.Parent.addUnifiedEventLogging)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

return function(p0)
	-- upvalues: reactModule (ref), cryoModule (ref), unifiedEventLogConstantsModule (ref), addUnifiedEventLoggingModule (ref)
	local var4 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), unifiedEventLogConstantsModule (copy), p0 (ref)
		return cryoModule.Dictionary.join({
			hasDeferredActions = true,
			sessionTagName = unifiedEventLogConstantsModule.L2_SESSION_TAG_NAME
		}, p0.options or {})
	end, { p0.options })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), addUnifiedEventLoggingModule (copy), var4 (ref)
		if p0.isReady == false then
			return
		end
		addUnifiedEventLoggingModule(p0.ref, p0.payload, var4)
	end, { p0.ref, p0.payload, p0.isReady, var4 })
end