local t = {
	new = function()
		return {
			now = tick(),
			allTypes = {},
			typeSeen = {},
			batchesByType = {},
			queues = {},
			observedMaxByType = {},
			lastBatchSizeByType = {},
			cacheByType = {}
		}
	end,
	observeType = function(p1, p2)
		if p1.typeSeen[p2] then
			return nil
		end
		p1.typeSeen[p2] = true
		table.insert(p1.allTypes, p2)
		
		return #p1.allTypes
	end
}

local function _(p1)
	local attempts = p1.attempts
	local var1 = attempts and attempts[#attempts]
	
	if var1 and not var1.finish then
		var1.finish = tick()
	end
end

function t.observeTypes(p1, p2)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in ipairs(p2) do
		local var1 = t.observeType(p1, v)
		
		if var1 then
			table.insert(t_1, var1)
		end
	end
	return t_1
end

function t.batchesFor(p3, p4)
	if not p3.batchesByType[p4] then
		p3.batchesByType[p4] = {}
	end
	return p3.batchesByType[p4]
end

function t.registerBatch(p3, p4, p5)
	-- upvalues: t (ref)
	t.batchesFor(p3, p4)[tostring(p5.batchId)] = {
		state = "pending",
		sentTime = nil,
		settleTime = nil,
		operationCount = 0,
		attempts = {}
	}
end

function t.openSendAttempt(p3, p4, p5)
	-- upvalues: t (ref)
	local var2 = t.batchesFor(p3, p4)
	local var3 = tostring(p5.batchId)
	local var4 = var2[var3]
	
	if not var4 then
		var4 = { attempts = {} }
		var2[var3] = var4
	end
	var4.state = "inflight"
	local currentTime = tick()
	var4.attempts = var4.attempts or {}
	table.insert(var4.attempts, { finish = nil, start = currentTime })
	var4.sentTime = var4.sentTime or currentTime
	var4.operationCount = p5.operationCount or 0
end

function t.settleBatch(value, p3, p4)
	local var2 = value.batchesByType[p3]
	
	if not var2 then return end
	local batchId = var2[tostring(p4.batchId)]
	
	if not batchId then return end
	local attempts = batchId.attempts
	local var3 = attempts and attempts[#attempts]
	
	if var3 and not var3.finish then
		var3.finish = tick()
	end
	batchId.settleTime = tick()
	batchId.state = if p4.success then "success" else "failure"
	batchId.httpStatus = p4.httpStatus
end

function t.reclassifyOnRetry(p3, p4, p5)
	local var2 = p3.batchesByType[p4]
	
	if not var2 then return end
	local batchId = var2[tostring(p5.batchId)]
	
	if not batchId then return end
	local attempts = batchId.attempts
	local var3 = attempts and attempts[#attempts]
	
	if var3 and not var3.finish then
		var3.finish = tick()
	end
	if batchId.state == "pending" and not batchId.sentTime then
		local var4 = var2[tostring(p5.batchId - 1)]
		
		if var4 and var4.state == "failure" then
			var4.state = "retrying"
		end
	end
	batchId.state = "retrying"
	batchId.attemptNumber = p5.attemptNumber
end

function t.markExhausted(p3, p4, p5)
	local var2 = p3.batchesByType[p4]
	
	if not var2 then return end
	local batchId = var2[tostring(p5.batchId)]
	
	if batchId then
		local attempts = batchId.attempts
		local var3 = attempts and attempts[#attempts]
		
		if var3 and not var3.finish then
			var3.finish = tick()
		end
		batchId.state = "exhausted"
		batchId.settleTime = tick()
	end
end

function t.trackQueueOnCreated(p3, p4, p5)
	if p5.maxBatchSize then
		p3.observedMaxByType[p4] = p5.maxBatchSize
	end
	local var2 = p3.queues[p4]
	
	if var2 then
		var2.batchId = p5.batchId
		
		return
	end
	p3.queues[p4] = {
		batchId = p5.batchId,
		ops = {},
		createdTime = tick(),
		retryOps = {}
	}
end

function t.drainQueueOnSent(p3, p4, p5)
	local var2 = p3.queues[p4]
	local operationCount = p5.operationCount or (if var2 then #var2.retryOps + #var2.ops else 0)
	p3.lastBatchSizeByType[p4] = operationCount
	
	if var2 then
		for _ = 1, operationCount do
			if #var2.retryOps > 0 then
				table.remove(var2.retryOps, 1)
				continue
			elseif #var2.ops <= 0 then
				break
			end
			table.remove(var2.ops, 1)
			continue
		end
		if #var2.ops == 0 and #var2.retryOps == 0 then
			p3.queues[p4] = nil
		end
	end
end

function t.requeueRetryOps(p6, p7, p8)
	local var3 = p6.queues[p7]
	
	if not var3 then
		var3 = {
			batchId = p8.batchId,
			ops = {},
			createdTime = tick(),
			retryOps = {}
		}
		p6.queues[p7] = var3
	end
	local var4 = p6.lastBatchSizeByType[p7] or (p8.operationCount or 0)
	var3.retryOps = {}
	
	for i = 1, var4 do
		table.insert(var3.retryOps, "retry-" .. i)
	end
end

function t.clearQueueOnExhausted(p9, p10)
	local var5 = p9.queues[p10]
	
	if var5 then
		var5.retryOps = {}
		
		if #var5.ops == 0 then
			p9.queues[p10] = nil
		end
	end
end

function t.enqueueOperation(p9, p10, p11)
	local var5 = p9.queues[p10]
	
	if not var5 then
		var5 = {
			batchId = p11.batchId,
			ops = {},
			createdTime = tick(),
			retryOps = {}
		}
		p9.queues[p10] = var5
	end
	table.insert(var5.ops, p11.message or "?")
end

function t.recordCacheItemAdded(p9, p10, p11)
	local var5 = p9.cacheByType[p10]
	
	if not var5 then
		var5 = { items = {} }
		p9.cacheByType[p10] = var5
	end
	local message = p11.message or ""
	
	for i, v in ipairs(var5.items) do
		if v.key == message then return end
	end
	table.insert(var5.items, { lastHitTime = nil, key = message })
	
	if #var5.items > 48 then
		table.remove(var5.items, 1)
	end
end

function t.recordCacheHit(p12, p13, p14)
	local var6 = p12.cacheByType[p13]
	
	if not var6 then
		var6 = { items = {} }
		p12.cacheByType[p13] = var6
	end
	local message = p14.message or ""
	
	for i = #var6.items, 1, -1 do
		if var6.items[i].key ~= message then
			continue
		end
		var6.items[i].lastHitTime = tick()
		
		return
	end
	table.insert(var6.items, { key = message, lastHitTime = tick() })
	
	if #var6.items > 48 then
		table.remove(var6.items, 1)
	end
end

function t.advanceTime(p15)
	p15.now = tick()
	local var7 = p15.now - 30
	
	for i, v in pairs(p15.batchesByType) do
		for i_1, v_1 in pairs(v) do
			if v_1.settleTime and v_1.settleTime < var7 then
				v[i_1] = nil
			end
		end
	end
end

return t