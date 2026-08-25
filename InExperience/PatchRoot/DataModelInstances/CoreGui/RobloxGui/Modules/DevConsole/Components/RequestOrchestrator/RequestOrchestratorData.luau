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
	observeType = function(p0, p1)
		if p0.typeSeen[p1] then
			return nil
		end
		p0.typeSeen[p1] = true
		table.insert(p0.allTypes, p1)
		
		return #p0.allTypes
	end
}

local function _(p2)
	local attempts = p2.attempts
	local var1 = attempts and attempts[#attempts]
	
	if var1 and not var1.finish then
		var1.finish = tick()
	end
end

function t.observeTypes(p3, p4)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in ipairs(p4) do
		local var3 = t.observeType(p3, v)
		
		if var3 then
			table.insert(t_1, var3)
		end
	end
	return t_1
end

function t.batchesFor(p5, p6)
	if not p5.batchesByType[p6] then
		p5.batchesByType[p6] = {}
	end
	return p5.batchesByType[p6]
end

function t.registerBatch(p7, p8, p9)
	-- upvalues: t (ref)
	t.batchesFor(p7, p8)[tostring(p9.batchId)] = {
		state = "pending",
		sentTime = nil,
		settleTime = nil,
		operationCount = 0,
		attempts = {}
	}
end

function t.openSendAttempt(p10, p11, p12)
	-- upvalues: t (ref)
	local var4 = t.batchesFor(p10, p11)
	local var5 = tostring(p12.batchId)
	local var6 = var4[var5]
	
	if not var6 then
		var6 = { attempts = {} }
		var4[var5] = var6
	end
	var6.state = "inflight"
	local currentTime = tick()
	var6.attempts = var6.attempts or {}
	table.insert(var6.attempts, { finish = nil, start = currentTime })
	var6.sentTime = var6.sentTime or currentTime
	var6.operationCount = p12.operationCount or 0
end

function t.settleBatch(value, p13, p14)
	local var8 = value.batchesByType[p13]
	
	if not var8 then return end
	local batchId = var8[tostring(p14.batchId)]
	
	if not batchId then return end
	local attempts = batchId.attempts
	local var9 = attempts and attempts[#attempts]
	
	if var9 and not var9.finish then
		var9.finish = tick()
	end
	batchId.settleTime = tick()
	batchId.state = if p14.success then "success" else "failure"
	batchId.httpStatus = p14.httpStatus
end

function t.reclassifyOnRetry(p15, p16, p17)
	local var10 = p15.batchesByType[p16]
	
	if not var10 then return end
	local batchId = var10[tostring(p17.batchId)]
	
	if not batchId then return end
	local attempts = batchId.attempts
	local var11 = attempts and attempts[#attempts]
	
	if var11 and not var11.finish then
		var11.finish = tick()
	end
	if batchId.state == "pending" and not batchId.sentTime then
		local var12 = var10[tostring(p17.batchId - 1)]
		
		if var12 and var12.state == "failure" then
			var12.state = "retrying"
		end
	end
	batchId.state = "retrying"
	batchId.attemptNumber = p17.attemptNumber
end

function t.markExhausted(p18, p19, p20)
	local var13 = p18.batchesByType[p19]
	
	if not var13 then return end
	local batchId = var13[tostring(p20.batchId)]
	
	if batchId then
		local attempts = batchId.attempts
		local var14 = attempts and attempts[#attempts]
		
		if var14 and not var14.finish then
			var14.finish = tick()
		end
		batchId.state = "exhausted"
		batchId.settleTime = tick()
	end
end

function t.trackQueueOnCreated(p21, p22, p23)
	if p23.maxBatchSize then
		p21.observedMaxByType[p22] = p23.maxBatchSize
	end
	local var15 = p21.queues[p22]
	
	if var15 then
		var15.batchId = p23.batchId
		
		return
	end
	p21.queues[p22] = {
		batchId = p23.batchId,
		ops = {},
		createdTime = tick(),
		retryOps = {}
	}
end

function t.drainQueueOnSent(p24, p25, p26)
	local var16 = p24.queues[p25]
	local operationCount = p26.operationCount or (if var16 then #var16.retryOps + #var16.ops else 0)
	p24.lastBatchSizeByType[p25] = operationCount
	
	if var16 then
		for _ = 1, operationCount do
			if #var16.retryOps > 0 then
				table.remove(var16.retryOps, 1)
				continue
			elseif #var16.ops <= 0 then
				break
			end
			table.remove(var16.ops, 1)
			continue
		end
		if #var16.ops == 0 and #var16.retryOps == 0 then
			p24.queues[p25] = nil
		end
	end
end

function t.requeueRetryOps(p27, p28, p29)
	local var18 = p27.queues[p28]
	
	if not var18 then
		var18 = {
			batchId = p29.batchId,
			ops = {},
			createdTime = tick(),
			retryOps = {}
		}
		p27.queues[p28] = var18
	end
	local var19 = p27.lastBatchSizeByType[p28] or (p29.operationCount or 0)
	var18.retryOps = {}
	
	for i = 1, var19 do
		table.insert(var18.retryOps, "retry-" .. i)
	end
end

function t.clearQueueOnExhausted(p30, p31)
	local var20 = p30.queues[p31]
	
	if var20 then
		var20.retryOps = {}
		
		if #var20.ops == 0 then
			p30.queues[p31] = nil
		end
	end
end

function t.enqueueOperation(p32, p33, p34)
	local var21 = p32.queues[p33]
	
	if not var21 then
		var21 = {
			batchId = p34.batchId,
			ops = {},
			createdTime = tick(),
			retryOps = {}
		}
		p32.queues[p33] = var21
	end
	table.insert(var21.ops, p34.message or "?")
end

function t.recordCacheItemAdded(p35, p36, p37)
	local var22 = p35.cacheByType[p36]
	
	if not var22 then
		var22 = { items = {} }
		p35.cacheByType[p36] = var22
	end
	local message = p37.message or ""
	
	for i, v in ipairs(var22.items) do
		if v.key == message then return end
	end
	table.insert(var22.items, { lastHitTime = nil, key = message })
	
	if #var22.items > 48 then
		table.remove(var22.items, 1)
	end
end

function t.recordCacheHit(p38, p39, p40)
	local var24 = p38.cacheByType[p39]
	
	if not var24 then
		var24 = { items = {} }
		p38.cacheByType[p39] = var24
	end
	local message = p40.message or ""
	
	for i = #var24.items, 1, -1 do
		if var24.items[i].key ~= message then
			continue
		end
		var24.items[i].lastHitTime = tick()
		
		return
	end
	table.insert(var24.items, { key = message, lastHitTime = tick() })
	
	if #var24.items > 48 then
		table.remove(var24.items, 1)
	end
end

function t.advanceTime(p41)
	p41.now = tick()
	local var26 = p41.now - 30
	
	for i, v in pairs(p41.batchesByType) do
		for i_1, v_1 in pairs(v) do
			if v_1.settleTime and v_1.settleTime < var26 then
				v[i_1] = nil
			end
		end
	end
end

return t