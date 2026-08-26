local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local console = luauPolyfillModule.console
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local t = {}
t.__index = t

function t.new()
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
local var1 = 10
local var2 = nil
local t_2 = {}
t_2.__index = t_2

function t_2.new(p1)
	-- upvalues: t_2 (ref), t (ref), var2 (write)
	local tbl = setmetatable({}, t_2)
	tbl._anyBlankStartTime = nil
	tbl._enabled = false
	tbl._info = t.new()
	tbl._mostlyBlankStartTime = nil
	tbl._samplesStartTime = nil
	tbl._getFrameMetrics = p1
	
	if var2 then
		tbl._enabled = math.random() < var2
	else
		tbl._enabled = math.random() < 0
	end
	tbl:_resetData()
	
	return tbl
end

function t_2.addListener(p1)
	-- upvalues: var2 (write), console (ref), t_1 (write), array (ref)
	if var2 == nil then
		console.warn("Call `FillRateHelper.setSampleRate` before `addListener`.")
	end
	table.insert(t_1, p1)
	
	return {
		remove = function()
			-- upvalues: t_1 (copy), array (copy), p1 (ref)
			t_1 = array.filter(t_1, function(p2)
				-- upvalues: p1 (copy)
				return p1 ~= p2
			end)
		end
	}
end

function t_2.setSampleRate(value)
	-- upvalues: var2 (write)
	var2 = value
end

function t_2.setMinSampleCount(a)
	-- upvalues: var1 (write)
	var1 = a
end

function t_2:activate()
	if self._enabled and self._samplesStartTime == nil then
		self._samplesStartTime = os.clock()
	end
end

function t_2:deactivateAndFlush()
	-- upvalues: var1 (write), object (ref), array (ref), t_1 (write)
	if not self._enabled then return end
	local samplesStartTime = self._samplesStartTime
	
	if samplesStartTime == nil then return end
	if self._info.sample_count < var1 then
		self:_resetData()
		
		return
	end
	local var3 = object.assign({}, self._info, { total_time_spent = os.clock() - samplesStartTime })
	array.forEach(t_1, function(p1)
		-- upvalues: var3 (ref)
		return p1(var3)
	end)
	self:_resetData()
end

function t_2:computeBlankness(p1, p2, p3)
	if not self._enabled or p1.getItemCount(p1.data) == 0 or self._samplesStartTime == nil then
		return 0
	end
	local dOffset = p3.dOffset
	local offset = p3.offset
	local velocity = p3.velocity
	local visibleLength = p3.visibleLength
	self._info.sample_count += 1
	self._info.pixels_sampled += math.round(visibleLength)
	self._info.pixels_scrolled += math.round(math.abs(dOffset or 0))
	local rounded = math.round(math.abs(velocity or 0) * 1000)
	local var3 = os.clock() * 1000
	
	if self._anyBlankStartTime ~= nil then
		self._info.any_blank_ms += var3 - self._anyBlankStartTime
	end
	self._anyBlankStartTime = nil
	
	if self._mostlyBlankStartTime ~= nil then
		self._info.mostly_blank_ms += var3 - self._mostlyBlankStartTime
	end
	self._mostlyBlankStartTime = nil
	local var4 = 0
	local first = p2.first
	local frameMetrics = self._getFrameMetrics(first)
	while first <= p2.last and (not frameMetrics or not frameMetrics.inLayout) do
		frameMetrics = self._getFrameMetrics(first)
		first += 1
	end
	if frameMetrics and first > 1 then
		var4 = math.min(visibleLength, math.max(0, frameMetrics.offset - offset))
	end
	local var5 = 0
	local last = p2.last
	local frameMetrics_1 = self._getFrameMetrics(last)
	while p2.first <= last and (not frameMetrics_1 or not frameMetrics_1.inLayout) do
		frameMetrics_1 = self._getFrameMetrics(last)
		last -= 1
	end
	if frameMetrics_1 and last < p1.getItemCount(p1.data) then
		var5 = math.min(visibleLength, math.max(0, offset + visibleLength - (frameMetrics_1.offset + frameMetrics_1.length)))
	end
	local rounded_1 = math.round(var4 + var5)
	local var6 = rounded_1 / visibleLength
	
	if var6 > 0 then
		self._anyBlankStartTime = var3
		self._info.any_blank_speed_sum += rounded
		self._info.any_blank_count += 1
		self._info.pixels_blank += rounded_1
		
		if var6 > 0.5 then
			self._mostlyBlankStartTime = var3
			self._info.mostly_blank_count += 1
			
			return var6
		end
	elseif rounded < 0.01 or math.abs(dOffset or 0) < 1 then
		self:deactivateAndFlush()
	end
	return var6
end

function t_2:enabled()
	return self._enabled
end

function t_2:_resetData()
	-- upvalues: t (ref)
	self._anyBlankStartTime = nil
	self._info = t.new()
	self._mostlyBlankStartTime = nil
	self._samplesStartTime = nil
end

return t_2