local Parent = script:FindFirstAncestor("DataHydration").Parent
local CreateSignalFunction = require(Parent.Signals).createSignal
local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local TurnStateModule = require(script.Parent.turnState)
local _ = require(script.Parent.types)
local FFlagBuildExperiencePromptFailureTelemetry = require(Parent.SharedFlags).FFlagBuildExperiencePromptFailureTelemetry

return function(p1, RequestId, Cancel, p2, List) --[[ Line: 36 | Named "createTurnHandle" ]]
	-- upvalues: CreateSignalFunction (copy), TurnStateModule (copy), AcpProtocolModule (copy), FFlagBuildExperiencePromptFailureTelemetry (copy)
	local Signal, Signal2 = CreateSignalFunction(p2 or TurnStateModule.createEmptyTurnState(p1, RequestId))
	local ExtractTurnIdResult = nil
	local t = {}
	local t1 = {}
	local Count = 1
	local t2 = {}
	local v1 = nil
	local v2 = nil
	local Total = 0
	
	local function noteProcessedSequenceNumber(Key): boolean --[[ Line: 54 ]]
		-- upvalues: t2 (copy), v1 (ref), v2 (ref), Total (ref)
		if t2[Key] == true then
			return false
		end
		t2[Key] = true
		
		if v1 == nil then
			v1 = Key
			v2 = Key
		elseif v1 < Key then
			Total += Key - v1 - 1
			v1 = Key
		elseif Key < v2 then
			Total += v2 - Key - 1
			v2 = Key
		else
			Total -= 1
		end
		return true
	end
	
	local function hasSequenceGap(): boolean --[[ Line: 75 ]]
		-- upvalues: Total (ref)
		return Total > 0
	end
	
	if List ~= nil then
		for _, value in List do
			if typeof(value) == "number" and t2[value] ~= true then
				t2[value] = true
				
				if v1 == nil then
					v1 = value
					v2 = value
				elseif v1 < value then
					Total += value - v1 - 1
					v1 = value
				elseif value < v2 then
					Total += v2 - value - 1
					v2 = value
				else
					Total -= 1
				end
			end
		end
	end
	local function fireUpdateHandlers(Update, SequenceId) --[[ Line: 106 ]]
		-- upvalues: t1 (copy)
		for _, value in t1 do
			local Success, Result = pcall(function() --[[ Line: 108 ]]
				-- upvalues: value (copy), Update (copy), SequenceId (copy)
				value(Update, SequenceId)
			end)
			
			if not Success then
				warn(("CreatorAgentClient onUpdate handler errored: %s"):format((tostring(Result))))
			end
		end
	end
	
	local function _(p3) --[[ Line: 118 | Named "mutate" ]]
		-- upvalues: Signal2 (copy)
		Signal2(function(Tbl) --[[ Line: 119 ]]
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
	
	local function fireHandlers(Notification) --[[ Line: 129 ]]
		-- upvalues: t (copy)
		for _, value in t do
			local Success, Result = pcall(function() --[[ Line: 132 ]]
				-- upvalues: value (copy), Notification (copy)
				value(Notification)
			end)
			
			if not Success then
				warn(("CreatorAgentClient onNotification handler errored: %s"):format((tostring(Result))))
			end
		end
	end
	
	local _ = function(p3) --[[ Line: 141 | Named "completeFromResponse" ]]
		-- upvalues: Signal2 (copy)
		if p3.error then
			local Error = p3.error
			
			local function v31(p4) --[[ Line: 144 ]]
				-- upvalues: Error (copy)
				p4.error = tostring(Error.message or "JSON-RPC error")
				p4.errorCode = tonumber(Error.code)
				p4.status = "failed"
				p4.isDone = true
			end
			
			Signal2(function(Tbl) --[[ Line: 119 ]]
				-- upvalues: v31 (copy)
				if Tbl.isDone then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					v31(Copy)
					
					return Copy
				end
			end)
		end
	end
	
	local _ = function(p3, p4) --[[ Line: 153 | Named "getEventSequenceId" ]]
		local SequenceId = p3.sequenceId
		
		if typeof(SequenceId) == "number" then
			return SequenceId
		else
			local SequenceNumber = if p4 == nil then nil else p4.sequenceNumber
			
			return if typeof(SequenceNumber) == "number" then SequenceNumber else nil
		end
	end
	
	local _ = function(p3) --[[ Line: 167 | Named "applyTerminalUpdate" ]]
		-- upvalues: Signal (copy), Signal2 (copy)
		local IsIdle: boolean = p3.sessionUpdate == "state_change" and p3.state == "idle"
		
		if IsIdle or Signal(false).status == "queued" then
			local function v35(p4) --[[ Line: 172 ]]
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
			
			Signal2(function(Tbl) --[[ Line: 119 ]]
				-- upvalues: v35 (copy)
				if Tbl.isDone then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					v35(Copy)
					
					return Copy
				end
			end)
			
			return
		end
	end
	
	return {
		state = Signal,
		getTurnId = function() --[[ Line: 247 ]]
			-- upvalues: ExtractTurnIdResult (ref)
			return ExtractTurnIdResult
		end,
		onNotification = function(p3) --[[ Line: 88 ]]
			-- upvalues: Count (ref), t (copy)
			local Count1: number = Count
			Count += 1
			t[Count1] = p3
			
			return function() --[[ Line: 92 ]]
				-- upvalues: t (upval), Count1 (copy)
				t[Count1] = nil
			end
		end,
		onUpdate = function(p3) --[[ Line: 97 ]]
			-- upvalues: Count (ref), t1 (copy)
			local Count1: number = Count
			Count += 1
			t1[Count1] = p3
			
			return function() --[[ Line: 101 ]]
				-- upvalues: t1 (upval), Count1 (copy)
				t1[Count1] = nil
			end
		end,
		getLatestProcessedSequenceNumber = function() --[[ Line: 252 ]]
			-- upvalues: v1 (ref)
			return v1
		end,
		hasSequenceGap = hasSequenceGap,
		noteProcessedSequenceNumber = function(Key) --[[ Line: 256 ]]
			-- upvalues: t2 (copy), v1 (ref), v2 (ref), Total (ref)
			if t2[Key] == true then return end
			t2[Key] = true
			
			if v1 == nil then
				v1 = Key
				v2 = Key
				
				return
			end
			if v1 < Key then
				Total += Key - v1 - 1
				v1 = Key
				
				return
			end
			if Key < v2 then
				Total += v2 - Key - 1
				v2 = Key
				
				return
			else
				Total -= 1
			end
		end,
		cancel = Cancel
	}, {
		dispatchFrame = function(p3, p4, Enabled): boolean --[[ Line: 185 ]]
			-- upvalues: Signal (copy), AcpProtocolModule (upval), t2 (copy), v1 (ref), v2 (ref), Total (ref), ExtractTurnIdResult (ref), TurnStateModule (upval), Signal2 (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), fireUpdateHandlers (copy), fireHandlers (copy)
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
						local Flag = true
						
						if SequenceId1 ~= nil then
							if t2[SequenceId1] == true then
								Flag = false
							else
								t2[SequenceId1] = true
								
								if v1 == nil then
									v1 = SequenceId1
									v2 = SequenceId1
								elseif v1 < SequenceId1 then
									Total += SequenceId1 - v1 - 1
									v1 = SequenceId1
								elseif SequenceId1 < v2 then
									Total += v2 - SequenceId1 - 1
									v2 = SequenceId1
								else
									Total -= 1
								end
								Flag = true
							end
						end
						if ExtractTurnIdResult == nil then
							ExtractTurnIdResult = TurnStateModule.extractTurnId(Update)
						end
						local IsIdle: boolean = Update.sessionUpdate == "state_change" and Update.state == "idle"
						
						if IsIdle or Signal(false).status == "queued" then
							local function v44(p5) --[[ Line: 172 ]]
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
							
							Signal2(function(Tbl) --[[ Line: 119 ]]
								-- upvalues: v44 (copy)
								if Tbl.isDone then
									return Tbl
								else
									local Copy = table.clone(Tbl)
									v44(Copy)
									
									return Copy
								end
							end)
						end
						HasError = Flag
						
						if FFlagBuildExperiencePromptFailureTelemetry and Flag then
							fireUpdateHandlers(Update, SequenceId1)
						end
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
					
					local function v47(p5) --[[ Line: 144 ]]
						-- upvalues: Error (copy)
						p5.error = tostring(Error.message or "JSON-RPC error")
						p5.errorCode = tonumber(Error.code)
						p5.status = "failed"
						p5.isDone = true
					end
					
					Signal2(function(Tbl) --[[ Line: 119 ]]
						-- upvalues: v47 (copy)
						if Tbl.isDone then
							return Tbl
						else
							local Copy = table.clone(Tbl)
							v47(Copy)
							
							return Copy
						end
					end)
				end
				HasError = p3.response.error ~= nil
			end
			return HasError
		end,
		noteProcessedSequenceNumber = noteProcessedSequenceNumber,
		fail = function(p3, ErrorCode, RequestFailure) --[[ Line: 224 ]]
			-- upvalues: FFlagBuildExperiencePromptFailureTelemetry (upval), Signal2 (copy)
			local function v48(p4) --[[ Line: 225 ]]
				-- upvalues: p3 (copy), ErrorCode (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), RequestFailure (copy)
				p4.error = p3
				p4.errorCode = ErrorCode
				
				if FFlagBuildExperiencePromptFailureTelemetry then
					p4.requestFailure = RequestFailure
				end
				p4.status = "failed"
				p4.isDone = true
			end
			
			Signal2(function(Tbl) --[[ Line: 119 ]]
				-- upvalues: v48 (copy)
				if Tbl.isDone then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					v48(Copy)
					
					return Copy
				end
			end)
		end,
		markCancelled = function() --[[ Line: 237 ]]
			-- upvalues: Signal2 (copy)
			local function v49(p3) --[[ Line: 238 ]]
				p3.status = "cancelled"
				p3.stopReason = "cancelled"
				p3.isDone = true
			end
			
			Signal2(function(Tbl) --[[ Line: 119 ]]
				-- upvalues: v49 (copy)
				if Tbl.isDone then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					v49(Copy)
					
					return Copy
				end
			end)
		end,
		isDone = function() --[[ Line: 267 ]]
			-- upvalues: Signal (copy)
			return Signal(false).isDone
		end,
		requestId = RequestId
	}
end