local function _(p1)
	local Attempts = p1.attempts
	local Attempt = Attempts and Attempts[#Attempts]
	
	if Attempt and not Attempt.finish then
		Attempt.finish = tick()
	end
end

local RequestOrchestratorDataModule = {
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
	observeType = function(p1, p2): number?
		if p1.typeSeen[p2] then
			return nil
		else
			p1.typeSeen[p2] = true
			table.insert(p1.allTypes, p2)
			
			return #p1.allTypes
		end
	end
}

function RequestOrchestratorDataModule.observeTypes(p1, List)
	-- upvalues: RequestOrchestratorDataModule (copy)
	local List1 = {}
	
	for _, value in ipairs(List) do
		local ObserveTypeResult = RequestOrchestratorDataModule.observeType(p1, value)
		
		if ObserveTypeResult then
			table.insert(List1, ObserveTypeResult)
		end
	end
	return List1
end

function RequestOrchestratorDataModule.batchesFor(p2, p3)
	if not p2.batchesByType[p3] then
		p2.batchesByType[p3] = {}
	end
	return p2.batchesByType[p3]
end

function RequestOrchestratorDataModule.registerBatch(p2, p3, p4)
	-- upvalues: RequestOrchestratorDataModule (copy)
	RequestOrchestratorDataModule.batchesFor(p2, p3)[tostring(p4.batchId)] = {
		state = "pending",
		sentTime = nil,
		settleTime = nil,
		operationCount = 0,
		attempts = {}
	}
end

function RequestOrchestratorDataModule.openSendAttempt(p2, p3, p4)
	-- upvalues: RequestOrchestratorDataModule (copy)
	local BatchesForResult = RequestOrchestratorDataModule.batchesFor(p2, p3)
	local Text = tostring(p4.batchId)
	local BatchesForResultEntry = BatchesForResult[Text]
	
	if not BatchesForResultEntry then
		BatchesForResultEntry = { attempts = {} }
		BatchesForResult[Text] = BatchesForResultEntry
	end
	BatchesForResultEntry.state = "inflight"
	local CurrentTime = tick()
	BatchesForResultEntry.attempts = BatchesForResultEntry.attempts or {}
	table.insert(BatchesForResultEntry.attempts, { finish = nil, start = CurrentTime })
	BatchesForResultEntry.sentTime = BatchesForResultEntry.sentTime or CurrentTime
	BatchesForResultEntry.operationCount = p4.operationCount or 0
end

function RequestOrchestratorDataModule.settleBatch(p2, p3, p4)
	local BatchesByTypeEntry = p2.batchesByType[p3]
	
	if not BatchesByTypeEntry then return end
	local BatchesByTypeEntry1 = BatchesByTypeEntry[tostring(p4.batchId)]
	
	if not BatchesByTypeEntry1 then return end
	local Attempts = BatchesByTypeEntry1.attempts
	local Attempt = Attempts and Attempts[#Attempts]
	
	if Attempt and not Attempt.finish then
		Attempt.finish = tick()
	end
	BatchesByTypeEntry1.settleTime = tick()
	BatchesByTypeEntry1.state = if p4.success then "success" else "failure"
	BatchesByTypeEntry1.httpStatus = p4.httpStatus
end

function RequestOrchestratorDataModule.reclassifyOnRetry(p2, p3, p4)
	local BatchesByTypeEntry = p2.batchesByType[p3]
	
	if not BatchesByTypeEntry then return end
	local BatchesByTypeEntry1 = BatchesByTypeEntry[tostring(p4.batchId)]
	
	if not BatchesByTypeEntry1 then return end
	local Attempts = BatchesByTypeEntry1.attempts
	local Attempt = Attempts and Attempts[#Attempts]
	
	if Attempt and not Attempt.finish then
		Attempt.finish = tick()
	end
	if BatchesByTypeEntry1.state == "pending" and not BatchesByTypeEntry1.sentTime then
		local BatchesByTypeEntry2 = BatchesByTypeEntry[tostring(p4.batchId - 1)]
		
		if BatchesByTypeEntry2 and BatchesByTypeEntry2.state == "failure" then
			BatchesByTypeEntry2.state = "retrying"
		end
	end
	BatchesByTypeEntry1.state = "retrying"
	BatchesByTypeEntry1.attemptNumber = p4.attemptNumber
end

function RequestOrchestratorDataModule.markExhausted(p2, p3, p4)
	local BatchesByTypeEntry = p2.batchesByType[p3]
	
	if not BatchesByTypeEntry then return end
	local BatchesByTypeEntry1 = BatchesByTypeEntry[tostring(p4.batchId)]
	
	if BatchesByTypeEntry1 then
		local Attempts = BatchesByTypeEntry1.attempts
		local Attempt = Attempts and Attempts[#Attempts]
		
		if Attempt and not Attempt.finish then
			Attempt.finish = tick()
		end
		BatchesByTypeEntry1.state = "exhausted"
		BatchesByTypeEntry1.settleTime = tick()
	end
end

function RequestOrchestratorDataModule.trackQueueOnCreated(p2, p3, p4)
	if p4.maxBatchSize then
		p2.observedMaxByType[p3] = p4.maxBatchSize
	end
	local Queue = p2.queues[p3]
	
	if Queue then
		Queue.batchId = p4.batchId
		
		return
	else
		p2.queues[p3] = {
			batchId = p4.batchId,
			ops = {},
			createdTime = tick(),
			retryOps = {}
		}
	end
end

function RequestOrchestratorDataModule.drainQueueOnSent(p2, p3, p4)
	local Queue = p2.queues[p3]
	local OperationCount = p4.operationCount or (Queue and #Queue.retryOps + #Queue.ops or 0)
	p2.lastBatchSizeByType[p3] = OperationCount
	
	if Queue then
		for _ = 1, OperationCount do
			if #Queue.retryOps > 0 then
				table.remove(Queue.retryOps, 1)
			else
				if #Queue.ops <= 0 then break end
				table.remove(Queue.ops, 1)
			end
		end
		if #Queue.ops == 0 and #Queue.retryOps == 0 then
			p2.queues[p3] = nil
		end
	end
end

function RequestOrchestratorDataModule.requeueRetryOps(p5, p6, p7)
	local Queue = p5.queues[p6]
	
	if not Queue then
		Queue = {
			batchId = p7.batchId,
			ops = {},
			createdTime = tick(),
			retryOps = {}
		}
		p5.queues[p6] = Queue
	end
	Queue.retryOps = {}
	
	for i = 1, p5.lastBatchSizeByType[p6] or (p7.operationCount or 0) do
		table.insert(Queue.retryOps, "retry-" .. i)
	end
end

function RequestOrchestratorDataModule.clearQueueOnExhausted(p8, p9)
	local Queue = p8.queues[p9]
	
	if Queue then
		Queue.retryOps = {}
		
		if #Queue.ops == 0 then
			p8.queues[p9] = nil
		end
	end
end

function RequestOrchestratorDataModule.enqueueOperation(p8, p9, p10)
	local Queue = p8.queues[p9]
	
	if not Queue then
		Queue = {
			batchId = p10.batchId,
			ops = {},
			createdTime = tick(),
			retryOps = {}
		}
		p8.queues[p9] = Queue
	end
	table.insert(Queue.ops, p10.message or "?")
end

function RequestOrchestratorDataModule.recordCacheItemAdded(p8, p9, p10)
	local CacheByTypeEntry = p8.cacheByType[p9]
	
	if not CacheByTypeEntry then
		CacheByTypeEntry = { items = {} }
		p8.cacheByType[p9] = CacheByTypeEntry
	end
	local Message = p10.message or ""
	
	for _, item in ipairs(CacheByTypeEntry.items) do
		if item.key == Message then return end
	end
	table.insert(CacheByTypeEntry.items, { lastHitTime = nil, key = Message })
	
	if #CacheByTypeEntry.items > 48 then
		table.remove(CacheByTypeEntry.items, 1)
	end
end

function RequestOrchestratorDataModule.recordCacheHit(p11, p12, p13)
	local CacheByTypeEntry = p11.cacheByType[p12]
	
	if not CacheByTypeEntry then
		CacheByTypeEntry = { items = {} }
		p11.cacheByType[p12] = CacheByTypeEntry
	end
	local Message = p13.message or ""
	
	for i = #CacheByTypeEntry.items, 1, -1 do
		if CacheByTypeEntry.items[i].key == Message then
			CacheByTypeEntry.items[i].lastHitTime = tick()
			
			return
		end
	end
	table.insert(CacheByTypeEntry.items, { key = Message, lastHitTime = tick() })
	
	if #CacheByTypeEntry.items > 48 then
		table.remove(CacheByTypeEntry.items, 1)
	end
end

function RequestOrchestratorDataModule.advanceTime(p14)
	p14.now = tick()
	local NowDelta = p14.now - 30
	
	for _, value in pairs(p14.batchesByType) do
		for i, value1 in pairs(value) do
			if value1.settleTime and value1.settleTime < NowDelta then
				value[i] = nil
			end
		end
	end
end

return RequestOrchestratorDataModule