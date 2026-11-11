local DiagEventTypes = require(script:FindFirstAncestor("SocialLuaAnalytics").Analytics.Enums).DiagEventTypes
local _ = require(script.Parent.Parent.Types)

local function _(Callback, p1)
	return if type(Callback) == "function" then Callback(p1) else Callback
end

return function()
	-- upvalues: DiagEventTypes (copy)
	return function(p1, p2)
		-- upvalues: DiagEventTypes (upval)
		local NameFunction = p1.name
		local NameResult = if type(NameFunction) == "function" then NameFunction(p2) else NameFunction
		local Type = p1.type or DiagEventTypes.Counter
		local StatsResult = nil
		
		if Type == DiagEventTypes.Stats then
			local StatsFunction = p1.stats
			StatsResult = (if type(StatsFunction) == "function" then StatsFunction(p2) else StatsFunction) or 0
		else
			local CountFunction = p1.count
			StatsResult = (if type(CountFunction) == "function" then CountFunction(p2) else CountFunction) or 1
		end
		return {
			type = Type,
			name = NameResult,
			value = StatsResult,
			platformSpecificity = p1.platformSpecificity
		}
	end
end