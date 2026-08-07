local parent = script:FindFirstAncestor("ErrorReporters").Parent
local runService = game:GetService("RunService")
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local backtraceReportModule = require(script.Parent.BacktraceReport)
local errorQueueModule = require(script.Parent.Parent.ErrorQueue)
local fFlagLuaAppEnableBacktraceSessionInfoModule = require(script.Parent.Flags.FFlagLuaAppEnableBacktraceSessionInfo)
local var6 = runService:IsStudio()
local fIntOldestUAVersionToReportErrorsModule = require(script.Parent.Parent.FIntOldestUAVersionToReportErrors)
local t = {}
t.__index = t
local var9 = tModule.strictInterface({
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

function t.new(p0) --[[ line: 42 ]]
	-- upvalues: var9 (ref), var6 (ref), t (ref), errorQueueModule (ref)
	local var10, var11 = var9(p0)
	local t_1 = nil
	
	if var10 then
		t_1 = {
			_isEnabled = true,
			_errorQueue = nil,
			_lastLogTime = 0,
			_httpService = p0.httpService,
			_reportUrl = game:GetFastString("ErrorUploadToBacktraceBaseUrl") .. "token=" .. p0.token,
			_processErrorReportMethod = p0.processErrorReportMethod,
			_sharedAttributes = {},
			_sharedAnnotations = {},
			_generateLogMethod = p0.generateLogMethod,
			_logIntervalInSeconds = p0.logIntervalInSeconds or 60
		}
	elseif var6 or _G.__DEV__ then
		error("invalid arguments for BacktraceReporter: " .. var11)
	else
		t_1 = { _isEnabled = false }
	end
	setmetatable(t_1, t)
	
	if t_1._isEnabled then
		t_1._errorQueue = errorQueueModule.new(function(...) --[[ line: 72 ]]
			-- upvalues: t_1 (write)
			t_1:_reportErrorFromErrorQueue(...)
		end, p0.queueOptions)
		t_1._errorQueue:startTimer()
	end
	return t_1
end

function t.isTooOldToReportErrors(_) --[[ line: 85 ]]
	-- upvalues: runService (ref), fIntOldestUAVersionToReportErrorsModule (ref)
	local var13 = tonumber(string.match(runService:GetRobloxVersion(), ".(%d+)."))
	
	return if var13 then var13 < fIntOldestUAVersionToReportErrorsModule else false
end

function t:sendErrorReport(p1, p2) --[[ line: 97 ]]
	-- upvalues: var6 (ref)
	if not self._isEnabled then return end
	if self:isTooOldToReportErrors() then return end
	if var6 or _G.__DEV__ then
		assert(p1:validate())
	end
	local ok, status = pcall(function() --[[ line: 113 ]]
		-- upvalues: self (ref), p1 (ref)
		return self._httpService:JSONEncode(p1)
	end)
	
	if ok then
		pcall(function() --[[ line: 122 ]]
			-- upvalues: self (ref), status (ref), p2 (ref)
			self._httpService:RequestInternal({
				Method = "POST",
				Url = self._reportUrl .. "&format=json",
				Headers = { ["Content-Type"] = "application/json" },
				Body = status
			}):Start(function(_, p3) --[[ line: 132 ]]
				-- upvalues: p2 (copy), self (copy)
				if p3.StatusCode == 200 and p2 ~= nil then
					local ok, status = pcall(function() --[[ line: 136 ]]
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

function t._sendLogToReport(p4, p5, p6) --[[ line: 148 ]]
	if type(p6) == "string" and #p6 ~= 0 then
		pcall(function() --[[ line: 153 ]]
			-- upvalues: p4 (ref), p5 (ref), p6 (ref)
			p4._httpService:RequestInternal({
				Method = "POST",
				Url = p4._reportUrl .. "&object=" .. p5 .. "&attachment_name=log.txt",
				Headers = { ["Content-Type"] = "text/plain" },
				Body = p6
			}):Start(function(_, _) --[[ line: 163 ]] end)
		end)
		
		return
	end
end

function t:_generateLog() --[[ line: 169 ]]
	if self._generateLogMethod ~= nil and self._logIntervalInSeconds < tick() - self._lastLogTime then
		self._lastLogTime = tick()
		local ok, status = pcall(function() --[[ line: 173 ]]
			-- upvalues: self (ref)
			return self._generateLogMethod()
		end)
		
		return if ok and type(status) == "string" and #status > 0 then status else nil
	end
end

function t:_generateErrorReport(p7, p8, p9, p10) --[[ line: 185 ]]
	-- upvalues: backtraceReportModule (ref), fFlagLuaAppEnableBacktraceSessionInfoModule (ref)
	local var14 = if type(p9) == "table" then backtraceReportModule.fromDetails(p9) else backtraceReportModule.fromMessageAndStack(p7, p8)
	
	if fFlagLuaAppEnableBacktraceSessionInfoModule and p10 ~= nil then
		var14:addAttributes(p10)
	end
	var14:addAttributes(self._sharedAttributes)
	var14:addAnnotations(self._sharedAnnotations)
	
	if type(p9) == "string" and p9 ~= "" then
		var14:addAnnotations({ stackDetails = p9 })
	end
	return var14
end

function t:reportErrorImmediately(p11, p12, p13, p14) --[[ line: 211 ]]
	if not self._isEnabled then return end
	local var15 = self:_generateErrorReport(p11, p12, p13, p14)
	
	if self._processErrorReportMethod ~= nil then
		var15 = self._processErrorReportMethod(var15)
	end
	self:sendErrorReport(var15, self:_generateLog())
end

function t:reportErrorDeferred(p15, p16, p17, p18) --[[ line: 228 ]]
	if not self._isEnabled then return end
	local formattedText = string.format("%s | %s", p15, p16)
	local t = {}
	
	if not self._errorQueue:hasError(formattedText) then
		local var18 = self:_generateErrorReport(p15, p16, p17, p18)
		
		if self._processErrorReportMethod ~= nil then
			var18 = self._processErrorReportMethod(var18)
		end
		t = { backtraceReport = var18, log = self:_generateLog() }
	end
	self._errorQueue:addError(formattedText, t)
end

function t:_reportErrorFromErrorQueue(_, p19, p20) --[[ line: 255 ]]
	local backtraceReport = p19.backtraceReport
	local log = p19.log
	backtraceReport:addAttributes({ ErrorCount = p20 })
	self:sendErrorReport(backtraceReport, log)
end

local iAttributes = backtraceReportModule.IAttributes

function t:updateSharedAttributes(p21) --[[ line: 269 ]]
	-- upvalues: cryoModule (ref), iAttributes (ref), var6 (ref)
	local var19 = cryoModule.Dictionary.join(self._sharedAttributes, p21)
	local var20, var21 = iAttributes(var19)
	
	if not var20 then
		if var6 or _G.__DEV__ then
			assert(var20, var21)
		else
			return
		end
	end
	self._sharedAttributes = var19
end

local iAnnotations = backtraceReportModule.IAnnotations

function t:updateSharedAnnotations(p22) --[[ line: 288 ]]
	-- upvalues: cryoModule (ref), iAnnotations (ref), var6 (ref)
	local var22 = cryoModule.Dictionary.join(self._sharedAnnotations, p22)
	local var23, var24 = iAnnotations(var22)
	
	if not var23 then
		if var6 or _G.__DEV__ then
			assert(var23, var24)
		else
			return
		end
	end
	self._sharedAnnotations = var22
end

function t:reportAllErrors() --[[ line: 305 ]]
	if self._errorQueue ~= nil then
		self._errorQueue:reportAllErrors()
	end
end

function t:stop() --[[ line: 311 ]]
	self._isEnabled = false
	
	if self._errorQueue ~= nil then
		self:reportAllErrors()
		self._errorQueue:stopTimer()
	end
end

return t