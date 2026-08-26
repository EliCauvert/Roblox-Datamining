local parent = script:FindFirstAncestor("ErrorReporters").Parent
local runService = game:GetService("RunService")
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local backtraceReportModule = require(script.Parent.BacktraceReport)
local errorQueueModule = require(script.Parent.Parent.ErrorQueue)
local fFlagLuaAppEnableBacktraceSessionInfoModule = require(script.Parent.Flags.FFlagLuaAppEnableBacktraceSessionInfo)
local var1 = runService:IsStudio()
local fIntOldestUAVersionToReportErrorsModule = require(script.Parent.Parent.FIntOldestUAVersionToReportErrors)
local t = {}
t.__index = t
local var2 = tModule.strictInterface({
	httpService = tModule.some(tModule.instanceOf("HttpService"), tModule.interface({
		JSONEncode = tModule.callback,
		JSONDecode = tModule.callback,
		RequestInternal = tModule.callback
	})),
	token = tModule.string,
	processErrorReportMethod = tModule.optional(tModule.callback),
	queueOptions = tModule.optional(tModule.table),
	generateLogMethod = tModule.optional(tModule.callback),
	logIntervalInSeconds = tModule.optional(tModule.numberPositive)
})

function t.new(p1)
	-- upvalues: var2 (ref), var1 (ref), t (ref), errorQueueModule (ref)
	local var3, var4 = var2(p1)
	local t_1 = nil
	
	if var3 then
		t_1 = {
			_isEnabled = true,
			_errorQueue = nil,
			_lastLogTime = 0,
			_httpService = p1.httpService,
			_reportUrl = game:GetFastString("ErrorUploadToBacktraceBaseUrl") .. "token=" .. p0.token,
			_processErrorReportMethod = p1.processErrorReportMethod,
			_sharedAttributes = {},
			_sharedAnnotations = {},
			_generateLogMethod = p1.generateLogMethod,
			_logIntervalInSeconds = p1.logIntervalInSeconds or 60
		}
	elseif var1 or _G.__DEV__ then
		error("invalid arguments for BacktraceReporter: " .. var11)
	else
		t_1 = { _isEnabled = false }
	end
	setmetatable(t_1, t)
	
	if t_1._isEnabled then
		t_1._errorQueue = errorQueueModule.new(function(...)
			-- upvalues: t_1 (write)
			t_1:_reportErrorFromErrorQueue(...)
		end, p1.queueOptions)
		t_1._errorQueue:startTimer()
	end
	return t_1
end

function t.isTooOldToReportErrors(_)
	-- upvalues: runService (ref), fIntOldestUAVersionToReportErrorsModule (ref)
	local var3 = tonumber(string.match(runService:GetRobloxVersion(), ".(%d+)."))
	
	return if var3 then var3 < fIntOldestUAVersionToReportErrorsModule else false
end

function t:sendErrorReport(p1, p2)
	-- upvalues: var1 (ref)
	if not self._isEnabled then return end
	if self:isTooOldToReportErrors() then return end
	if var1 or _G.__DEV__ then
		assert(p1:validate())
	end
	local ok, status = pcall(function()
		-- upvalues: self (ref), p1 (ref)
		return self._httpService:JSONEncode(p1)
	end)
	
	if ok then
		pcall(function()
			-- upvalues: self (ref), status (ref), p2 (ref)
			self._httpService:RequestInternal({
				Method = "POST",
				Url = self._reportUrl .. "&format=json",
				Headers = { ["Content-Type"] = "application/json" },
				Body = status
			}):Start(function(_, p3)
				-- upvalues: p2 (copy), self (copy)
				if p3.StatusCode == 200 and p2 ~= nil then
					local ok, status = pcall(function()
						-- upvalues: self (copy), p3 (ref)
						return self._httpService:JSONDecode(p3.Body)
					end)
					
					if ok and status._rxid ~= nil then
						self:_sendLogToReport(status._rxid, p2)
					end
				end
			end)
		end)
		
		return
	end
	warn("Cannot convert report to Json")
end

