local parent = script.Parent.Parent
local runService = game:GetService("RunService")
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local t = {}
t.__index = t
local var1 = tModule.tuple(tModule.callback, tModule.optional(tModule.strictInterface({
	queueTimeLimit = tModule.optional(tModule.numberPositive),
	queueErrorLimit = tModule.optional(tModule.numberPositive),
	queueKeyLimit = tModule.optional(tModule.numberPositive)
})))

function t.new(p1, p2)
	-- upvalues: var1 (ref), t (ref)
	assert(var1(p1, p2))
	p2 = p2 or {}
	local t_1 = {
		_totalErrorCount = 0,
		_totalKeyCount = 0,
		_runningTime = 0,
		_renderSteppedConnection = nil,
		_reportMethod = p1,
		_queueTimeLimit = p2.queueTimeLimit or 30,
		_queueErrorLimit = p2.queueErrorLimit or 30,
		_queueKeyLimit = p2.queueKeyLimit or 10,
		_errors = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:hasError(p1)
	return type(p1) == "string" and p1 ~= "" and self._errors[p1] ~= nil
end

function t:addError(p1, p2)
	if type(p1) ~= "string" or p1 == "" then return end
	if self._errors[p1] then
		self._errors[p1].count += 1
	else
		self._errors[p1] = { count = 1, data = p2 }
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
	local var2 = cryoModule.Dictionary.join(self._errors, {})
	self._errors = {}
	self._totalErrorCount = 0
	self._totalKeyCount = 0
	self._runningTime = 0
	
	for i, v in pairs(var2) do
		self._reportMethod(i, v.data, v.count)
	end
end

function t:_onRenderStep(p1)
	self._runningTime += p1
	
	if self:isReadyToReport() then
		self:reportAllErrors()
	end
end

function t:startTimer()
	-- upvalues: runService (ref)
	if self._renderSteppedConnection == nil then
		self._runningTime = 0
		self._renderSteppedConnection = runService.renderStepped:Connect(function(p1)
			-- upvalues: self (ref)
			self:_onRenderStep(p1)
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