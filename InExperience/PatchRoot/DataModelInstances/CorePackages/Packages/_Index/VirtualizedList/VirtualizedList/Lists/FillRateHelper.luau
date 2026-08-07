local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local console = luauPolyfillModule.console
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local t = {}
t.__index = t

function t.new() --[[ line: 34 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.any_blank_count = 0
	tbl.any_blank_ms = 0
	tbl.any_blank_speed_sum = 0
	tbl.mostly_blank_count = 0
	tbl.mostly_blank_ms = 0
	tbl.pixels_blank = 0
	tbl.pixels_sampled = 0
	tbl.pixels_scrolled = 0
	tbl.total_time_spent = 0
	tbl.sample_count = 0
	
	return tbl
end

local t_1 = {}
local var3 = 10
local var4 = nil
local t_2 = {}
t_2.__index = t_2

function t_2.new(p0) --[[ line: 98 ]]
	-- upvalues: t_2 (ref), t (ref), var4 (write)
	local tbl = setmetatable({}, t_2)
	tbl._anyBlankStartTime = nil
	tbl._enabled = false
	tbl._info = t.new()
	tbl._mostlyBlankStartTime = nil
	tbl._samplesStartTime = nil
	tbl._getFrameMetrics = p0
	
	if var4 then
		tbl._enabled = math.random() < var4
	else
		tbl._enabled = math.random() < 0
	end
	tbl:_resetData()
	
	return tbl
end

function t_2.addListener(p1) --[[ line: 115 ]]
	-- upvalues: var4 (write), console (ref), t_1 (write), array (ref)
	if var4 == nil then
		console.warn("Call `FillRateHelper.setSampleRate` before `addListener`.")
	end
	table.insert(t_1, p1)
	
	return {
		remove = function() --[[ line: 121 ]]
			-- upvalues: t_1 (copy), array (copy), p1 (ref)
			t_1 = array.filter(t_1, function(p2) --[[ line: 122 ]]
				-- upvalues: p1 (copy)
				return p1 ~= p2
			end)
		end
	}
end

function t_2.setSampleRate(value) --[[ line: 129 ]]
	-- upvalues: var4 (write)
	var4 = value
end

function t_2.setMinSampleCount(a) --[[ line: 133 ]]
	-- upvalues: var3 (write)
	var3 = a
end

function t_2:activate() --[[ line: 137 ]]
	if self._enabled and self._samplesStartTime == nil then
		self._samplesStartTime = os.clock()
	end
end

function t_2:deactivateAndFlush() --[[ line: 146 ]]
	-- upvalues: var3 (write), object (ref), array (ref), t_1 (write)
	if not self._enabled then return end
	local samplesStartTime = self._samplesStartTime
	
	if samplesStartTime == nil then return end
	if self._info.sample_count < var3 then
		self:_resetData()
		
		return
	end
	local var8 = object.assign({}, self._info, { total_time_spent = os.clock() - samplesStartTime })
	array.forEach(t_1, function(p3) --[[ line: 179 ]]
		-- upvalues: var8 (ref)
		return p3(var8)
	end)
	self:_resetData()
end

function t_2:computeBlankness(p4, p5, p6) --[[ line: 185 ]]
	if not self._enabled or p4.getItemCount(p4.data) == 0 or self._samplesStartTime == nil then
		return 0
	end
	local dOffset = p6.dOffset
	local offset = p6.offset
	local velocity = p6.velocity
	local visibleLength = p6.visibleLength
	self._info.sample_count += 1
	self._info.pixels_sampled += math.round(visibleLength)
	self._info.pixels_scrolled += math.round(math.abs(dOffset or 0))
	local rounded = math.round(math.abs(velocity or 0) * 1000)
	local var10 = os.clock() * 1000
	
	if self._anyBlankStartTime ~= nil then
		self._info.any_blank_ms += var10 - self._anyBlankStartTime
	end
	self._anyBlankStartTime = nil
	
	if self._mostlyBlankStartTime ~= nil then
		self._info.mostly_blank_ms += var10 - self._mostlyBlankStartTime
	end
	self._mostlyBlankStartTime = nil
	local var11 = 0
	local first = p5.first
	local frameMetrics = self._getFrameMetrics(first)
	while first <= p5.last and (not frameMetrics or not frameMetrics.inLayout) do
		frameMetrics = self._getFrameMetrics(first)
		first += 1
	end
	if frameMetrics and first > 1 then
		var11 = math.min(visibleLength, math.max(0, frameMetrics.offset - offset))
	end
	local var13 = 0
	local last = p5.last
	local frameMetrics_1 = self._getFrameMetrics(last)
	while p5.first <= last and (not frameMetrics_1 or not frameMetrics_1.inLayout) do
		frameMetrics_1 = self._getFrameMetrics(last)
		last -= 1
	end
	if frameMetrics_1 and last < p4.getItemCount(p4.data) then
		var13 = math.min(visibleLength, math.max(0, offset + visibleLength - (frameMetrics_1.offset + frameMetrics_1.length)))
	end
	local rounded_1 = math.round(var11 + var13)
	local var16 = rounded_1 / visibleLength
	
	if var16 > 0 then
		self._anyBlankStartTime = var10
		self._info.any_blank_speed_sum += rounded
		self._info.any_blank_count += 1
		self._info.pixels_blank += rounded_1
		
		if var16 > 0.5 then
			self._mostlyBlankStartTime = var10
			self._info.mostly_blank_count += 1
			
			return var16
		end
	elseif rounded < 0.01 or math.abs(dOffset or 0) < 1 then
		self:deactivateAndFlush()
	end
	return var16
end

function t_2:enabled() --[[ line: 271 ]]
	return self._enabled
end

function t_2:_resetData() --[[ line: 275 ]]
	-- upvalues: t (ref)
	self._anyBlankStartTime = nil
	self._info = t.new()
	self._mostlyBlankStartTime = nil
	self._samplesStartTime = nil
end

return t_2