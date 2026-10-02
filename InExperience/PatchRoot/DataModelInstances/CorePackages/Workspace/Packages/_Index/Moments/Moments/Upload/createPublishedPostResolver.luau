local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.MomentsTypes)
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local getLocalUserIdModule = require(moments.Utils.getLocalUserId)
local shouldShowMomentInFeedModule = require(moments.Stores.GetMomentsStore.shouldShowMomentInFeed)
local postLifecycleSubscriptionModule = require(script.Parent.postLifecycleSubscription)
game:DefineFastInt("MomentsPublishedPostPollIntervalSeconds", 10)
game:DefineFastInt("MomentsPublishedPostMaxPollAttempts", 30)
local var1 = nil

local function _()
	-- upvalues: var1 (write), parent (ref)
	if var1 == nil then
		var1 = require(parent.Loggers).Logger:new("Moments.Upload")
	end
	return var1
end

local var2 = 0

local function waitForLifecycleChange(p1, p2, p3, p4)
	-- upvalues: promiseModule (ref), signalsModule (ref), postLifecycleSubscriptionModule (ref)
	local var3 = function() end
	
	local var4 = nil
	local _, var5 = promiseModule.race({
		promiseModule.new(function(p5)
			-- upvalues: var3 (write), signalsModule (copy), postLifecycleSubscriptionModule (copy), p2 (ref), p1 (ref), var4 (write)
			var3 = signalsModule.createEffect(function(p6)
				-- upvalues: postLifecycleSubscriptionModule (copy), p2 (copy), p1 (copy), var4 (copy), p5 (ref)
				if postLifecycleSubscriptionModule.getWakeVersion(p6, p2) ~= p1 and var4 == nil then
					var4 = task.defer(function()
						-- upvalues: var4 (copy), p5 (copy)
						var4 = nil
						p5(true)
					end)
				end
			end)
		end),
		promiseModule.new(function(p5)
			-- upvalues: p4 (ref), p3 (ref)
			p4(p3)
			p5(false)
		end)
	}):await()
	var3()
	
	if var4 ~= nil then
		task.cancel(var4)
	end
	return var5 == true
end

local _ = function(p1, p2, p3)
	local var3, var4 = p1.getFreshUserMoments(p2, p3):await()
	
	return if var3 then var4 else nil
end

local function addToSnapshot(p1, p2)
	for i, v in p2.moments do
		p1.knownMomentIds[v.momentId] = true
		local feedItemId = v.recommendationMetadata.feedItemId
		
		if feedItemId ~= nil then
			p1.knownMomentIds[feedItemId] = true
		end
	end
	for i_1, v_1 in p2.excludedMomentIds or {} do
		p1.knownMomentIds[v_1] = true
	end
end

local _ = function(p3, p4)
	local feedItemId = p4.recommendationMetadata.feedItemId
	
	return if p3.knownMomentIds[p4.momentId] ~= true then feedItemId ~= nil and p3.knownMomentIds[feedItemId] == true else true
end

local _ = function(p3)
	return string.match(p3 or "", "^%s*(.-)%s*$") or ""
end

local function textMatches(p3, p4)
	local var3 = string.match(p3 or "", "^%s*(.-)%s*$") or ""
	local var4 = string.match(p4 or "", "^%s*(.-)%s*$") or ""
	
	if var3 == var4 then
		return true
	end
	local charCount = utf8.len(var3)
	
	if charCount == nil or charCount ~= utf8.len(var4) then
		return false
	end
	local t = {}
	
	for i, v in utf8.codes(var3) do
		table.insert(t, v)
	end
	local var5 = 0
	
	for i_1, v_1 in utf8.codes(var4) do
		var5 += 1
		
		if v_1 ~= t[var5] and v_1 ~= 35 then
			return false
		end
	end
	return true
end

local _ = function(value)
	local var6 = if value ~= nil then nil else value.music
	
	return if var6 == nil then nil else tonumber(var6.assetId)
end

