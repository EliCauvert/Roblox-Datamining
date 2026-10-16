local CoreGui = game:GetService("CoreGui")
local StatsUtilsModule = require(CoreGui.RobloxGui.Modules.Stats.StatsUtils)
local StatsAggregatorModule = require(CoreGui.RobloxGui.Modules.Stats.StatsAggregator)
local GetFFlagLazyPerfStatsInitModule = require(CoreGui.RobloxGui.Modules.Flags.GetFFlagLazyPerfStatsInit)
local StatsAggregatorManager = {}
StatsAggregatorManager.__index = StatsAggregatorManager
StatsAggregatorManager.SecondsBetweenUpdate = 1
StatsAggregatorManager.NumSamplesToKeep = 20
local NewResult = nil

function StatsAggregatorManager.getSingleton() --[[ Line: 26 ]]
	-- upvalues: NewResult (ref), StatsAggregatorManager (copy), GetFFlagLazyPerfStatsInitModule (copy)
	if NewResult == nil then
		NewResult = StatsAggregatorManager.__new()
		
		if not GetFFlagLazyPerfStatsInitModule() then
			NewResult:StartListening()
		end
	end
	return NewResult
end

function StatsAggregatorManager.__new() --[[ Line: 36 ]]
	-- upvalues: StatsAggregatorManager (copy), StatsUtilsModule (copy), StatsAggregatorModule (copy)
	local t = {}
	setmetatable(t, StatsAggregatorManager)
	t._statsAggregators = {}
	
	for _, allStatType in ipairs(StatsUtilsModule.AllStatTypes) do
		t._statsAggregators[allStatType] = StatsAggregatorModule.new(allStatType, StatsAggregatorManager.NumSamplesToKeep, StatsAggregatorManager.SecondsBetweenUpdate)
	end
	return t
end

function StatsAggregatorManager.StartListening(p1) --[[ Line: 53 ]]
	for _, statsAggregator in pairs(p1._statsAggregators) do
		statsAggregator:StartListening()
	end
end

function StatsAggregatorManager.StopListening(p2) --[[ Line: 59 ]]
	for _, statsAggregator in pairs(p2._statsAggregators) do
		statsAggregator:StopListening()
	end
end

function StatsAggregatorManager.GetAggregator(p3, p4) --[[ Line: 65 ]]
	return p3._statsAggregators[p4]
end

return StatsAggregatorManager