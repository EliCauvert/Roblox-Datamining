local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.Signals)
local _ = require(Parent.UnifiedLogging)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local _ = require(SduiCoreSystem.SduiComponentType)
local t = {}
local config = {
	__index = function(p1, p2) --[[ Line: 31 ]]
		return if p2 == "analyticsData" then p1.getAnalyticsDataSnapshot() elseif p2 == "ancestorAnalyticsData" then p1.getAncestorAnalyticsDataSnapshot() else nil
	end
}

return function(p1, p2, p3, p4) --[[ Line: 64 | Named "buildAnalyticsContextForClientBinding" ]]
	-- upvalues: t (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), CryoModule (copy), config (copy)
	local CurrentComponentType = p4.currentComponentType
	local CurrentParserName = p4.currentParserName
	local LocalAnalyticsData = nil
	local config1 = {
		getAnalyticsDataSnapshot = function() --[[ Line: 85 ]]
			-- upvalues: p1 (copy), t (upval), p2 (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), p4 (copy), CurrentComponentType (copy), CurrentParserName (copy), LocalAnalyticsData (ref), CryoModule (upval)
			local Copy = table.clone(p1 or t)
			
			if p2 then
				xpcall(function() --[[ Line: 88 ]]
					-- upvalues: p2 (upval), Copy (copy)
					for i, value in p2 do
						Copy[i] = value(false).data
					end
				end, function(Err) --[[ Line: 92 ]]
					-- upvalues: SduiLoggerModule (upval), SduiErrorsModule (upval), p4 (upval), CurrentComponentType (upval), CurrentParserName (upval)
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToComputeAnalyticsData, {
						message = Err,
						name = p4.debugName,
						componentType = CurrentComponentType,
						parserName = CurrentParserName
					}, p4.appPage)
				end)
			end
			return if LocalAnalyticsData then CryoModule.Dictionary.join(Copy, LocalAnalyticsData) else Copy
		end,
		getAncestorAnalyticsDataSnapshot = function() --[[ Line: 112 ]]
			-- upvalues: p3 (copy), t (upval), CryoModule (upval)
			return if p3 then CryoModule.Dictionary.join(p3.ancestorAnalyticsData or t, p3.analyticsData or t) else t
		end,
		setLocalAnalyticsData = function(Value) --[[ Line: 129 ]]
			-- upvalues: LocalAnalyticsData (ref)
			LocalAnalyticsData = Value
		end,
		getCollectionData = function() --[[ Line: 141 ]]
			-- upvalues: p3 (copy)
			return if p3 and p3.getCollectionData then p3.getCollectionData() else nil
		end
	}
	setmetatable(config1, config)
	
	return config1
end