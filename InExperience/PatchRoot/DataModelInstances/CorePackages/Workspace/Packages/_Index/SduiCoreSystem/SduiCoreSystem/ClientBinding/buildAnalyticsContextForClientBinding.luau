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
	__index = function(p1, p2)
		return if p2 == "analyticsData" then p1.getAnalyticsDataSnapshot() elseif p2 == "ancestorAnalyticsData" then p1.getAncestorAnalyticsDataSnapshot() else nil
	end
}

return function(p1, p2, p3, p4)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), t (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), cryoModule (ref), t_1 (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p4.currentComponentType
		currentParserName = p4.currentParserName
	end
	local var1 = nil
	local t_2 = {
		getAnalyticsDataSnapshot = function()
			-- upvalues: p1 (ref), t (copy), p2 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), p4 (ref), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), var1 (write), cryoModule (copy)
			local cloned = table.clone(p1 or t)
			
			if p2 then
				xpcall(function()
					-- upvalues: p2 (copy), cloned (ref)
					for i, v in p2 do
						cloned[i] = v(false).data
					end
				end, function(p5)
					-- upvalues: sduiLoggerModule (copy), sduiErrorsModule (copy), p4 (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (copy), currentParserName (copy)
					sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToComputeAnalyticsData, {
						message = p5,
						name = p4.debugName,
						componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
						parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
					}, p4.appPage)
				end)
			end
			return if var1 then cryoModule.Dictionary.join(cloned, var1) else cloned
		end,
		getAncestorAnalyticsDataSnapshot = function()
			-- upvalues: p3 (ref), t (copy), cryoModule (copy)
			return if p3 then cryoModule.Dictionary.join(p3.ancestorAnalyticsData or t, p3.analyticsData or t) else t
		end,
		setLocalAnalyticsData = function(value)
			-- upvalues: var1 (write)
			var1 = value
		end,
		getCollectionData = function()
			-- upvalues: p3 (ref)
			return if p3 and p3.getCollectionData then p3.getCollectionData() else nil
		end
	}
	setmetatable(t_2, t_1)
	
	return t_2
end