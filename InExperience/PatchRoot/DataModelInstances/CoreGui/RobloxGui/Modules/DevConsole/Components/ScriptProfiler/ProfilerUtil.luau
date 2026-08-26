local _ = require(script.Parent.ProfilerDataFormatV2)
local t = {
	getDurations = function(p1, p2)
		if p2 > 0 then
			local var1 = p1.Nodes[p2]
			assert(var1 ~= nil)
			
			return var1.TotalDuration, var1.Duration
		end
		local var2 = 0
		
		for i, v in p1.Categories do
			var2 += p1.Nodes[v.NodeId].TotalDuration
		end
		return var2, 0
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
		return if p3 then p3.IsNative else false
	end,
	getPluginFlag = function(_, p3)
		return if p3 then p3.IsPlugin else false
	end,
	standardizeChildren = function(_, p3)
		return p3 and p3.Children
	end,
	formatSessionLength = function(p3)
		return if p3 then string.format("%02i:%02i:%02i.%04i", p3 / 3600000, p3 / 60000 % 60, p3 / 1000 % 60, p3 % 1000) else nil
	end,
	formatTimer = function(p3)
		return if p3 == nil then "" elseif p3 == 0 then "" elseif p3 >= 60 then string.format("%dm", p3 / 60) else string.format("%ds", p3)
	end,
	formatFrequency = function(p3)
		return if p3 < 1000 then tostring(p3) .. " Hz" else tostring(p3 / 1000) .. " KHz"
	end
}

function t.getSourceLocationString(p3, p4, p5)
	-- upvalues: t (ref)
	local sourceName = t.getSourceName(p3, p4)
	local var3 = if sourceName and #sourceName ~= 0 then sourceName else p5
	local var4 = var3
	local line = t.getLine(p3, p4)
	
	if line and line >= 1 then
		var4 = string.format("%s:%s", var3, tostring(line))
	end
	return var4
end

return t