local CreateSignalFunction = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createSignal
local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local TurnStateModule = require(script.Parent.turnState)
local _ = require(script.Parent.types)

return function(p1, RequestId, Cancel, p2, List)
	-- upvalues: CreateSignalFunction (copy), TurnStateModule (copy), AcpProtocolModule (copy)
	local Signal, Signal2 = CreateSignalFunction(p2 or TurnStateModule.createEmptyTurnState(p1, RequestId))
	local t = {}
	local Count = 1
	local v1 = nil
	
	local function _(p3)
		-- upvalues: v1 (ref)
		if v1 == nil or v1 < p3 then
			v1 = p3
		end
	end
	
	if List ~= nil then
		for _, value in List do
			if typeof(value) == "number" and (v1 == nil or v1 < value) then
				v1 = value
			end
		end
	end
	local _ = function(p3)
		-- upvalues: Signal2 (copy)
		Signal2(function(Tbl)
			-- upvalues: p3 (copy)
			if Tbl.isDone then
				return Tbl
			else
				local Copy = table.clone(Tbl)
				p3(Copy)
				
				return Copy
			end
		end)
	end
	
	local function fireHandlers(Notification)
		-- upvalues: t (copy)
		for _, value in t do
			local Success, Result = pcall(function()
				-- upvalues: value (copy), Notification (copy)
				value(Notification)
			end)
			
			if not Success then
				warn(("CreatorAgentClient onNotification handler errored: %s"):format((tostring(Result))))
			end
		end
	end
	
	local _ = function(p3)
		-- upvalues: Signal2 (copy)
		if p3.error then
			local Error = p3.error
			
			local function v19(p4)
				-- upvalues: Error (copy)
				p4.error = tostring(Error.message or "JSON-RPC error")
				p4.errorCode = tonumber(Error.code)
				p4.status = "failed"
				p4.isDone = true
			end
			
			Signal2(function(Tbl)
				-- upvalues: v19 (copy)
				if Tbl.isDone then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					v19(Copy)
					
					return Copy
				end
			end)
		end
	end
	
	local _ = function(p3, p4)
		local SequenceId = p3.sequenceId
		
		if typeof(SequenceId) == "number" then
			return SequenceId
		else
			local SequenceNumber = if p4 == nil then nil else p4.sequenceNumber
			
			return if typeof(SequenceNumber) == "number" then SequenceNumber else nil
		end
	end
	
	local _ = function(p3)
		-- upvalues: Signal (copy), Signal2 (copy)
		local IsIdle: boolean = p3.sessionUpdate == "state_change" and p3.state == "idle"
		
		if IsIdle or Signal(false).status == "queued" then
			local function v23(p4)
				-- upvalues: IsIdle (copy), p3 (copy)
				if p4.status == "queued" then
					p4.status = "streaming"
				end
				if IsIdle then
					local StopReason = if typeof(p3.stop_reason) == "string" then p3.stop_reason else "end_turn"
					p4.stopReason = StopReason
					p4.status = if StopReason == "cancelled" then "cancelled" else "succeeded"
					p4.isDone = true
				end
			end
			
			Signal2(function(Tbl)
				-- upvalues: v23 (copy)
				if Tbl.isDone then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					v23(Copy)
					
					return Copy
				end
			end)
			
			return
		end
	end
	
	return {
		state = Signal,
		onNotification = function(p3)
			-- upvalues: Count (ref), t (copy)
			local Count1: number = Count
			Count += 1
			t[Count1] = p3
			
			return function()
				-- upvalues: t (upval), Count1 (copy)
				t[Count1] = nil
			end
		end,
		getLatestProcessedSequenceNumber = function()
			-- upvalues: v1 (ref)
			return v1
		end,
		cancel = Cancel
	}, {
		dispatchFrame = function(p3, p4, Enabled): boolean
			-- upvalues: Signal (copy), AcpProtocolModule (upval), v1 (ref), Signal2 (copy), fireHandlers (copy)
			if Signal(false).isDone then
				return false
			end
			local HasError = false
			
			if p3.kind == "notification" then
				if p3.notification.method == AcpProtocolModule.Notifications.SessionUpdate then
					local Update = p3.notification.params and p3.notification.params.update
					
					if Update ~= nil then
						local SequenceId = Update.sequenceId
						local SequenceId1 = nil
						
						if typeof(SequenceId) == "number" then
							SequenceId1 = SequenceId
						else
							local SequenceNumber = if p4 == nil then nil else p4.sequenceNumber
							SequenceId1 = if typeof(SequenceNumber) == "number" then SequenceNumber else nil
						end
						local NoSequenceId: boolean = SequenceId1 == nil or (v1 == nil or SequenceId1 > v1)
						
						if SequenceId1 ~= nil and (v1 == nil or v1 < SequenceId1) then
							v1 = SequenceId1
						end
						local IsIdle: boolean = Update.sessionUpdate == "state_change" and Update.state == "idle"
						
						if IsIdle or Signal(false).status == "queued" then
							local function v32(p5)
								-- upvalues: IsIdle (copy), Update (copy)
								if p5.status == "queued" then
									p5.status = "streaming"
								end
								if IsIdle then
									local StopReason = if typeof(Update.stop_reason) == "string" then Update.stop_reason else "end_turn"
									p5.stopReason = StopReason
									p5.status = if StopReason == "cancelled" then "cancelled" else "succeeded"
									p5.isDone = true
								end
							end
							
							Signal2(function(Tbl)
								-- upvalues: v32 (copy)
								if Tbl.isDone then
									return Tbl
								else
									local Copy = table.clone(Tbl)
									v32(Copy)
									
									return Copy
								end
							end)
						end
						HasError = NoSequenceId
					end
				end
				if Enabled ~= false then
					fireHandlers(p3.notification)
					
					return HasError
				end
			elseif p3.kind == "response" then
				local Response = p3.response
				
				if Response.error then
					local Error = Response.error
					
					local function v35(p5)
						-- upvalues: Error (copy)
						p5.error = tostring(Error.message or "JSON-RPC error")
						p5.errorCode = tonumber(Error.code)
						p5.status = "failed"
						p5.isDone = true
					end
					
					Signal2(function(Tbl)
						-- upvalues: v35 (copy)
						if Tbl.isDone then
							return Tbl
						else
							local Copy = table.clone(Tbl)
							v35(Copy)
							
							return Copy
						end
					end)
				end
				HasError = p3.response.error ~= nil
			end
			return HasError
		end,
		fail = function(p3, ErrorCode)
			-- upvalues: Signal2 (copy)
			local function v36(p4)
				-- upvalues: p3 (copy), ErrorCode (copy)
				p4.error = p3
				p4.errorCode = ErrorCode
				p4.status = "failed"
				p4.isDone = true
			end
			
			Signal2(function(Tbl)
				-- upvalues: v36 (copy)
				if Tbl.isDone then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					v36(Copy)
					
					return Copy
				end
			end)
		end,
		markCancelled = function()
			-- upvalues: Signal2 (copy)
			local function v37(p3)
				p3.status = "cancelled"
				p3.stopReason = "cancelled"
				p3.isDone = true
			end
			
			Signal2(function(Tbl)
				-- upvalues: v37 (copy)
				if Tbl.isDone then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					v37(Copy)
					
					return Copy
				end
			end)
		end,
		isDone = function()
			-- upvalues: Signal (copy)
			return Signal(false).isDone
		end,
		requestId = RequestId
	}
end