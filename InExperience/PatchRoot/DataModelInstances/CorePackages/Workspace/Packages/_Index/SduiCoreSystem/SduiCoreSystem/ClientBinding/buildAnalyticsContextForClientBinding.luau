local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.Signals)
local _ = require(parent.UnifiedLogging)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local fFlagSduiImprovedErrorDimensions = require(parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local t = {}
local t_1 = {
	__index = function(p0, p1)
		return if p1 == "analyticsData" then p0.getAnalyticsDataSnapshot() elseif p1 == "ancestorAnalyticsData" then p0.getAncestorAnalyticsDataSnapshot() else nil
	end
}

return function(p2, p3, p4, p5)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), t (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), cryoModule (ref), t_1 (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p5.currentComponentType
		currentParserName = p5.currentParserName
	end
	local var6 = nil
	local t_2 = {
		getAnalyticsDataSnapshot = function()
			-- upvalues: p2 (ref), t (copy), p3 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), p5 (ref), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), var6 (write), cryoModule (copy)
			local cloned = table.clone(p2 or t)
			
			if p3 then
				xpcall(function()
					-- upvalues: p3 (copy), cloned (ref)
					for i, v in p3 do
						cloned[i] = v(false).data
					end
				end, function(p6)
					-- upvalues: sduiLoggerModule (copy), sduiErrorsModule (copy), p5 (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (copy), currentParserName (copy)
					sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToComputeAnalyticsData, {
						message = p6,
						name = p5.debugName,
						componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
						parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
					}, p5.appPage)
				end)
			end
			return if var6 then cryoModule.Dictionary.join(cloned, var6) else cloned
		end,
		getAncestorAnalyticsDataSnapshot = function()
			-- upvalues: p4 (ref), t (copy), cryoModule (copy)
			return if p4 then cryoModule.Dictionary.join(p4.ancestorAnalyticsData or t, p4.analyticsData or t) else t
		end,
		setLocalAnalyticsData = function(value)
			-- upvalues: var6 (write)
			var6 = value
		end,
		getCollectionData = function()
			-- upvalues: p4 (ref)
			return if p4 and p4.getCollectionData then p4.getCollectionData() else nil
		end
	}
	setmetatable(t_2, t_1)
	
	return t_2
end