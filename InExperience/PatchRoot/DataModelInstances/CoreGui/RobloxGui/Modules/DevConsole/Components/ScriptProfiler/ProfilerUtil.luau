local _ = require(script.Parent.ProfilerDataFormatV2)
local t = {
	getDurations = function(p0, p1)
		if p1 > 0 then
			local var1 = p0.Nodes[p1]
			assert(var1 ~= nil)
			
			return var1.TotalDuration, var1.Duration
		end
		local var2 = 0
		
		for i, v in p0.Categories do
			var2 += p0.Nodes[v.NodeId].TotalDuration
		end
		return var2, 0
	end,
	getName = function(_, p2)
		return p2 and p2.Name
	end,
	getSourceName = function(_, p3)
		return p3 and p3.Source
	end,
	getLine = function(_, p4)
		return p4 and p4.Line
	end,
	getNativeFlag = function(_, p5)
		return if p5 then p5.IsNative else false
	end,
	getPluginFlag = function(_, p6)
		return if p6 then p6.IsPlugin else false
	end,
	standardizeChildren = function(_, p7)
		return p7 and p7.Children
	end,
	formatSessionLength = function(p8)
		return if p8 then string.format("%02i:%02i:%02i.%04i", p8 / 3600000, p8 / 60000 % 60, p8 / 1000 % 60, p8 % 1000) else nil
	end,
	formatTimer = function(p9)
		return if p9 == nil then "" elseif p9 == 0 then "" elseif p9 >= 60 then string.format("%dm", p9 / 60) else string.format("%ds", p9)
	end,
	formatFrequency = function(p10)
		return if p10 < 1000 then tostring(p10) .. " Hz" else tostring(p10 / 1000) .. " KHz"
	end
}

function t.getSourceLocationString(p11, p12, p13)
	-- upvalues: t (ref)
	local sourceName = t.getSourceName(p11, p12)
	local var4 = if sourceName and #sourceName ~= 0 then sourceName else p13
	local var5 = var4
	local line = t.getLine(p11, p12)
	
	if line and line >= 1 then
		var5 = string.format("%s:%s", var4, tostring(line))
	end
	return var5
end

return t