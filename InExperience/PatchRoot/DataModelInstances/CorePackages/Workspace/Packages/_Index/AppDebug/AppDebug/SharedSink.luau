local SharedSinkModule = {}
SharedSinkModule.__index = SharedSinkModule

function SharedSinkModule.new(Log) --[[ Line: 14 ]]
	-- upvalues: SharedSinkModule (copy)
	local config = { lastContext = nil, log = Log }
	setmetatable(config, SharedSinkModule)
	
	return config
end

function SharedSinkModule.newSink(p1, MaxLevel) --[[ Line: 23 ]]
	return {
		maxLevel = MaxLevel,
		log = function(p2, p3, LastContext) --[[ Line: 26 ]]
			-- upvalues: p1 (copy)
			if LastContext ~= p1.lastContext then
				p1.lastContext = LastContext
				p1.log(p2, p3, LastContext)
			end
		end
	}
end

return SharedSinkModule