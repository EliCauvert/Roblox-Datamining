local _ = require(script.Parent.ProfilerDataFormatV2)
local ProfilerUtil = {
	getDurations = function(p1, p2: number)
		if p2 > 0 then
			local Node = p1.Nodes[p2]
			assert(Node ~= nil)
			
			return Node.TotalDuration, Node.Duration
		end
		local NewTotalDuration = 0
		
		for _, category in p1.Categories do
			NewTotalDuration += p1.Nodes[category.NodeId].TotalDuration
		end
		return NewTotalDuration, 0
	end,
	getName = function(_, p3)
		return p3 and p3.Name
	end,
	getSourceName = function(_, p3)
		return p3 and p3.Source
	end,
	getLine = function(_, p3)
		return p3 and p3.Line
	end,
	getNativeFlag = function(_, p3)
		return p3 and p3.IsNative or false
	end,
	getPluginFlag = function(_, p3)
		return p3 and p3.IsPlugin or false
	end,
	standardizeChildren = function(_, p3)
		return p3 and p3.Children
	end,
	formatSessionLength = function(p3: number)
		return if p3 then string.format("%02i:%02i:%02i.%04i", p3 / 3600000, p3 / 60000 % 60, p3 / 1000 % 60, p3 % 1000) else nil
	end,
	formatTimer = function(p3: number): string
		return if p3 == nil then "" elseif p3 == 0 then "" elseif p3 >= 60 then string.format("%dm", p3 / 60) else string.format("%ds", p3)
	end,
	formatFrequency = function(p3: number): string
		return if p3 < 1000 then tostring(p3) .. " Hz" else tostring(p3 / 1000) .. " KHz"
	end
}

function ProfilerUtil.getSourceLocationString(p3, p4, p5): string
	-- upvalues: ProfilerUtil (copy)
	local SourceName = ProfilerUtil.getSourceName(p3, p4)
	local SourceName1 = if SourceName and #SourceName ~= 0 then SourceName else p5
	local Formatted: string = SourceName1
	local Line: number = ProfilerUtil.getLine(p3, p4)
	
	if Line and Line >= 1 then
		Formatted = string.format("%s:%s", SourceName1, (tostring(Line)))
	end
	return Formatted
end

return ProfilerUtil