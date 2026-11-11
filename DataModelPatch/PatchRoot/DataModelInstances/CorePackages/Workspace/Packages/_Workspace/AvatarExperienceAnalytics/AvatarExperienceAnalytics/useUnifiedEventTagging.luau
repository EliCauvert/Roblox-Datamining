local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local AddUnifiedEventLoggingModule = require(script.Parent.addUnifiedEventLogging)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

return function(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), UnifiedEventLogConstantsModule (copy), AddUnifiedEventLoggingModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UnifiedEventLogConstantsModule (upval), p1 (copy)
		return CryoModule.Dictionary.join({
			hasDeferredActions = true,
			sessionTagName = UnifiedEventLogConstantsModule.L2_SESSION_TAG_NAME
		}, p1.options or {})
	end, { p1.options })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), AddUnifiedEventLoggingModule (upval), UseMemoResult (copy)
		if p1.isReady ~= false then
			AddUnifiedEventLoggingModule(p1.ref, p1.payload, UseMemoResult)
			
			return
		end
	end, { p1.ref, p1.payload, p1.isReady, UseMemoResult })
end