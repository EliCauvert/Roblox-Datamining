local t = {
	creating = true,
	processing = true,
	created = true,
	active = true,
	retryable_error = true,
	outcome_unknown = true,
	payment_required = true,
	failed = true
}

local function _(p1)
	return type(p1) == "string" and p1 ~= ""
end

local _ = function(p1)
	return type(p1) == "number" and (p1 >= 0 and (p1 < 1e999 and p1 % 1 == 0))
end

local function isRecord(p1, p2, p3)
	-- upvalues: t (ref)
	if type(p1) ~= "table" then
		return false
	end
	local var1 = false
	
	if p1.sessionId == p2 then
		var1 = false
		
		if p1.toolCallId == p3 then
			var1 = type(p2) == "string" and p2 ~= ""
			
			if var1 then
				var1 = type(p3) == "string" and p3 ~= ""
				
				if var1 then
					local universeId = p1.universeId
					var1 = type(universeId) == "number" and (universeId >= 0 and (universeId < 1e999 and universeId % 1 == 0))
					
					if var1 then
						var1 = false
						
						if p1.universeId > 0 then
							local idempotencyKey = p1.idempotencyKey
							var1 = type(idempotencyKey) == "string" and idempotencyKey ~= ""
							
							if var1 then
								if p1.campaignOption ~= nil then
									local campaignOption = p1.campaignOption
									var1 = type(campaignOption) == "string" and campaignOption ~= ""
									
									if var1 then
										if p1.fundingType ~= "free" then
											var1 = false
											
											if p1.fundingType == "paid" then
												if p1.durationDays == nil and p1.displayAmountRobux == nil then
													var1 = false
													
													if type(p1.phase) == "string" then
														var1 = false
														
														if t[p1.phase] == true then
															if p1.phase == "active" or p1.phase == "created" then
																local campaignId = p1.campaignId
																var1 = false
																
																if type(campaignId) == "string" then
																	var1 = campaignId ~= ""
																	var1 = nil
																end
															else
																var1 = p1.campaignId == nil
															end
															if var1 then
																if p1.campaignStatus ~= nil then
																	local campaignStatus = p1.campaignStatus
																	var1 = type(campaignStatus) == "string" and campaignStatus ~= ""
																	
																	if var1 then
																		if p1.lastErrorCode ~= nil and type(p1.lastErrorCode) ~= "string" then
																			var1 = false
																			
																			if type(p1.lastErrorCode) == "number" then
																				var1 = false
																				
																				if math.abs(p1.lastErrorCode) < 1e999 then
																					if p1.lastErrorMessage ~= nil then
																						var1 = false
																						
																						if type(p1.lastErrorMessage) == "string" then
																							local createdAtMs = p1.createdAtMs
																							var1 = type(createdAtMs) == "number" and (createdAtMs >= 0 and (createdAtMs < 1e999 and createdAtMs % 1 == 0))
																							
																							if var1 then
																								local updatedAtMs = p1.updatedAtMs
																								var1 = (type(updatedAtMs) == "number" and (updatedAtMs >= 0 and (updatedAtMs < 1e999 and updatedAtMs % 1 == 0))) and p1.createdAtMs <= p1.updatedAtMs
																							end
																						end
																					end
																				end
																			end
																		end
																	end
																end
															end
														end
													end
												else
													local durationDays = p1.durationDays
													var1 = type(durationDays) == "number" and (durationDays >= 0 and (durationDays < 1e999 and durationDays % 1 == 0))
													
													if var1 then
														var1 = false
														
														if p1.durationDays > 0 then
															local displayAmountRobux = p1.displayAmountRobux
															var1 = type(displayAmountRobux) == "number" and (displayAmountRobux >= 0 and (displayAmountRobux < 1e999 and displayAmountRobux % 1 == 0))
															
															if var1 then
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return var1
end

