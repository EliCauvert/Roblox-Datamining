local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)

local function _(p1)
	return if p1 == nil or p1.userReaction == nil then nil else p1.userReaction.emoteId
end

local _ = function(p1, p2)
	return (if p1 == nil or p1.userReaction == nil then nil else p1.userReaction.emoteId) == p2
end

local _ = function(p1, p2, p3)
	local var1 = p1.commentRestrictionsByCommentId[p3]
	local globalRestriction = p1.globalRestriction
	
	if not globalRestriction then
		globalRestriction = p1.feedRestrictionsByFeedItemId[p2]
		
		if not globalRestriction then
			if var1 ~= nil and var1.feedItemId == p2 then
				return var1.errorCode
			end
			globalRestriction = nil
		end
	end
	return globalRestriction
end

local _ = function(p1, p2)
	local t = {}
	
	if p1 ~= nil and p1 ~= p2 then
		t[p1] = -1
	end
	if p2 ~= nil and p2 ~= p1 then
		t[p2] = (t[p2] or 0) + 1
	end
	return t
end

local function combineDeltas(p1, p2)
	local cloned = table.clone(p1)
	
	for i, v in p2 do
		local var1 = (cloned[i] or 0) + v
		
		if var1 == 0 then
			cloned[i] = nil
		else
			cloned[i] = var1
		end
	end
	return cloned
end