local function getOverlayTexts(p5)
	local t = {}
	
	for i, v in if p5 == nil or p5.textOverlays == nil then {} else p5.textOverlays do
		table.insert(t, v.text)
	end
	return t
end

local _ = function(p6)
	return utf8.len(string.match(p6 or "", "^%s*(.-)%s*$") or "")
end

local function overlayTextsMatch(p6, p7)
	-- upvalues: getOverlayTexts (ref), textMatches (ref)
	local var6 = getOverlayTexts(p6)
	local var7 = getOverlayTexts(p7)
	
	if #var6 ~= #var7 then
		return false
	end
	for i, v in var6 do
		if not textMatches(v, var7[i]) then
			return false
		end
	end
	return true
end

local _ = function(p8)
	return p8 ~= nil and p8 > 0
end

local _ = function(p8, p9)
	local var8 = not (p8 ~= nil and p8 > 0)
	
	if not var8 then
		var8 = not (p9 ~= nil and p9 > 0) or p8 == p9
	end
	return var8
end

local function evaluate(p8, p9, p10)
	-- upvalues: shouldShowMomentInFeedModule (ref), textMatches (ref), overlayTextsMatch (ref)
	local metadata = p8.metadata
	local t = {
		moment = p8,
		position = p9,
		visible = shouldShowMomentInFeedModule(p8),
		captureType = metadata.captureType == p10.captureType,
		caption = textMatches(p10.description, metadata.description)
	}
	local edits = p10.edits
	local var8 = if edits ~= nil then nil else edits.music
	local var9 = if var8 ~= nil then nil else tonumber(var8.assetId)
	local edits_1 = metadata.edits
	local var10 = if edits_1 ~= nil then nil else edits_1.music
	t.music = var9 == (if var10 ~= nil then nil else tonumber(var10.assetId))
	t.overlays = overlayTextsMatch(p10.edits, metadata.edits)
	local placeId = p10.placeId
	local placeId_1 = metadata.placeId
	local var11 = not (placeId ~= nil and placeId > 0)
	
	if not var11 then
		var11 = not (placeId_1 ~= nil and placeId_1 > 0) or placeId == placeId_1
	end
	t.place = var11
	
	return t
end

local _ = function(p8)
	return p8.visible and (p8.captureType and (p8.caption and (p8.music and (p8.overlays and p8.place))))
end

local function findPublishedPost(p8, p9, p10)
	-- upvalues: evaluate (ref)
	local var8 = nil
	local t = {}
	
	for i, v in p8.moments do
		local feedItemId = v.recommendationMetadata.feedItemId
		local var9 = if p9.knownMomentIds[v.momentId] ~= true then feedItemId ~= nil and p9.knownMomentIds[feedItemId] == true else true
		
		if not var9 then
			var9 = evaluate(v, i, p10)
			table.insert(t, var9)
			
			if var8 == nil and (var9.visible and (var9.captureType and (var9.caption and (var9.music and (var9.overlays and var9.place))))) then
				var8 = v
			end
		end
	end
	return var8, t
end

