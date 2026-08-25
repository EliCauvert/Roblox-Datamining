local parent = script.Parent.Parent
local runService = game:GetService("RunService")
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local t = {}
t.__index = t
local var4 = tModule.tuple(tModule.callback, tModule.optional(tModule.strictInterface({
	queueTimeLimit = tModule.optional(tModule.numberPositive),
	queueErrorLimit = tModule.optional(tModule.numberPositive),
	queueKeyLimit = tModule.optional(tModule.numberPositive)
})))

function t.new(p0, p1)
	-- upvalues: var4 (ref), t (ref)
	assert(var4(p0, p1))
	p1 = p1 or {}
	local t_1 = {
		_totalErrorCount = 0,
		_totalKeyCount = 0,
		_runningTime = 0,
		_renderSteppedConnection = nil,
		_reportMethod = p0,
		_queueTimeLimit = p1.queueTimeLimit or 30,
		_queueErrorLimit = p1.queueErrorLimit or 30,
		_queueKeyLimit = p1.queueKeyLimit or 10,
		_errors = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:hasError(p2)
	return type(p2) == "string" and p2 ~= "" and self._errors[p2] ~= nil
end

function t:addError(p3, p4)
	if type(p3) ~= "string" or p3 == "" then return end
	if self._errors[p3] then
		self._errors[p3].count += 1
	else
		self._errors[p3] = { count = 1, data = p4 }
		self._totalKeyCount += 1
	end
	self._totalErrorCount += 1
	
	if self:isReadyToReport() then
		self:reportAllErrors()
	end
end

function t:isReadyToReport()
	return if self._queueKeyLimit > self._totalKeyCount then if self._queueErrorLimit > self._totalErrorCount then self._totalErrorCount > 0 and self._queueTimeLimit <= self._runningTime else true else true
end

function t:reportAllErrors()
	-- upvalues: cryoModule (ref)
	local var7 = cryoModule.Dictionary.join(self._errors, {})
	self._errors = {}
	self._totalErrorCount = 0
	self._totalKeyCount = 0
	self._runningTime = 0
	
	for i, v in pairs(var7) do
		self._reportMethod(i, v.data, v.count)
	end
end

function t:_onRenderStep(p5)
	self._runningTime += p5
	
	if self:isReadyToReport() then
		self:reportAllErrors()
	end
end

function t:startTimer()
	-- upvalues: runService (ref)
	if self._renderSteppedConnection == nil then
		self._runningTime = 0
		self._renderSteppedConnection = runService.renderStepped:Connect(function(p6)
			-- upvalues: self (ref)
			self:_onRenderStep(p6)
		end)
	end
end

function t:stopTimer()
	if self._renderSteppedConnection ~= nil then
		self._renderSteppedConnection:Disconnect()
		self._runningTime = 0
		self._renderSteppedConnection = nil
	end
end

return t