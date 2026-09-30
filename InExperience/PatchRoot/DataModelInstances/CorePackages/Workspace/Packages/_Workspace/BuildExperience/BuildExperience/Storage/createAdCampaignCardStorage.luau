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
	local var1 = nil
	local t = {}
	
	local function _()
		-- upvalues: var1 (write), p1 (ref), readNamespace (copy)
		if var1 ~= nil then
			return var1, nil
		end
		local var2, var3 = p1.readData()
		
		if var2 then
			local var4, var5 = readNamespace(var3)
			var1 = var4
			
			return var4, var5
		end
		return nil, "storage_unavailable"
	end
	
	local function get(p2, p3)
		-- upvalues: var1 (write), p1 (ref), readNamespace (copy), isRecord (copy), t (ref)
		local var2, var3
		if var1 == nil then
			local var4, var5 = p1.readData()
			
			if var4 then
				local var6, var7 = readNamespace(var5)
				var1 = var6
				var2 = var6
				var3 = var7
			else
				var2 = nil
				var3 = "storage_unavailable"
			end
		else
			var2 = var1
			var3 = nil
		end
		if var2 == nil or not (type(p2) == "string" and p2 ~= "") or not (type(p3) == "string" and p3 ~= "") then
			return {
				isAvailable = false,
				isPersisted = false,
				errorCode = var3 or "invalid_identity"
			}
		end
		local var8 = var2.sessions[p2]
		
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
		local t_1 = {
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
		t_1.record = var10
		
		return t_1
	end
	
	local function list(p2)
		-- upvalues: var1 (write), p1 (ref), readNamespace (copy), isRecord (copy)
		local var2, var3
		if var1 == nil then
			local var4, var5 = p1.readData()
			
			if var4 then
				local var6, var7 = readNamespace(var5)
				var1 = var6
				var2 = var6
				var3 = var7
			else
				var2 = nil
				var3 = "storage_unavailable"
			end
		else
			var2 = var1
			var3 = nil
		end
		if var2 == nil or not (type(p2) == "string" and p2 ~= "") then
			return {
				isAvailable = false,
				records = {},
				errorCode = var3 or "invalid_identity"
			}
		end
		local var8 = var2.sessions[p2]
		
		if var8 == nil then
			return { isAvailable = true, records = {} }
		elseif type(var8) ~= "table" then
			return {
				isAvailable = false,
				errorCode = "malformed_session",
				records = {}
			}
		end
		local t = {}
		
		for i, v in var8 do
			if isRecord(v, p2, i) then
				local cloned = table.clone(v)
				
				if cloned.phase == "active" then
					cloned.phase = "created"
				end
				table.insert(t, cloned)
			end
		end
		table.sort(t, function(p3, p4)
			return if p3.createdAtMs == p4.createdAtMs then p3.toolCallId < p4.toolCallId else p3.createdAtMs < p4.createdAtMs
		end)
		
		return { isAvailable = true, records = t }
	end
	
	local function retryWrites()
		-- upvalues: t (ref), p1 (ref), readNamespace (copy), isRecord (copy), var1 (write)
		if next(t) == nil then
			return true
		end
		local var9, var10 = p1.readData()
		
		if not var9 then
			return false
		end
		local var11 = readNamespace(var10)
		
		if var11 == nil then
			return false
		end
		local var12
		local cloned = table.clone(var11)
		cloned.sessions = table.clone(var11.sessions)
		
		for i, v in t do
			local var13 = cloned.sessions[i]
			
			if var13 == nil or type(var13) == "table" then
				var12 = if var13 ~= nil then {} else table.clone(var13)
				
				for i_1, v_1 in v do
					local var14 = var12[i_1]
					
					if var14 == nil or isRecord(var14, i, i_1) then
						if var14 == nil or var14.idempotencyKey == v_1.idempotencyKey and var14.universeId == v_1.universeId and (var14.campaignOption == v_1.campaignOption and var14.fundingType == v_1.fundingType) and (var14.durationDays == v_1.durationDays and var14.displayAmountRobux == v_1.displayAmountRobux and v_1.updatedAtMs >= var14.updatedAtMs) and (var14.campaignId == nil or var14.campaignId == v_1.campaignId) then
							var12[i_1] = table.clone(v_1)
							continue
						end
						return false
					end
					return false
				end
				cloned.sessions[i] = var12
			end
			return false
		end
		local cloned_1 = table.clone(var10)
		cloned_1.adCampaignCards = cloned
		
		if p1.writeData(cloned_1) then
			var1 = cloned
			table.clear(t)
			
			return true
		end
		return false
	end
	
	local function retain(p3)
		-- upvalues: isRecord (copy), var1 (write), t (ref), retryWrites (ref)
		if isRecord(p3, p3.sessionId, p3.toolCallId) then
			local sessionId = var1.sessions[p3.sessionId] or {}
			sessionId[p3.toolCallId] = table.clone(p3)
			var1.sessions[p3.sessionId] = sessionId
			local sessionId_1 = t[p3.sessionId] or {}
			sessionId_1[p3.toolCallId] = table.clone(p3)
			t[p3.sessionId] = sessionId_1
			
			return retryWrites(), true
		end
		return false, false
	end
	
	local function update(p3, p4, p5)
		-- upvalues: get (ref), retain (ref)
		local var15 = get(p3, p4)
		local record = var15.record
		
		if not var15.isAvailable or record == nil then
			return false, false
		elseif p5(record) and record.updatedAtMs >= record.updatedAtMs then
			return retain(record)
		end
		return false, false
	end
	
	return {
		get = get,
		list = list,
		start = function(p3)
			-- upvalues: isRecord (copy), get (ref), retryWrites (ref), retain (ref)
			if not isRecord(p3, p3.sessionId, p3.toolCallId) or p3.phase ~= "creating" then
				return false, false
			end
			local var15 = get(p3.sessionId, p3.toolCallId)
			
			if not var15.isAvailable then
				return false, false
			end
			local record = var15.record
			
			if record == nil then
				return retain(p3)
			elseif record.universeId == p3.universeId and record.idempotencyKey == p3.idempotencyKey and (record.campaignOption == p3.campaignOption and record.fundingType == p3.fundingType) and (record.durationDays == p3.durationDays and record.displayAmountRobux == p3.displayAmountRobux) then
				return retryWrites(), false
			end
			return false, false
		end,
		processing = function(p3, p4, p5)
			-- upvalues: update (ref)
			return update(p3, p4, function(p6)
				-- upvalues: p5 (ref)
				if p6.campaignId == nil then
					p6.phase = "processing"
					p6.campaignStatus = "processing"
					p6.updatedAtMs = p5
					p6.lastErrorCode = nil
					p6.lastErrorMessage = nil
					
					return true
				end
				return false
			end)
		end,
		created = function(p3, p4, p5, p6, p7)
			-- upvalues: get (ref), retryWrites (ref), update (ref)
			local record = get(p3, p4).record
			
			if record == nil or record.campaignId == nil or record.campaignId ~= p5 then
				return update(p3, p4, function(p8)
					-- upvalues: p5 (ref), p6 (ref), p7 (ref)
					local var15 = p5
					
					if type(var15) == "string" and var15 ~= "" then
						var15 = p6
						
						if (type(var15) == "string" and var15 ~= "") and (p8.campaignId == nil or p8.campaignId == p5) then
							p8.phase = "created"
							p8.campaignId = p5
							p8.campaignStatus = p6
							p8.updatedAtMs = p7
							p8.lastErrorCode = nil
							p8.lastErrorMessage = nil
							
							return true
						end
					end
					return false
				end)
			end
			return retryWrites(), false
		end,
		fail = function(p3, p4, p5, p6, p7, p8)
			-- upvalues: update (ref)
			return update(p3, p4, function(p9)
				-- upvalues: p5 (ref), p6 (ref), p7 (ref), p8 (ref)
				if p9.campaignId == nil and (p5 == "retryable_error" or p5 == "outcome_unknown" or (p5 == "payment_required" or p5 == "failed")) then
					p9.phase = p5
					p9.lastErrorCode = p6
					p9.lastErrorMessage = p7
					p9.updatedAtMs = p8
					
					return true
				end
				return false
			end)
		end,
		hasPendingWrites = function()
			-- upvalues: t (ref)
			return next(t) ~= nil
		end,
		retryWrites = retryWrites,
		prune = function(p3)
			-- upvalues: t (ref), p1 (ref), readNamespace (copy), isRecord (copy), var1 (write)
			local nowMs
			if next(t) == nil then
				nowMs = p3.nowMs
				
				if type(nowMs) == "number" and (nowMs >= 0 and (nowMs < 1e999 and nowMs % 1 == 0)) then
					nowMs = p3.retentionMs
					
					if type(nowMs) == "number" and (nowMs >= 0 and (nowMs < 1e999 and nowMs % 1 == 0)) then
						nowMs = p3.maxRecords
						
						if not (type(nowMs) == "number" and (nowMs >= 0 and (nowMs < 1e999 and nowMs % 1 == 0))) then
							return false, false
						end
						var49, nowMs = p1.readData()
						
						if not var49 then
							return false, false
						end
						local var15 = readNamespace(nowMs)
						
						if var15 == nil then
							return false, false
						end
						local t_1 = {}
						local var16 = 0
						
						for i, v in var15.sessions do
							if type(v) == "table" then
								local var17 = p3.loadedToolCallIdsBySession[i]
								
								for i_2, v_1 in v do
									if isRecord(v_1, i, i_2) and v_1.universeId == p3.universeId then
										var16 += 1
										
										if p3.retentionMs < p3.nowMs - v_1.updatedAtMs and (v_1.campaignId ~= nil and (p3.settledCampaignIds[v_1.campaignId] == true and (var17 ~= nil and not var17[i_2]))) then
											table.insert(t_1, v_1)
										end
									end
								end
							end
						end
						if var16 <= p3.maxRecords or #t_1 == 0 then
							return true, false
						end
						table.sort(t_1, function(p4, p5)
							return if p4.updatedAtMs == p5.updatedAtMs then if p4.sessionId == p5.sessionId then p4.toolCallId < p5.toolCallId else p4.sessionId < p5.sessionId else p4.updatedAtMs < p5.updatedAtMs
						end)
						local cloned = table.clone(var15)
						cloned.sessions = table.clone(var15.sessions)
						
						for i_1 = 1, math.min(var16 - p3.maxRecords, #t_1) do
							local var18 = t_1[i_1]
							local cloned_1 = table.clone(cloned.sessions[var18.sessionId])
							cloned_1[var18.toolCallId] = nil
							cloned.sessions[var18.sessionId] = cloned_1
						end
						local cloned_2 = table.clone(nowMs)
						cloned_2.adCampaignCards = cloned
						
						if p1.writeData(cloned_2) then
							var1 = cloned
							
							return true, true
						end
						return false, false
					end
				end
			end
		end,
		reset = function()
			-- upvalues: var1 (write), t (ref)
			var1 = nil
			table.clear(t)
		end
	}
end