local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local MessageBusService = game:GetService("MessageBusService")
local v1 = require(Modules.LuaApp.Flags.getFFlagSessionCheckDefaultTimeoutInSeconds)()
local EnableSessionCheckManagerToListenOnce = game:DefineFastFlag("EnableSessionCheckManagerToListenOnce", false)
local Status = { NotStarted = 0, InProgress = 1, Success = 2, Failed = 3 }
local SessionCheckManager = {}
SessionCheckManager.__index = SessionCheckManager

function SessionCheckManager.new()
	-- upvalues: Status (copy), SessionCheckManager (copy)
	return (setmetatable({
		_connection = nil,
		_resolveFunction = nil,
		_currentStatus = Status.NotStarted
	}, SessionCheckManager))
end

function SessionCheckManager:registerSessionStatusChange()
	-- upvalues: MessageBusService (copy), Status (copy)
	if self._connection then
		self._connection:Disconnect()
	end
	self._connection = MessageBusService:Subscribe("SessionCheckStatusChanged", function(p1)
		-- upvalues: self (copy), Status (upval)
		if p1 and p1.status then
			self._currentStatus = p1.status
			
			if (p1.status == Status.Success or p1.status == Status.Failed) and self._resolveFunction then
				if p1.status == Status.Failed then
					self._resolveFunction({
						status = p1.status,
						errorStatus = p1.httpStatusCode or p1.errorStatus
					})
				else
					self._resolveFunction({ status = p1.status })
				end
				self._resolveFunction = nil
			end
		end
	end, false, true)
end

function SessionCheckManager.waitForSessionCheckTerminalStatus(p1, p2)
	-- upvalues: v1 (copy), PromiseModule (copy), Status (copy)
	local P3 = p2 or v1
	
	return PromiseModule.new(function(Callback: (any) -> (), Callback1)
		-- upvalues: p1 (copy), Status (upval), PromiseModule (upval), P3 (ref)
		if p1._currentStatus == Status.Success or p1._currentStatus == Status.Failed then
			Callback(p1._currentStatus)
			
			return
		else
			p1._resolveFunction = Callback
			PromiseModule.delay(P3):andThen(function()
				-- upvalues: p1 (upval), Callback1 (copy), P3 (upval)
				if p1._resolveFunction then
					p1._resolveFunction = nil
					Callback1("Session check timeout after " .. P3 .. " seconds")
				end
			end)
		end
	end)
end

function SessionCheckManager:listenToSessionStatusChange(Callback)
	-- upvalues: MessageBusService (copy), EnableSessionCheckManagerToListenOnce (copy)
	if self._connection then
		self._connection:Disconnect()
	end
	self._connection = MessageBusService:Subscribe("SessionCheckStatusChanged", function(p1)
		-- upvalues: Callback (copy)
		if Callback and p1 then
			Callback(p1)
		end
	end, EnableSessionCheckManagerToListenOnce, true)
	
	return self._connection
end

SessionCheckManager.Status = Status
SessionCheckManager.default = SessionCheckManager.new()

return SessionCheckManager