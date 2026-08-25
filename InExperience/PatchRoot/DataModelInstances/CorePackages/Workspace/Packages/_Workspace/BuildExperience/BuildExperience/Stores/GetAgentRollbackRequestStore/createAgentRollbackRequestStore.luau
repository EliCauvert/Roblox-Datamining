local parent = script:FindFirstAncestor("BuildExperience").Parent
local promiseModule = require(parent.Promise)
local signalsModule = require(parent.Signals)

return function()
	-- upvalues: signalsModule (ref), promiseModule (ref)
	local var1 = 0
	local t = {}
	local var2 = nil
	local var3 = nil
	
	local function _(value)
		-- upvalues: t (ref), signalsModule (copy)
		local var1 = t[value]
		
		if var1 == nil then
			local var2, var3 = signalsModule.createSignal(false)
			var1 = { getIsPending = var2, setIsPending = var3 }
			t[value] = var1
		end
		return var1
	end
	
	local function getIsPendingForPlaceId(p1)
		-- upvalues: t (ref), signalsModule (copy)
		local var1 = t[p1]
		
		if var1 == nil then
			local var2, var3 = signalsModule.createSignal(false)
			var1 = { getIsPending = var2, setIsPending = var3 }
			t[p1] = var1
		end
		return var1.getIsPending
	end
	
	local _ = function(p1)
		-- upvalues: var2 (write)
		return var2 ~= nil and (var2.target.placeId == p1.placeId and (if p1.universeId ~= nil then var2.target.universeId == p1.universeId else true))
	end
	
	local _ = function(p1, p2)
		-- upvalues: var3 (write), t (ref), signalsModule (copy)
		if var3 ~= p1 then return end
		var3 = nil
		local placeId = p1.target.placeId
		local var1 = t[placeId]
		
		if var1 == nil then
			local var2, var3 = signalsModule.createSignal(false)
			var1 = { getIsPending = var2, setIsPending = var3 }
			t[placeId] = var1
		end
		var1.setIsPending(false)
		
		if p2 == nil then
			p1.resolve()
			
			return
		end
		p1.reject(p2)
	end
	
	local function registerTurnStarter(p1, p2, p3)
		-- upvalues: var2 (write), var3 (write), t (ref), signalsModule (copy)
		if var2 ~= nil and var2.registration ~= p2 then
			return false
		elseif var3 ~= nil and (var3.target.placeId ~= p1.placeId or var3.target.universeId ~= p1.universeId) and var3 == var3 then
			var3 = nil
			local placeId = var3.target.placeId
			local var1 = t[placeId]
			
			if var1 == nil then
				local var2, var3 = signalsModule.createSignal(false)
				var1 = { getIsPending = var2, setIsPending = var3 }
				t[placeId] = var1
			end
			var1.setIsPending(false)
			var3.reject("agent_rollback_start_failed")
		end
		var2 = { target = p1, registration = p2, startTurn = p3 }
		
		return true
	end
	
	local function unregisterTurnStarter(p1)
		-- upvalues: var2 (write), var3 (write), t (ref), signalsModule (copy)
		if var2 == nil or var2.registration ~= p1 then return end
		var2 = nil
		
		if var3 ~= nil then
			if var3 ~= var3 then return end
			var3 = nil
			local placeId = var3.target.placeId
			local var1 = t[placeId]
			
			if var1 == nil then
				local var2, var3 = signalsModule.createSignal(false)
				var1 = { getIsPending = var2, setIsPending = var3 }
				t[placeId] = var1
			end
			var1.setIsPending(false)
			var3.reject("agent_rollback_start_failed")
		end
	end
	
	local function beginRequest(p1)
		-- upvalues: var3 (write), promiseModule (copy), var2 (write), var1 (write), t (ref), signalsModule (copy)
		if var3 ~= nil then
			return nil, promiseModule.reject("agent_rollback_busy")
		elseif var2 ~= nil and (var2.target.placeId == p1.placeId and (if p1.universeId ~= nil then var2.target.universeId == p1.universeId else true)) then
			var1 += 1
			local var1 = var1
			
			return var1, promiseModule.new(function(p1, p2)
				-- upvalues: var3 (copy), var1 (ref), p1 (ref), var2 (ref), t (copy), signalsModule (copy)
				var3 = {
					id = var1,
					target = {
						universeId = if p1.universeId ~= nil then var2.target.universeId else p1.universeId,
						placeId = p1.placeId
					},
					resolve = p1,
					reject = p2
				}
				local placeId = p1.placeId
				local var1 = t[placeId]
				
				if var1 == nil then
					local var2, var3 = signalsModule.createSignal(false)
					var1 = { getIsPending = var2, setIsPending = var3 }
					t[placeId] = var1
				end
				var1.setIsPending(true)
			end)
		end
		return nil, promiseModule.reject("agent_rollback_no_turn_starter")
	end
	
	local function setRequestData(value, p1)
		-- upvalues: var3 (write), var2 (write), t (ref), signalsModule (copy)
		if var3 == nil or var3.id ~= value then
			return false
		end
		local target = var3.target
		
		if var2 ~= nil and (var2.target.placeId == target.placeId and (if target.universeId ~= nil then var2.target.universeId == target.universeId else true)) then
			if var2 == nil then
				if var3 == var3 then
					var3 = nil
					local placeId = var3.target.placeId
					local var1 = t[placeId]
					
					if var1 == nil then
						local var2, var3 = signalsModule.createSignal(false)
						var1 = { getIsPending = var2, setIsPending = var3 }
						t[placeId] = var1
					end
					var1.setIsPending(false)
					var3.reject("agent_rollback_start_failed")
				end
				return false
			else
				local ok, status = pcall(var2.startTurn, {
					id = value,
					universeId = var3.target.universeId,
					placeId = var3.target.placeId,
					versionNumber = p1.versionNumber,
					noteTitle = p1.noteTitle,
					noteDescription = p1.noteDescription
				}, function()
					-- upvalues: var3 (ref), var3 (copy), t (copy), signalsModule (copy)
					if var3 ~= var3 then return end
					var3 = nil
					local placeId = var3.target.placeId
					local var1 = t[placeId]
					
					if var1 == nil then
						local var2, var3 = signalsModule.createSignal(false)
						var1 = { getIsPending = var2, setIsPending = var3 }
						t[placeId] = var1
					end
					var1.setIsPending(false)
					var3.resolve()
				end, function()
					-- upvalues: var3 (ref), var3 (copy), t (copy), signalsModule (copy)
					if var3 ~= var3 then return end
					var3 = nil
					local placeId = var3.target.placeId
					local var1 = t[placeId]
					
					if var1 == nil then
						local var2, var3 = signalsModule.createSignal(false)
						var1 = { getIsPending = var2, setIsPending = var3 }
						t[placeId] = var1
					end
					var1.setIsPending(false)
					var3.reject("agent_rollback_start_failed")
				end)
				
				if (not ok or not status) and var3 == var3 then
					var3 = nil
					local placeId = var3.target.placeId
					local var4 = t[placeId]
					
					if var4 == nil then
						local var5, var6 = signalsModule.createSignal(false)
						var4 = { getIsPending = var5, setIsPending = var6 }
						t[placeId] = var4
					end
					var4.setIsPending(false)
					var3.reject("agent_rollback_start_failed")
				end
				return ok and status
			end
		elseif var3 == var3 then
			var3 = nil
			local placeId = var3.target.placeId
			local var7 = t[placeId]
			
			if var7 == nil then
				local var8, var9 = signalsModule.createSignal(false)
				var7 = { getIsPending = var8, setIsPending = var9 }
				t[placeId] = var7
			end
			var7.setIsPending(false)
			var3.reject("agent_rollback_start_failed")
		end
		return false
	end
	
	return {
		getIsPendingForPlaceId = getIsPendingForPlaceId,
		registerTurnStarter = registerTurnStarter,
		unregisterTurnStarter = unregisterTurnStarter,
		beginRequest = beginRequest,
		setRequestData = setRequestData,
		failRequest = function(p1)
			-- upvalues: var3 (write), t (ref), signalsModule (copy)
			if var3 == nil or var3.id ~= p1 then
				return false
			elseif var3 == var3 then
				var3 = nil
				local placeId = var3.target.placeId
				local var1 = t[placeId]
				
				if var1 == nil then
					local var2, var3 = signalsModule.createSignal(false)
					var1 = { getIsPending = var2, setIsPending = var3 }
					t[placeId] = var1
				end
				var1.setIsPending(false)
				var3.reject("agent_rollback_start_failed")
			end
			return true
		end,
		cancelRequestForPlaceId = function(p1)
			-- upvalues: var3 (write), t (ref), signalsModule (copy)
			if var3 == nil or var3.target.placeId ~= p1 then
				return false
			elseif var3 == var3 then
				var3 = nil
				local placeId = var3.target.placeId
				local var1 = t[placeId]
				
				if var1 == nil then
					local var2, var3 = signalsModule.createSignal(false)
					var1 = { getIsPending = var2, setIsPending = var3 }
					t[placeId] = var1
				end
				var1.setIsPending(false)
				var3.reject("agent_rollback_cancelled")
			end
			return true
		end,
		request = function(p1, p2)
			-- upvalues: beginRequest (ref), setRequestData (ref)
			local var1, var2 = beginRequest(p1)
			
			if var1 ~= nil then
				setRequestData(var1, p2)
			end
			return var2
		end,
		reset = function()
			-- upvalues: var3 (write), t (ref), signalsModule (copy), var2 (write)
			if var3 ~= nil and var3 == var3 then
				var3 = nil
				local placeId = var3.target.placeId
				local var1 = t[placeId]
				
				if var1 == nil then
					local var2, var3 = signalsModule.createSignal(false)
					var1 = { getIsPending = var2, setIsPending = var3 }
					t[placeId] = var1
				end
				var1.setIsPending(false)
				var3.reject("agent_rollback_start_failed")
			end
			var2 = nil
		end
	}
end