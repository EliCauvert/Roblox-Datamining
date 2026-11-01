local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local AddUnifiedEventLoggingModule = require(script.Parent.addUnifiedEventLogging)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local _ = require(script.Parent.Generated.UnifiedEventTypes)
local FFlagAXUnifiedEventStrictPayloads = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedEventStrictPayloads
local config = {
	hasDeferredActions = true,
	sessionTagName = UnifiedEventLogConstantsModule.L2_SESSION_TAG_NAME
}

return function(p1)
	-- upvalues: ReactModule (copy), FFlagAXUnifiedEventStrictPayloads (copy), config (copy), CryoModule (copy), UnifiedEventLogConstantsModule (copy), AddUnifiedEventLoggingModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagAXUnifiedEventStrictPayloads (upval), p1 (copy), config (upval), CryoModule (upval), UnifiedEventLogConstantsModule (upval)
		if FFlagAXUnifiedEventStrictPayloads then
			local Options = p1.options
			
			return if Options == nil then config else {
				hasDeferredActions = if Options.hasDeferredActions == nil then config.hasDeferredActions else Options.hasDeferredActions,
				sessionTagName = if Options.sessionTagName == nil then config.sessionTagName else Options.sessionTagName,
				isSelected = Options.isSelected,
				skipImpressionDetection = Options.skipImpressionDetection,
				skipTapDetection = Options.skipTapDetection
			}
		else
			return CryoModule.Dictionary.join({
				hasDeferredActions = true,
				sessionTagName = UnifiedEventLogConstantsModule.L2_SESSION_TAG_NAME
			}, p1.options or {})
		end
	end, { p1.options })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), AddUnifiedEventLoggingModule (upval), UseMemoResult (copy)
		if p1.isReady ~= false then
			AddUnifiedEventLoggingModule(p1.ref, p1.payload, UseMemoResult)
			
			return
		end
	end, { p1.ref, p1.payload, p1.isReady, UseMemoResult })
end