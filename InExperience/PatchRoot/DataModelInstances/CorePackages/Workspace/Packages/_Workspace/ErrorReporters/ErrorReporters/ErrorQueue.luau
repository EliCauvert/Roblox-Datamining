local Parent = script.Parent.Parent
local RunService = game:GetService("RunService")
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local ErrorQueueModule = {}
ErrorQueueModule.__index = ErrorQueueModule
local TupleResult = TModule.tuple(TModule.callback, TModule.optional(TModule.strictInterface({
	queueTimeLimit = TModule.optional(TModule.numberPositive),
	queueErrorLimit = TModule.optional(TModule.numberPositive),
	queueKeyLimit = TModule.optional(TModule.numberPositive),
	flushImmediately = TModule.optional(TModule.boolean)
})))

function ErrorQueueModule.new(_reportMethod, p1) --[[ Line: 57 ]]
	-- upvalues: TupleResult (copy), ErrorQueueModule (copy)
	assert(TupleResult(_reportMethod, p1))
	local P1 = p1 or {}
	local config = {
		_totalErrorCount = 0,
		_totalKeyCount = 0,
		_runningTime = 0,
		_renderSteppedConnection = nil,
		_reportMethod = _reportMethod,
		_queueTimeLimit = P1.queueTimeLimit or 30,
		_queueErrorLimit = P1.queueErrorLimit or 30,
		_queueKeyLimit = P1.queueKeyLimit or 10,
		_flushImmediately = P1.flushImmediately == true,
		_errors = {}
	}
	setmetatable(config, ErrorQueueModule)
	
	return config
end

function ErrorQueueModule:hasError(p1): boolean --[[ Line: 84 ]]
	return type(p1) == "string" and p1 ~= "" and self._errors[p1] ~= nil
end

function ErrorQueueModule:addError(p1, Data) --[[ Line: 92 ]]
	if type(p1) ~= "string" or p1 == "" then return end
	if self._errors[p1] then
		self._errors[p1].count += 1
	else
		self._errors[p1] = { count = 1, data = Data }
		self._totalKeyCount += 1
	end
	self._totalErrorCount += 1
	
	if self:isReadyToReport() then
		self:reportAllErrors()
	end
end

function ErrorQueueModule:isReadyToReport(): boolean --[[ Line: 116 ]]
	return self._queueKeyLimit <= self._totalKeyCount or (self._queueErrorLimit <= self._totalErrorCount or self._totalErrorCount > 0 and self._queueTimeLimit <= self._runningTime)
end

function ErrorQueueModule:reportAllErrors() --[[ Line: 122 ]]
	-- upvalues: CryoModule (copy)
	local JoinResult = CryoModule.Dictionary.join(self._errors, {})
	self._errors = {}
	self._totalErrorCount = 0
	self._totalKeyCount = 0
	self._runningTime = 0
	
	for i, value in pairs(JoinResult) do
		self._reportMethod(i, value.data, value.count)
	end
end

function ErrorQueueModule:_onRenderStep(p1) --[[ Line: 137 ]]
	self._runningTime += p1
	
	if self:isReadyToReport() then
		self:reportAllErrors()
	end
end

function ErrorQueueModule:startTimer() --[[ Line: 145 ]]
	-- upvalues: RunService (copy)
	if self._renderSteppedConnection == nil then
		self._runningTime = if self._flushImmediately then self._queueTimeLimit else 0
		self._renderSteppedConnection = RunService.renderStepped:Connect(function(p1) --[[ Line: 149 ]]
			-- upvalues: self (copy)
			self:_onRenderStep(p1)
		end)
	end
end

function ErrorQueueModule:stopTimer() --[[ Line: 155 ]]
	if self._renderSteppedConnection ~= nil then
		self._renderSteppedConnection:Disconnect()
		self._runningTime = 0
		self._renderSteppedConnection = nil
	end
end

return ErrorQueueModule