function t._sendLogToReport(p1, p2, p3)
	if type(p3) == "string" and #p3 ~= 0 then
		pcall(function()
			-- upvalues: p1 (ref), p2 (ref), p3 (ref)
			p1._httpService:RequestInternal({
				Method = "POST",
				Url = p1._reportUrl .. "&object=" .. p5 .. "&attachment_name=log.txt",
				Headers = { ["Content-Type"] = "text/plain" },
				Body = p3
			}):Start(function(_, _) end)
		end)
		
		return
	end
end

function t:_generateLog()
	if self._generateLogMethod ~= nil and self._logIntervalInSeconds < tick() - self._lastLogTime then
		self._lastLogTime = tick()
		local ok, status = pcall(function()
			-- upvalues: self (ref)
			return self._generateLogMethod()
		end)
		
		return if ok and type(status) == "string" and #status > 0 then status else nil
	end
end

function t:_generateErrorReport(p1, p2, p3, p4)
	-- upvalues: backtraceReportModule (ref), fFlagLuaAppEnableBacktraceSessionInfoModule (ref)
	local var3 = if type(p3) == "table" then backtraceReportModule.fromDetails(p3) else backtraceReportModule.fromMessageAndStack(p1, p2)
	
	if fFlagLuaAppEnableBacktraceSessionInfoModule and p4 ~= nil then
		var3:addAttributes(p4)
	end
	var3:addAttributes(self._sharedAttributes)
	var3:addAnnotations(self._sharedAnnotations)
	
	if type(p3) == "string" and p3 ~= "" then
		var3:addAnnotations({ stackDetails = p3 })
	end
	return var3
end

function t:reportErrorImmediately(p1, p2, p3, p4)
	if not self._isEnabled then return end
	local var3 = self:_generateErrorReport(p1, p2, p3, p4)
	
	if self._processErrorReportMethod ~= nil then
		var3 = self._processErrorReportMethod(var3)
	end
	self:sendErrorReport(var3, self:_generateLog())
end

function t:reportErrorDeferred(p1, p2, p3, p4)
	if not self._isEnabled then return end
	local formattedText = string.format("%s | %s", p1, p2)
	local t = {}
	
	if not self._errorQueue:hasError(formattedText) then
		local var3 = self:_generateErrorReport(p1, p2, p3, p4)
		
		if self._processErrorReportMethod ~= nil then
			var3 = self._processErrorReportMethod(var3)
		end
		t = { backtraceReport = var3, log = self:_generateLog() }
	end
	self._errorQueue:addError(formattedText, t)
end

function t:_reportErrorFromErrorQueue(_, p1, p2)
	local backtraceReport = p1.backtraceReport
	local log = p1.log
	backtraceReport:addAttributes({ ErrorCount = p2 })
	self:sendErrorReport(backtraceReport, log)
end

local iAttributes = backtraceReportModule.IAttributes

function t:updateSharedAttributes(p1)
	-- upvalues: cryoModule (ref), iAttributes (ref), var1 (ref)
	local var3 = cryoModule.Dictionary.join(self._sharedAttributes, p1)
	local var4, var5 = iAttributes(var3)
	
	if not var4 then
		if var1 or _G.__DEV__ then
			assert(var4, var5)
		else
			return
		end
	end
	self._sharedAttributes = var3
end

local iAnnotations = backtraceReportModule.IAnnotations

function t:updateSharedAnnotations(p1)
	-- upvalues: cryoModule (ref), iAnnotations (ref), var1 (ref)
	local var3 = cryoModule.Dictionary.join(self._sharedAnnotations, p1)
	local var4, var5 = iAnnotations(var3)
	
	if not var4 then
		if var1 or _G.__DEV__ then
			assert(var4, var5)
		else
			return
		end
	end
	self._sharedAnnotations = var3
end

function t:reportAllErrors()
	if self._errorQueue ~= nil then
		self._errorQueue:reportAllErrors()
	end
end

function t:stop()
	self._isEnabled = false
	
	if self._errorQueue ~= nil then
		self:reportAllErrors()
		self._errorQueue:stopTimer()
	end
end

return t