local _ = function(p1)
	local cloned = table.clone(p1)
	
	if cloned.phase == "active" then
		cloned.phase = "created"
	end
	return cloned
end

local function readNamespace(p1)
	local adCampaignCards = p1.adCampaignCards
	
	if adCampaignCards == nil then
		return { sessions = {} }, nil
	elseif type(adCampaignCards) == "table" and type(adCampaignCards.sessions) == "table" then
		return adCampaignCards, nil
	end
	return nil, "malformed_storage"
end

return function(p1)
	-- upvalues: readNamespace (ref), isRecord (ref)
	local function _()
		-- upvalues: p1 (ref)
		local ok, status, var1 = pcall(p1.readData)
		
		return ok and status == true, var1
	end
	
	local _ = function(p2)
		-- upvalues: p1 (ref)
		local ok, status = pcall(p1.writeData, p2)
		
		return ok and status == true
	end
	
	local var1 = nil
	local t = {}
	local t_1 = {}
	
	local _ = function()
		-- upvalues: var1 (write), p1 (ref), readNamespace (copy)
		if var1 ~= nil then
			return var1, nil
		end
		local ok, status, var2 = pcall(p1.readData)
		
		if ok and status == true then
			local var3, var4 = readNamespace(var2)
			var1 = var3
			
			return var3, var4
		end
		return nil, "storage_unavailable"
	end
	
	local function get(p2, p3)
		-- upvalues: t (ref), t_1 (ref), var1 (write), p1 (ref), readNamespace (copy), isRecord (copy)
		local var2 = if t[p2] ~= nil then nil else t[p2][p3]
		
		if var2 == nil then
			local var3 = if t_1[p2] ~= nil then nil else t_1[p2][p3]
			
			if var3 == nil then
				local var4, var5
				if var1 == nil then
					local ok, status, var6 = pcall(p1.readData)
					local var7 = var6
					
					if ok and status == true then
						ok, status = readNamespace(var7)
						var1 = ok
						var4 = ok
						var5 = status
					else
						var4 = nil
						var5 = "storage_unavailable"
					end
				else
					var4 = var1
					var5 = nil
				end
				if var4 == nil or not (type(p2) == "string" and p2 ~= "") or not (type(p3) == "string" and p3 ~= "") then
					return {
						isAvailable = false,
						isPersisted = false,
						errorCode = var5 or "invalid_identity"
					}
				end
				local var8 = var4.sessions[p2]
				
				if var8 ~= nil and type(var8) ~= "table" then
					return {
						isAvailable = false,
						isPersisted = false,
						errorCode = "malformed_session"
					}
				end
				local var9 = if var8 ~= nil then nil else var8[p3]
				
				if var9 ~= nil and not isRecord(var9, p2, p3) then
					return {
						isAvailable = false,
						isPersisted = false,
						errorCode = "malformed_record"
					}
				end
				local var10
				local t_2 = {
					isAvailable = true,
					isPersisted = if t[p2] ~= nil then t[p2][p3] == nil else true
				}
				
				if var9 == nil then
					var10 = nil
				else
					local cloned = table.clone(var9)
					
					if cloned.phase == "active" then
						cloned.phase = "created"
					end
					var10 = cloned
				end
				t_2.record = var10
				
				return t_2
			else
				local t_2 = { isAvailable = true, isPersisted = false }
				local cloned = table.clone(var3)
				
				if cloned.phase == "active" then
					cloned.phase = "created"
				end
				t_2.record = cloned
				
				return t_2
			end
		else
			local t_2 = { isAvailable = true, isPersisted = false }
			local cloned = table.clone(var2)
			
			if cloned.phase == "active" then
				cloned.phase = "created"
			end
			t_2.record = cloned
			
			return t_2
		end
	end
	
	local function list(p2)
		-- upvalues: var1 (write), p1 (ref), readNamespace (copy), t_1 (ref), t (ref), isRecord (copy)
		local var2, var3
		if not (type(p2) == "string" and p2 ~= "") then
			return {
				isAvailable = false,
				errorCode = "invalid_identity",
				records = {}
			}
		elseif var1 == nil then
			local ok, status, var4 = pcall(p1.readData)
			local var5 = var4
			
			if ok and status == true then
				ok, status = readNamespace(var5)
				var1 = ok
				var2 = ok
				var3 = status
			else
				var2 = nil
				var3 = "storage_unavailable"
			end
		else
			var2 = var1
			var3 = nil
		end
		local var6 = if var2 ~= nil then nil else var2.sessions[p2]
		
		if var6 ~= nil and type(var6) ~= "table" then
			var3 = "malformed_session"
			var6 = nil
		end
		local var7 = if var6 ~= nil then {} else table.clone(var6)
		
		for i, v in t_1[p2] or {} do
			var7[i] = v
		end
		for i_1, v_1 in t[p2] or {} do
			var7[i_1] = v_1
		end
		local t_2 = {}
		
		for i_2, v_2 in var7 do
			if isRecord(v_2, p2, i_2) then
				local cloned = table.clone(v_2)
				
				if cloned.phase == "active" then
					cloned.phase = "created"
				end
				table.insert(t_2, cloned)
			end
		end
		table.sort(t_2, function(p3, p4)
			return if p3.createdAtMs == p4.createdAtMs then p3.toolCallId < p4.toolCallId else p3.createdAtMs < p4.createdAtMs
		end)
		
		return {
			isAvailable = var3 == nil,
			records = t_2,
			errorCode = var3
		}
	end
	
	local function retryWrites()
		-- upvalues: t (ref), p1 (ref), readNamespace (copy), isRecord (copy), t_1 (ref), var1 (write)
		if next(t) == nil then
			return true
		end
		local ok, status, var8 = pcall(p1.readData)
		
		if not ok or status ~= true then
			return false
		end
		local var9 = readNamespace(var8)
		
		if var9 == nil then
			return false
		end
		local cloned = table.clone(var9)
		cloned.sessions = table.clone(var9.sessions)
		local t_2 = {}
		local var10 = false
		
		for i, v in t do
			local var11 = cloned.sessions[i]
			
			if var11 ~= nil and type(var11) ~= "table" then
				t_2[i] = {}
				
				for i_1 in v do
					t_2[i][i_1] = true
				end
			end
			local var12 = if var11 ~= nil then {} else table.clone(var11)
			
			for i_1, v_1 in v do
				local var13 = var12[i_1]
				
				if var13 ~= nil and not isRecord(var13, i, i_1) then
					t_2[i] = t_2[i] or {}
					t_2[i][i_1] = true
				elseif var13 == nil or var13.universeId == v_1.universeId and v_1.updatedAtMs >= var13.updatedAtMs and (var13.campaignId == nil or var13.campaignId == v_1.campaignId) then
					var12[i_1] = table.clone(v_1)
					var10 = true
				else
					t_2[i] = t_2[i] or {}
					t_2[i][i_1] = true
				end
			end
			cloned.sessions[i] = var12
		end
		for i_1, v_1 in t_2 do
			for i_2 in v_1 do
				local var14 = t_1[i_1] or {}
				var14[i_2] = table.clone(t[i_1][i_2])
				t_1[i_1] = var14
				t[i_1][i_2] = nil
			end
			if next(t[i_1]) == nil then
				t[i_1] = nil
			end
		end
		if not var10 then
			return next(t_2) == nil
		end
		local cloned_1 = table.clone(var8)
		cloned_1.adCampaignCards = cloned
		local ok_1, status_1 = pcall(p1.writeData, cloned_1)
		
		if ok_1 and status_1 == true then
			var1 = cloned
			table.clear(t)
			
			return next(t_2) == nil
		end
		return false
	end
	
	local function retain(p3)
		-- upvalues: isRecord (copy), t (ref), retryWrites (ref)
		if isRecord(p3, p3.sessionId, p3.toolCallId) then
			local sessionId = t[p3.sessionId] or {}
			sessionId[p3.toolCallId] = table.clone(p3)
			t[p3.sessionId] = sessionId
			
			return retryWrites(), true
		end
		return false, false
	end
	
	return {
		get = get,
		list = list,
		confirm = function(p3)
			-- upvalues: isRecord (copy), get (ref), retryWrites (ref), retain (ref)
			if not isRecord(p3, p3.sessionId, p3.toolCallId) or p3.phase ~= "created" then
				return false, false
			end
			local record = get(p3.sessionId, p3.toolCallId).record
			
			if record == nil or record.campaignId == nil then
				return retain(p3)
			elseif record.campaignId == p3.campaignId then
				return retryWrites() and get(p3.sessionId, p3.toolCallId).isPersisted, false
			end
			return false, false
		end,
		hasPendingWrites = function()
			-- upvalues: t (ref)
			return next(t) ~= nil
		end,
		retryWrites = retryWrites,
		prune = function(p3)
			-- upvalues: t (ref), p1 (ref), readNamespace (copy), isRecord (copy), var1 (write)
			if next(t) == nil then
				local nowMs = p3.nowMs
				
				if type(nowMs) == "number" and (nowMs >= 0 and (nowMs < 1e999 and nowMs % 1 == 0)) then
					nowMs = p3.retentionMs
					
					if type(nowMs) == "number" and (nowMs >= 0 and (nowMs < 1e999 and nowMs % 1 == 0)) then
						nowMs = p3.maxRecords
						
						if not (type(nowMs) == "number" and (nowMs >= 0 and (nowMs < 1e999 and nowMs % 1 == 0))) then
							return false, false
						end
						local ok, status, var15 = pcall(p1.readData)
						
						if not ok or status ~= true then
							return false, false
						end
						local var16 = readNamespace(var15)
						
						if var16 == nil then
							return false, false
						end
						local t_1 = {}
						local var17 = 0
						
						for i, v in var16.sessions do
							if type(v) == "table" then
								local var18 = p3.loadedToolCallIdsBySession[i]
								
								for i_2, v_1 in v do
									if isRecord(v_1, i, i_2) and v_1.universeId == p3.universeId then
										var17 += 1
										
										if p3.retentionMs < p3.nowMs - v_1.updatedAtMs and (v_1.campaignId ~= nil and (p3.settledCampaignIds[v_1.campaignId] == true and (var18 ~= nil and not var18[i_2]))) then
											table.insert(t_1, v_1)
										end
									end
								end
							end
						end
						if var17 <= p3.maxRecords or #t_1 == 0 then
							return true, false
						end
						table.sort(t_1, function(p4, p5)
							return if p4.updatedAtMs == p5.updatedAtMs then if p4.sessionId == p5.sessionId then p4.toolCallId < p5.toolCallId else p4.sessionId < p5.sessionId else p4.updatedAtMs < p5.updatedAtMs
						end)
						local cloned = table.clone(var16)
						cloned.sessions = table.clone(var16.sessions)
						
						for i_1 = 1, math.min(var17 - p3.maxRecords, #t_1) do
							local var19 = t_1[i_1]
							local cloned_1 = table.clone(cloned.sessions[var19.sessionId])
							cloned_1[var19.toolCallId] = nil
							cloned.sessions[var19.sessionId] = cloned_1
						end
						local cloned_2 = table.clone(var15)
						cloned_2.adCampaignCards = cloned
						local ok_1, status_1 = pcall(p1.writeData, cloned_2)
						
						if ok_1 and status_1 == true then
							var1 = cloned
							
							return true, true
						end
						return false, false
					end
				end
			end
		end,
		reset = function()
			-- upvalues: var1 (write), t (ref), t_1 (ref)
			var1 = nil
			table.clear(t)
			table.clear(t_1)
		end
	}
end