local function projectReactions(p3, p4)
	local list = table.create(#p3.counts)
	local t = {}
	
	for i, v in p3.counts do
		table.insert(list, {
			emoteId = v.emoteId,
			count = math.max(0, v.count + (p4.countDeltas[v.emoteId] or 0))
		})
		t[v.emoteId] = true
	end
	for i_1, v_1 in p4.countDeltas do
		if not t[i_1] and v_1 > 0 then
			table.insert(list, { emoteId = i_1, count = v_1 })
		end
	end
	return {
		counts = list,
		userReaction = if p4.desiredEmoteId ~= nil then nil else { emoteId = p4.desiredEmoteId }
	}
end

return function()
	-- upvalues: signalsModule (ref), projectReactions (ref), combineDeltas (ref)
	local var2, var3 = signalsModule.createSignal({
		globalRestriction = nil,
		cooldownUntilMs = 0,
		intentsByCommentId = {},
		feedRestrictionsByFeedItemId = {},
		commentRestrictionsByCommentId = {}
	})
	local var4, var5 = signalsModule.createSignal(0)
	local var6 = false
	
	local function _(p5)
		-- upvalues: var6 (write), var3 (ref), var2 (ref)
		if not var6 then
			var3(p5(var2(false)))
		end
	end
	
	local function getIntent(p5, p6)
		-- upvalues: var2 (ref)
		return var2(p6 or false).intentsByCommentId[p5]
	end
	
	local function getCooldownUntilMs(p5)
		-- upvalues: var2 (ref)
		return var2(p5 or false).cooldownUntilMs
	end
	
	local function getRestriction(p5, p6, p7)
		-- upvalues: var2 (ref)
		local var7 = var2(p7 or false)
		local var8 = var7.commentRestrictionsByCommentId[p6]
		local globalRestriction = var7.globalRestriction
		
		if not globalRestriction then
			globalRestriction = var7.feedRestrictionsByFeedItemId[p5]
			
			if not globalRestriction then
				if var8 ~= nil and var8.feedItemId == p5 then
					return var8.errorCode
				end
				globalRestriction = nil
			end
		end
		return globalRestriction
	end
	
	local function getProjection(p5, p6, p7, p8)
		-- upvalues: var2 (ref), projectReactions (copy)
		local var7 = var2(p8 or false)
		local var8 = var7.intentsByCommentId[p6]
		local t = {
			reactions = if p7 == nil or var8 == nil then p7 else projectReactions(p7, var8),
			status = if var8 ~= nil then nil else var8.status
		}
		local var9 = var7.commentRestrictionsByCommentId[p6]
		local globalRestriction = var7.globalRestriction
		
		if not globalRestriction then
			globalRestriction = var7.feedRestrictionsByFeedItemId[p5]
			
			if not globalRestriction then
				globalRestriction = if var9 == nil or var9.feedItemId ~= p5 then nil else var9.errorCode
			end
		end
		t.restriction = globalRestriction
		t.generation = if var8 ~= nil then nil else var8.generation
		
		return t
	end
	
	local function beginIntent(p5, p6, p7, p8)
		-- upvalues: var6 (write), var4 (ref), var5 (ref), combineDeltas (copy), var3 (ref), var2 (ref)
		if var6 then
			return var4(false)
		end
		local var7 = var4(false) + 1
		var5(var7)
		
		local var8 = function(p9)
			-- upvalues: p6 (ref), p7 (ref), p5 (ref), p8 (ref), combineDeltas (copy), var7 (ref)
			local cloned = table.clone(p9.intentsByCommentId)
			local var9 = cloned[p6]
			local var10 = if p7 == nil or p7.userReaction == nil then nil else p7.userReaction.emoteId
			local t = {}
			local t_1 = nil
			
			if var9 ~= nil then
				var10 = var9.desiredEmoteId
				t = var9.countDeltas
				
				if var9.rollbackState ~= nil then
					t_1 = {
						desiredEmoteId = var9.rollbackState.desiredEmoteId,
						countDeltas = table.clone(var9.rollbackState.countDeltas)
					}
				elseif var9.status == "LocallyConfirmed" then
					t_1 = {
						desiredEmoteId = var9.desiredEmoteId,
						countDeltas = table.clone(var9.countDeltas)
					}
				end
			end
			local t_2 = {
				status = "Pending",
				feedItemId = p5,
				desiredEmoteId = p8
			}
			local t_3 = {}
			
			if var10 ~= nil and var10 ~= p8 then
				t_3[var10] = -1
			end
			if p8 ~= nil and p8 ~= var10 then
				t_3[p8] = (t_3[p8] or 0) + 1
			end
			t_2.countDeltas = combineDeltas(t, t_3)
			t_2.generation = var7
			t_2.rollbackState = t_1
			cloned[p6] = t_2
			
			return {
				intentsByCommentId = cloned,
				globalRestriction = p9.globalRestriction,
				feedRestrictionsByFeedItemId = p9.feedRestrictionsByFeedItemId,
				commentRestrictionsByCommentId = p9.commentRestrictionsByCommentId,
				cooldownUntilMs = p9.cooldownUntilMs
			}
		end
		
		if not var6 then
			var3(var8(var2(false)))
		end
		return var7
	end
	
	local _ = function(p5, p6, p7)
		-- upvalues: var2 (ref), var6 (write), var3 (ref)
		local var7 = var2(false).intentsByCommentId[p5]
		
		if var6 or var7 == nil or var7.generation ~= p6 then
			return false
		end
		local var8 = function(p8)
			-- upvalues: var7 (ref), p7 (ref), p5 (ref)
			local cloned = table.clone(p8.intentsByCommentId)
			local cloned_1 = table.clone(var7)
			cloned_1.status = p7
			
			if p7 == "LocallyConfirmed" then
				cloned_1.rollbackState = nil
			end
			cloned[p5] = cloned_1
			
			return {
				intentsByCommentId = cloned,
				globalRestriction = p8.globalRestriction,
				feedRestrictionsByFeedItemId = p8.feedRestrictionsByFeedItemId,
				commentRestrictionsByCommentId = p8.commentRestrictionsByCommentId,
				cooldownUntilMs = p8.cooldownUntilMs
			}
		end
		
		if not var6 then
			var3(var8(var2(false)))
		end
		return true
	end
	
	local function clear()
		-- upvalues: var6 (write), var5 (ref), var4 (ref), var3 (ref)
		if var6 then
			return
		end
		var5(var4(false) + 1)
		var3({
			globalRestriction = nil,
			cooldownUntilMs = 0,
			intentsByCommentId = {},
			feedRestrictionsByFeedItemId = {},
			commentRestrictionsByCommentId = {}
		})
	end
	
	return {
		getGeneration = var4,
		getCooldownUntilMs = getCooldownUntilMs,
		getIntent = getIntent,
		getRestriction = getRestriction,
		getProjection = getProjection,
		beginIntent = beginIntent,
		markPending = function(p5, p6)
			-- upvalues: var2 (ref), var6 (write), var3 (ref)
			local var7 = var2(false).intentsByCommentId[p5]
			
			if var6 or var7 == nil or var7.generation ~= p6 then
				return false
			end
			local var8 = "Pending"
			
			local var9 = function(p7)
				-- upvalues: var7 (ref), var8 (ref), p5 (ref)
				local cloned = table.clone(p7.intentsByCommentId)
				local cloned_1 = table.clone(var7)
				cloned_1.status = var8
				
				if var8 == "LocallyConfirmed" then
					cloned_1.rollbackState = nil
				end
				cloned[p5] = cloned_1
				
				return {
					intentsByCommentId = cloned,
					globalRestriction = p7.globalRestriction,
					feedRestrictionsByFeedItemId = p7.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p7.commentRestrictionsByCommentId,
					cooldownUntilMs = p7.cooldownUntilMs
				}
			end
			
			if not var6 then
				var3(var9(var2(false)))
			end
			return true
		end,
		markUncertain = function(p5, p6)
			-- upvalues: var2 (ref), var6 (write), var3 (ref)
			local var7 = var2(false).intentsByCommentId[p5]
			
			if var6 or var7 == nil or var7.generation ~= p6 then
				return false
			end
			local var8 = "Uncertain"
			
			local var9 = function(p7)
				-- upvalues: var7 (ref), var8 (ref), p5 (ref)
				local cloned = table.clone(p7.intentsByCommentId)
				local cloned_1 = table.clone(var7)
				cloned_1.status = var8
				
				if var8 == "LocallyConfirmed" then
					cloned_1.rollbackState = nil
				end
				cloned[p5] = cloned_1
				
				return {
					intentsByCommentId = cloned,
					globalRestriction = p7.globalRestriction,
					feedRestrictionsByFeedItemId = p7.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p7.commentRestrictionsByCommentId,
					cooldownUntilMs = p7.cooldownUntilMs
				}
			end
			
			if not var6 then
				var3(var9(var2(false)))
			end
			return true
		end,
		markLocallyConfirmed = function(p5, p6)
			-- upvalues: var2 (ref), var6 (write), var3 (ref)
			local var7 = var2(false).intentsByCommentId[p5]
			
			if var6 or var7 == nil or var7.generation ~= p6 then
				return false
			end
			local var8 = "LocallyConfirmed"
			
			local var9 = function(p7)
				-- upvalues: var7 (ref), var8 (ref), p5 (ref)
				local cloned = table.clone(p7.intentsByCommentId)
				local cloned_1 = table.clone(var7)
				cloned_1.status = var8
				
				if var8 == "LocallyConfirmed" then
					cloned_1.rollbackState = nil
				end
				cloned[p5] = cloned_1
				
				return {
					intentsByCommentId = cloned,
					globalRestriction = p7.globalRestriction,
					feedRestrictionsByFeedItemId = p7.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p7.commentRestrictionsByCommentId,
					cooldownUntilMs = p7.cooldownUntilMs
				}
			end
			
			if not var6 then
				var3(var9(var2(false)))
			end
			return true
		end,
		confirmAndRebase = function(p5, p6, p7)
			-- upvalues: var2 (ref), var6 (write), var3 (ref)
			local var7 = var2(false).intentsByCommentId[p5]
			
			if var6 or var7 == nil or var7.generation ~= p6 then
				return false
			end
			local var8 = function(p8)
				-- upvalues: var7 (ref), p7 (ref), p5 (ref)
				local cloned = table.clone(p8.intentsByCommentId)
				local cloned_1 = table.clone(var7)
				local var9 = if p7 == nil or p7.userReaction == nil then nil else p7.userReaction.emoteId
				local desiredEmoteId = var7.desiredEmoteId
				local t = {}
				
				if var9 ~= nil and var9 ~= desiredEmoteId then
					t[var9] = -1
				end
				if desiredEmoteId ~= nil and desiredEmoteId ~= var9 then
					t[desiredEmoteId] = (t[desiredEmoteId] or 0) + 1
				end
				cloned_1.countDeltas = t
				cloned_1.rollbackState = nil
				cloned_1.status = "LocallyConfirmed"
				cloned[p5] = cloned_1
				
				return {
					intentsByCommentId = cloned,
					globalRestriction = p8.globalRestriction,
					feedRestrictionsByFeedItemId = p8.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p8.commentRestrictionsByCommentId,
					cooldownUntilMs = p8.cooldownUntilMs
				}
			end
			
			if not var6 then
				var3(var8(var2(false)))
			end
			return true
		end,
		rollback = function(p5, p6, p7)
			-- upvalues: var2 (ref), var6 (write), var3 (ref)
			local var7 = var2(false).intentsByCommentId[p5]
			
			if var6 or var7 == nil or var7.generation ~= p6 then
				return false
			end
			local var8 = function(p8)
				-- upvalues: var7 (ref), p5 (ref), p7 (ref)
				local cloned = table.clone(p8.intentsByCommentId)
				
				if var7.rollbackState == nil then
					cloned[p5] = nil
				else
					cloned[p5] = {
						rollbackState = nil,
						status = "LocallyConfirmed",
						feedItemId = var7.feedItemId,
						desiredEmoteId = var7.rollbackState.desiredEmoteId,
						countDeltas = table.clone(var7.rollbackState.countDeltas),
						generation = var7.generation
					}
				end
				local cloned_1 = table.clone(p8.commentRestrictionsByCommentId)
				
				if p7 == nil then
					cloned_1[p5] = nil
				else
					cloned_1[p5] = {
						feedItemId = var7.feedItemId,
						errorCode = p7,
						generation = var7.generation
					}
				end
				return {
					intentsByCommentId = cloned,
					globalRestriction = p8.globalRestriction,
					feedRestrictionsByFeedItemId = p8.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = cloned_1,
					cooldownUntilMs = p8.cooldownUntilMs
				}
			end
			
			if not var6 then
				var3(var8(var2(false)))
			end
			return true
		end,
		expireIntent = function(p5, p6)
			-- upvalues: var2 (ref), var6 (write), var3 (ref)
			local var7 = var2(false).intentsByCommentId[p5]
			
			if var6 or var7 == nil or var7.generation ~= p6 then
				return false
			end
			local _ = function(p7)
				-- upvalues: p5 (ref)
				local cloned = table.clone(p7.intentsByCommentId)
				cloned[p5] = nil
				
				return {
					intentsByCommentId = cloned,
					globalRestriction = p7.globalRestriction,
					feedRestrictionsByFeedItemId = p7.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p7.commentRestrictionsByCommentId,
					cooldownUntilMs = p7.cooldownUntilMs
				}
			end
			
			if not var6 then
				local var8 = var3
				local var9 = var2(false)
				local cloned = table.clone(var9.intentsByCommentId)
				cloned[p5] = nil
				var8({
					intentsByCommentId = cloned,
					globalRestriction = var9.globalRestriction,
					feedRestrictionsByFeedItemId = var9.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = var9.commentRestrictionsByCommentId,
					cooldownUntilMs = var9.cooldownUntilMs
				})
			end
			return true
		end,
		reconcile = function(p5, p6, p7, p8)
			-- upvalues: var6 (write), var3 (ref), var2 (ref)
			if p7 == nil then
				return false
			end
			local var7 = false
			
			local var8 = function(p9)
				-- upvalues: p6 (ref), p5 (ref), p8 (ref), p7 (ref), var7 (write)
				local cloned = table.clone(p9.commentRestrictionsByCommentId)
				local var9 = cloned[p6]
				
				if var9 ~= nil and var9.feedItemId == p5 and var9.generation <= p8 then
					cloned[p6] = nil
				end
				local var10 = p9.intentsByCommentId[p6]
				local cloned_1 = table.clone(p9.intentsByCommentId)
				
				if var10 ~= nil then
					local desiredEmoteId = var10.desiredEmoteId
					local var11 = if p7 == nil or p7.userReaction == nil then nil else p7.userReaction.emoteId
					
					if var11 == desiredEmoteId then
						cloned_1[p6] = nil
						var7 = true
					elseif var10.generation <= p8 then
						local cloned_2 = table.clone(var10)
						desiredEmoteId = if p7 == nil or p7.userReaction == nil then nil else p7.userReaction.emoteId
						var11 = var10.desiredEmoteId
						local t = {}
						
						if desiredEmoteId ~= nil and desiredEmoteId ~= var11 then
							t[desiredEmoteId] = -1
						end
						if var11 ~= nil and var11 ~= desiredEmoteId then
							t[var11] = (t[var11] or 0) + 1
						end
						cloned_2.countDeltas = t
						
						if var10.rollbackState ~= nil then
							local t_1 = { desiredEmoteId = var10.rollbackState.desiredEmoteId }
							var11 = if p7 == nil or p7.userReaction == nil then nil else p7.userReaction.emoteId
							local desiredEmoteId_1 = var10.rollbackState.desiredEmoteId
							local t_2 = {}
							
							if var11 ~= nil and var11 ~= desiredEmoteId_1 then
								t_2[var11] = -1
							end
							if desiredEmoteId_1 ~= nil and desiredEmoteId_1 ~= var11 then
								t_2[desiredEmoteId_1] = (t_2[desiredEmoteId_1] or 0) + 1
							end
							t_1.countDeltas = t_2
							cloned_2.rollbackState = t_1
						end
						cloned_1[p6] = cloned_2
					end
				end
				return {
					intentsByCommentId = cloned_1,
					globalRestriction = p9.globalRestriction,
					feedRestrictionsByFeedItemId = p9.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = cloned,
					cooldownUntilMs = p9.cooldownUntilMs
				}
			end
			
			if not var6 then
				var3(var8(var2(false)))
			end
			return var7
		end,
		setGlobalRestriction = function(value)
			-- upvalues: var6 (write), var3 (ref), var2 (ref)
			local _ = function(p5)
				-- upvalues: value (ref)
				return {
					intentsByCommentId = p5.intentsByCommentId,
					globalRestriction = value,
					feedRestrictionsByFeedItemId = p5.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p5.commentRestrictionsByCommentId,
					cooldownUntilMs = p5.cooldownUntilMs
				}
			end
			
			if not var6 then
				local var7 = var2(false)
				var3({
					intentsByCommentId = var7.intentsByCommentId,
					globalRestriction = value,
					feedRestrictionsByFeedItemId = var7.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = var7.commentRestrictionsByCommentId,
					cooldownUntilMs = var7.cooldownUntilMs
				})
			end
		end,
		setFeedRestriction = function(value, p5)
			-- upvalues: var6 (write), var3 (ref), var2 (ref)
			local var7 = function(p6)
				-- upvalues: p5 (ref), value (ref)
				local cloned = table.clone(p6.feedRestrictionsByFeedItemId)
				
				if p5 == nil then
					cloned[value] = nil
				else
					cloned[value] = p5
				end
				return {
					intentsByCommentId = p6.intentsByCommentId,
					globalRestriction = p6.globalRestriction,
					feedRestrictionsByFeedItemId = cloned,
					commentRestrictionsByCommentId = p6.commentRestrictionsByCommentId,
					cooldownUntilMs = p6.cooldownUntilMs
				}
			end
			
			if not var6 then
				var3(var7(var2(false)))
			end
		end,
		setCommentRestriction = function(value, p5, p6, p7)
			-- upvalues: var6 (write), var3 (ref), var2 (ref)
			local var7 = function(p8)
				-- upvalues: p6 (ref), p5 (ref), value (ref), p7 (ref)
				local cloned = table.clone(p8.commentRestrictionsByCommentId)
				
				if p6 == nil then
					cloned[p5] = nil
				else
					cloned[p5] = { feedItemId = value, errorCode = p6, generation = p7 }
				end
				return {
					intentsByCommentId = p8.intentsByCommentId,
					globalRestriction = p8.globalRestriction,
					feedRestrictionsByFeedItemId = p8.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = cloned,
					cooldownUntilMs = p8.cooldownUntilMs
				}
			end
			
			if not var6 then
				var3(var7(var2(false)))
			end
		end,
		setCooldownUntilMs = function(value)
			-- upvalues: var6 (write), var3 (ref), var2 (ref)
			local _ = function(p5)
				-- upvalues: value (ref)
				return {
					intentsByCommentId = p5.intentsByCommentId,
					globalRestriction = p5.globalRestriction,
					feedRestrictionsByFeedItemId = p5.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = p5.commentRestrictionsByCommentId,
					cooldownUntilMs = math.max(0, value)
				}
			end
			
			if not var6 then
				local var7 = var2(false)
				var3({
					intentsByCommentId = var7.intentsByCommentId,
					globalRestriction = var7.globalRestriction,
					feedRestrictionsByFeedItemId = var7.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = var7.commentRestrictionsByCommentId,
					cooldownUntilMs = math.max(0, value)
				})
			end
		end,
		clearComment = function(p5)
			-- upvalues: var6 (write), var3 (ref), var2 (ref)
			local var7 = function(p6)
				-- upvalues: p5 (ref)
				local cloned = table.clone(p6.intentsByCommentId)
				cloned[p5] = nil
				local cloned_1 = table.clone(p6.commentRestrictionsByCommentId)
				cloned_1[p5] = nil
				
				return {
					intentsByCommentId = cloned,
					globalRestriction = p6.globalRestriction,
					feedRestrictionsByFeedItemId = p6.feedRestrictionsByFeedItemId,
					commentRestrictionsByCommentId = cloned_1,
					cooldownUntilMs = p6.cooldownUntilMs
				}
			end
			
			if not var6 then
				var3(var7(var2(false)))
			end
		end,
		clearFeed = function(p5)
			-- upvalues: var6 (write), var3 (ref), var2 (ref)
			local var7 = function(p6)
				-- upvalues: p5 (ref)
				local cloned = table.clone(p6.intentsByCommentId)
				
				for i, v in cloned do
					if v.feedItemId == p5 then
						cloned[i] = nil
					end
				end
				local cloned_1 = table.clone(p6.feedRestrictionsByFeedItemId)
				cloned_1[p5] = nil
				local cloned_2 = table.clone(p6.commentRestrictionsByCommentId)
				
				for i_1, v_1 in cloned_2 do
					if v_1.feedItemId == p5 then
						cloned_2[i_1] = nil
					end
				end
				return {
					intentsByCommentId = cloned,
					globalRestriction = p6.globalRestriction,
					feedRestrictionsByFeedItemId = cloned_1,
					commentRestrictionsByCommentId = cloned_2,
					cooldownUntilMs = p6.cooldownUntilMs
				}
			end
			
			if not var6 then
				var3(var7(var2(false)))
			end
		end,
		clear = clear,
		dispose = function()
			-- upvalues: var6 (write), clear (ref)
			if var6 then
				return
			end
			clear()
			var6 = true
		end
	}
end