local function logIds(p11, p12)
	-- upvalues: var1 (write), parent (ref)
	for i = 1, #p12, 6 do
		local minValue = math.min(i + 6 - 1, #p12)
		
		if var1 == nil then
			var1 = require(parent.Loggers).Logger:new("Moments.Upload")
		end
		var1:debug("event={} from={} ids=[{}]", p11, tostring(i), table.concat(p12, ",", i, minValue))
	end
end

local function logSnapshotPage(p13, p14, p15)
	-- upvalues: var1 (write), parent (ref), logIds (ref)
	local excludedMomentIds = p15.excludedMomentIds or {}
	
	if var1 == nil then
		var1 = require(parent.Loggers).Logger:new("Moments.Upload")
	end
	var1:debug("event=published_post_snapshot_page resolverId={} page={} moments={} excluded={} hasNext={}", tostring(p13), tostring(p14), tostring(#p15.moments), tostring(#excludedMomentIds), tostring(p15.nextCursor ~= nil))
	local t = {}
	
	for i, v in p15.moments do
		table.insert(t, `{v.momentId}:{v.assetId}`)
	end
	logIds("published_post_snapshot_moments", t)
	logIds("published_post_snapshot_excluded", excludedMomentIds)
end

local function logExpectation(p16)
	-- upvalues: var1 (write), parent (ref), getOverlayTexts (ref)
	if var1 == nil then
		var1 = require(parent.Loggers).Logger:new("Moments.Upload")
	end
	local var10 = var1
	local var11 = "event=published_post_expectation captureType={} captionLength={} musicAssetId={} overlayCount={} placeId={}"
	local name = p16.captureType.Name
	local var12 = tostring(utf8.len(string.match(p16.description or "", "^%s*(.-)%s*$") or ""))
	local edits = p16.edits
	local var13 = if edits ~= nil then nil else edits.music
	var10:debug(var11, name, var12, tostring(if var13 ~= nil then nil else tonumber(var13.assetId)), tostring(#getOverlayTexts(p16.edits)), tostring(p16.placeId))
end

local function logCandidate(p16, p17)
	-- upvalues: var1 (write), parent (ref), getOverlayTexts (ref)
	local moment = p17.moment
	local metadata = moment.metadata
	
	if var1 == nil then
		var1 = require(parent.Loggers).Logger:new("Moments.Upload")
	end
	local var10 = var1
	local var11 = "event=published_post_candidate attempt={} position={} momentId={} feedItemId={} assetId={} status={} matched={} visible={} captureType={} caption={} music={} overlays={} place={} storedCaptureType={} storedCaptionLength={} storedMusicAssetId={} storedOverlayCount={} storedPlaceId={}"
	local var12 = tostring(p16)
	local var13 = tostring(p17.position)
	local momentId = moment.momentId
	local var14 = tostring(moment.recommendationMetadata.feedItemId)
	local var15 = tostring(moment.assetId)
	local var16 = tostring(moment.status)
	local var17 = tostring(p17.visible and (p17.captureType and (p17.caption and (p17.music and (p17.overlays and p17.place)))))
	local var18 = tostring(p17.visible)
	local var19 = tostring(p17.captureType)
	local var20 = tostring(p17.caption)
	local var21 = tostring(p17.music)
	local var22 = tostring(p17.overlays)
	local var23 = tostring(p17.place)
	local name = metadata.captureType.Name
	local var24 = tostring(utf8.len(string.match(metadata.description or "", "^%s*(.-)%s*$") or ""))
	local edits = metadata.edits
	local var25 = if edits ~= nil then nil else edits.music
	var10:debug(var11, var12, var13, momentId, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, name, var24, tostring(if var25 ~= nil then nil else tonumber(var25.assetId)), tostring(#getOverlayTexts(metadata.edits)), tostring(metadata.placeId))
end

return function(p16, p17)
	-- upvalues: momentsGetMomentsUserStoreModule (ref), var2 (write), var1 (write), parent (ref), addToSnapshot (ref), logSnapshotPage (ref), getLocalUserIdModule (ref), logExpectation (ref), promiseModule (ref), sharedFlagsModule (ref), postLifecycleSubscriptionModule (ref), waitForLifecycleChange (ref), findPublishedPost (ref), logCandidate (ref)
	p17 = p17 or {}
	local var10 = if p17.userStore ~= nil then momentsGetMomentsUserStoreModule(false) else p17.userStore
	local wait = p17.wait or function(p18)
		task.wait(p18)
	end
	local var11 = 0
	local var12 = nil
	local var13 = nil
	
	local function takeSnapshot(p18)
		-- upvalues: wait (ref), var10 (ref), var1 (copy), parent (copy), var11 (write), addToSnapshot (copy), logSnapshotPage (copy)
		local var14
		local _ = nil
		
		for i = 1, 3 do
			if i > 1 then
				wait(2)
			end
			local var15, var16 = var10.getFreshUserMoments(p18, nil):await()
			var14 = if var15 then var16 else nil
			
			if var14 ~= nil then break end
			if var1 == nil then
				var1 = require(parent.Loggers).Logger:new("Moments.Upload")
			end
			var1:debug("event=published_post_snapshot_read_failed resolverId={} attempt={}", tostring(var11), tostring(i))
		end
		if var14 == nil then
			return nil
		end
		local t = { knownMomentIds = {} }
		addToSnapshot(t, var14)
		logSnapshotPage(var11, 1, var14)
		local nextCursor = var14.nextCursor
		
		for i_1 = 2, 3 do
			if nextCursor == nil then break end
			local var17, var18 = var10.getFreshUserMoments(p18, nextCursor):await()
			local var19 = if var17 then var18 else nil
			
			if var19 == nil then break end
			addToSnapshot(t, var19)
			logSnapshotPage(var11, i_1, var19)
			nextCursor = if var19.nextCursor ~= nextCursor then nil else var19.nextCursor
		end
		return t
	end
	
	return {
		captureSnapshot = function()
			-- upvalues: var2 (copy), var11 (write), p17 (ref), var12 (write), getLocalUserIdModule (copy), var1 (copy), parent (copy), logExpectation (copy), p16 (ref), var13 (write), promiseModule (copy), takeSnapshot (ref)
			var2 += 1
			var11 = var2
			var12 = if p17.getLocalUserId ~= nil then getLocalUserIdModule() else p17.getLocalUserId()
			
			if var1 == nil then
				var1 = require(parent.Loggers).Logger:new("Moments.Upload")
			end
			var1:debug("event=published_post_snapshot_started resolverId={} hasUser={}", tostring(var11), tostring(var12 ~= nil))
			logExpectation(p16)
			local var20 = var12
			var13 = promiseModule.new(function(p19)
				-- upvalues: var20 (ref), takeSnapshot (copy)
				p19(if var20 ~= nil then nil else takeSnapshot(var20))
			end)
		end,
		resolve = function(p19)
			-- upvalues: var13 (write), var1 (copy), parent (copy), var12 (write), var11 (write), sharedFlagsModule (copy), postLifecycleSubscriptionModule (copy), waitForLifecycleChange (copy), wait (ref), var2 (copy), var10 (ref), findPublishedPost (copy), p16 (ref), logCandidate (copy)
			if var13 == nil then
				if var1 == nil then
					var1 = require(parent.Loggers).Logger:new("Moments.Upload")
				end
				var1:debug("event=published_post_unresolved reason=no_snapshot_started")
				
				return nil
			else
				local var20, var21 = var13:await()
				
				if var20 and var21 ~= nil and var12 ~= nil then
					local momentsPublishedPostPollIntervalSecondsFastInt = game:GetFastInt("MomentsPublishedPostPollIntervalSeconds")
					local momentsPublishedPostMaxPollAttemptsFastInt = game:GetFastInt("MomentsPublishedPostMaxPollAttempts")
					
					if var1 == nil then
						var1 = require(parent.Loggers).Logger:new("Moments.Upload")
					end
					local var22
					var1:debug("event=published_post_polling resolverId={} intervalSeconds={} maxAttempts={}", tostring(var11), tostring(momentsPublishedPostPollIntervalSecondsFastInt), tostring(momentsPublishedPostMaxPollAttemptsFastInt))
					local var23 = sharedFlagsModule.FFlagMomentsOptimisticProfilePending and p19 ~= nil
					local var24 = if var23 then postLifecycleSubscriptionModule.getWakeVersion(false, var12) else 0
					local var25 = os.clock() + momentsPublishedPostPollIntervalSecondsFastInt
					local var26 = 0
					local var27 = 0
					while var26 < momentsPublishedPostMaxPollAttemptsFastInt do
						if var23 then
							if var27 > 0 and not waitForLifecycleChange(var24, var12, math.max(0, var25 - os.clock()), wait) then
								var26 += 1
								var25 = os.clock() + momentsPublishedPostPollIntervalSecondsFastInt
							end
							var24 = postLifecycleSubscriptionModule.getWakeVersion(false, var12)
						else
							wait(momentsPublishedPostPollIntervalSecondsFastInt)
							var26 += 1
						end
						var27 += 1
						var22 = var11 ~= 0 and var11 == var2
						
						if var22 or sharedFlagsModule.FFlagMomentsOptimisticProfilePending and p19 ~= nil then
							if sharedFlagsModule.FFlagMomentsOptimisticProfilePending and p19 ~= nil then
								var22 = false
								
								for i, v in var10.getPendingUserMoments(false)[var12] or {} do
									if v.moment.momentId == p19 then
										if v.publishedMoment == nil then
											var22 = true
											break
										end
										return v.publishedMoment
									end
								end
								if var22 then
									local t, v_1
									local var28, var29 = var10.getFreshUserMoments(var12, nil):await()
									var22 = if var28 then var29 else nil
									
									if sharedFlagsModule.FFlagMomentsOptimisticProfilePending and p19 ~= nil and var22 ~= nil then
										local feedItemId
										t = {}
										
										for v, v in var10.getPendingUserMoments(false)[var12] or {} do
											v_1 = v.publishedMoment
											
											if v_1 ~= nil then
												t[v_1.momentId] = true
												feedItemId = v_1.recommendationMetadata.feedItemId
												
												if feedItemId ~= nil and feedItemId ~= "" then
													t[feedItemId] = true
												end
											end
										end
										local t_1 = {}
										
										for v, v_1 in var22.moments do
											feedItemId = v_1.recommendationMetadata.feedItemId
											
											if not t[v_1.momentId] and (feedItemId == nil or not t[feedItemId]) then
												table.insert(t_1, v_1)
											end
										end
										var22 = table.clone(var22)
										var22.moments = t_1
									end
									if var22 == nil then
										if var1 == nil then
											var1 = require(parent.Loggers).Logger:new("Moments.Upload")
										end
										var1:debug("event=published_post_poll_read_failed resolverId={} attempt={}", tostring(var11), tostring(var27))
									else
										t, var96 = findPublishedPost(var22, var21, p16)
										local excludedMomentIds = var22.excludedMomentIds or {}
										
										if var1 == nil then
											var1 = require(parent.Loggers).Logger:new("Moments.Upload")
										end
										var1:debug("event=published_post_poll resolverId={} attempt={} moments={} excluded={} unknown={}", tostring(var11), tostring(var27), tostring(#var22.moments), tostring(#excludedMomentIds), tostring(#var96))
										
										for v, v_1 in var96 do
											logCandidate(var27, v_1)
										end
										if t == nil then continue end
										if sharedFlagsModule.FFlagMomentsOptimisticProfilePending and p19 ~= nil and not var10.resolvePendingUserMoment(var12, p19, t) then
											return nil
										end
										var10.invalidateUser(var12)
										
										if var1 == nil then
											var1 = require(parent.Loggers).Logger:new("Moments.Upload")
										end
										var1:debug("event=published_post_resolved resolverId={} attempt={} momentId={} feedItemId={} assetId={}", tostring(var11), tostring(var27), t.momentId, tostring(t.recommendationMetadata.feedItemId), tostring(t.assetId))
										
										return t
									end
								end
								return nil
							end
						end
						if var1 == nil then
							var1 = require(parent.Loggers).Logger:new("Moments.Upload")
						end
						var1:debug("event=published_post_unresolved resolverId={} reason=superseded attempt={}", tostring(var11), tostring(var27))
						
						return nil
					end
					if var1 == nil then
						var1 = require(parent.Loggers).Logger:new("Moments.Upload")
					end
					var1:debug("event=published_post_unresolved resolverId={} reason=budget_exhausted attempts={}", tostring(var11), tostring(momentsPublishedPostMaxPollAttemptsFastInt))
					
					return nil
				elseif var1 == nil then
					var1 = require(parent.Loggers).Logger:new("Moments.Upload")
				end
				var1:debug("event=published_post_unresolved resolverId={} reason=snapshot_unavailable", tostring(var11))
				
				return nil
			end
		end,
		isCurrent = function()
			-- upvalues: var11 (write), var2 (copy)
			return var11 ~= 0 and var11 == var2
		end
	}
end