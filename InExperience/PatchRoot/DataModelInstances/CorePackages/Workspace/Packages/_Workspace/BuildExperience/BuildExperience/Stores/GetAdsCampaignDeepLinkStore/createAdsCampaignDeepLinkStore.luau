local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local signalsModule = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local _ = require(parent.DataHydration.AdCampaignEligibility)
local canCreateCampaign = require(buildExperience.Components.Ads.adCampaignEligibilityUtils).canCreateCampaign
local _ = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildAdsNotificationRouting = require(parent.SharedFlags).FFlagBuildAdsNotificationRouting

return function()
	-- upvalues: createSessionScopedSignal (ref), signalsModule (ref), fFlagBuildAdsNotificationRouting (ref), canCreateCampaign (ref)
	local t = {}
	local var1, var2 = createSessionScopedSignal(nil)
	local var3, var4 = createSessionScopedSignal("idle")
	local var5, var6 = createSessionScopedSignal(function()
		return {}
	end)
	local var7, var8 = createSessionScopedSignal(nil)
	
	return {
		getRequest = var1,
		getStatus = var3,
		hasVisibleChat = function(p1)
			-- upvalues: t (ref)
			for i in t do
				local var9 = i(false)
				
				if var9 ~= nil and var9.isPageVisible and var9.universeId == p1 then
					return true
				end
			end
			return false
		end,
		begin = function(p2, p3)
			-- upvalues: var5 (ref), var6 (ref), var4 (ref), var2 (ref)
			local var10 = var5(false)
			
			if var10[p2] then
				return false
			end
			local cloned = table.clone(var10)
			cloned[p2] = true
			var6(cloned)
			var4(if p3 ~= nil then "idle" else "pending")
			var2(if p3 ~= nil then nil else { id = p2, universeId = p3, expiresAt = os.clock() + 10 })
			
			return true
		end,
		claim = function(p2)
			-- upvalues: var1 (ref), var7 (ref), var8 (ref)
			local var10 = var1(false)
			
			if var10 == nil or var10.id ~= p2 or var7(false) == p2 then
				return false
			end
			var8(p2)
			
			return true
		end,
		finish = function(p2)
			-- upvalues: var1 (ref), var3 (ref), var4 (ref), var2 (ref)
			local var10 = var1(false)
			
			if var10 ~= nil and var10.id == p2 then
				local var11 = var3(false)
				
				if var11 == "pending" or var11 == "refreshing" then
					var4("cancelled")
				end
				var2(nil)
			end
		end,
		createChat = function()
			-- upvalues: createSessionScopedSignal (copy), signalsModule (copy), fFlagBuildAdsNotificationRouting (copy), t (ref), var1 (ref), var4 (ref), var3 (ref), var2 (ref), var7 (ref), var8 (ref), canCreateCampaign (copy)
			local var10, var11 = createSessionScopedSignal(nil)
			local var12, var13 = signalsModule.createSignal(0)
			local var14, var15 = createSessionScopedSignal(nil)
			local var16, var17 = createSessionScopedSignal(nil)
			
			return {
				getScopeRevision = var12,
				updateScope = function(p2, p3, p4, p5)
					-- upvalues: var10 (ref), var14 (ref), var16 (ref), var17 (ref), var15 (ref), var13 (ref), var11 (ref)
					local var18 = var10(false)
					local t = {
						universeId = p2,
						sessionId = p3,
						isPageVisible = p4,
						canPresent = p5
					}
					
					if var18 ~= nil then
						local var19 = if var18.universeId == p2 then var18.sessionId ~= p3 else true
						
						if not var19 and var18.isPageVisible == p4 and var18.canPresent == p5 then return end
						if var19 then
							local var20 = false
							
							if var18.universeId == p2 then
								if var18.sessionId ~= nil then
									var20 = false
									
									if var18.sessionId == "" then
										var20 = p3 ~= nil and (p3 ~= "" and var14(false) ~= nil)
									end
								end
							end
							if var20 then
								local var21 = var16(false)
								
								if var21 ~= nil and var21.universeId == p2 and var21.sessionId == var18.sessionId then
									var17(t)
								end
							else
								var15(nil)
								var13(function(p6)
									return p6 + 1
								end)
							end
						end
					end
					var11(t)
				end,
				connect = function(p2, p3, p4)
					-- upvalues: fFlagBuildAdsNotificationRouting (copy), t (copy), var10 (ref), var1 (copy), var4 (copy), var3 (copy), var2 (copy), signalsModule (copy), var7 (copy), var8 (copy), canCreateCampaign (copy), var15 (ref)
					if fFlagBuildAdsNotificationRouting then
						t[var10] = true
					end
					local var18 = nil
					local var19 = nil
					local var20 = nil
					local var21 = false
					local var22 = nil
					local var23 = nil
					
					local function complete(p5)
						-- upvalues: var18 (write), var23 (write), var22 (write), var1 (copy), var4 (copy), var3 (copy), var2 (copy), p3 (ref)
						if var18 == nil then
							return false
						end
						var18 = nil
						
						if var23 ~= nil then
							task.cancel(var23)
							var23 = nil
						end
						if var22 ~= nil then
							task.cancel(var22)
							var22 = nil
						end
						local var24 = var1(false)
						
						if var24 == nil or var24.id ~= var18.id then
							p5 = "cancelled"
						elseif p5 == "eligible" and var18.expiresAt <= os.clock() then
							p5 = "timeout"
						end
						if var24 ~= nil and var24.id == var18.id then
							var4(p5)
							local var25 = var1(false)
							
							if var25 ~= nil and var25.id == var18.id then
								local var26 = var3(false)
								
								if var26 == "pending" or var26 == "refreshing" then
									var4("cancelled")
								end
								var2(nil)
							end
						end
						p3("AD_CAMPAIGN_DEEP_LINK_ELIGIBILITY", { universeId = var18.universeId }, { requestId = var18.id, outcome = p5 })
						
						return p5 == "eligible"
					end
					
					local var24 = signalsModule.createEffect(function(p5)
						-- upvalues: var1 (copy), var10 (copy), var18 (write), complete (ref), p2 (ref), var7 (copy), var8 (copy), var19 (write), var20 (write), var21 (write), var4 (copy), var22 (write), fFlagBuildAdsNotificationRouting (copy), var23 (write), canCreateCampaign (copy), p4 (ref), var15 (copy), p3 (ref)
						local var25 = var1(p5)
						local var26 = var10(p5)
						local var27 = var26 ~= nil and (var26.isPageVisible and (var25 ~= nil and var26.universeId == var25.universeId))
						
						if var18 ~= nil and (not var27 or var25 == nil or var25.id ~= var18.id) then
							complete("cancelled")
						end
						if not var27 or var25 == nil then return end
						local eligibility = p2.getEligibility(var25.universeId)
						local var28 = eligibility.data(p5)
						local var29 = eligibility.status(p5)
						
						if var18 == nil then
							local var30
							local id = var25.id
							local var31 = var1(false)
							
							if var31 == nil or var31.id ~= id or var7(false) == id then
								var30 = false
							else
								var8(id)
								var30 = true
							end
							if not var30 then return end
							var18 = var25
							var19 = var28
							var20 = var29
							var21 = var29 == "NotReady"
							local var32 = var25.expiresAt - os.clock()
							
							if var32 <= 0 then
								complete("timeout")
								
								return
							end
							var4("refreshing")
							var22 = task.delay(var32, function()
								-- upvalues: var22 (copy), complete (copy)
								var22 = nil
								complete("timeout")
							end)
							
							if fFlagBuildAdsNotificationRouting then
								var23 = task.defer(function()
									-- upvalues: var23 (copy), var18 (copy), var25 (ref), p2 (copy), var21 (copy)
									var23 = nil
									
									if var18 == nil or var18.id ~= var25.id then
										return
									end
									var21 = var21 or p2.fetchEligibility(var25.universeId).status(false) == "NotReady"
								end)
								
								return
							end
							var21 = var21 or p2.fetchEligibility(var25.universeId).status(false) == "NotReady"
							
							return
						elseif var29 == "NotReady" then
							var21 = true
							
							return
						elseif var29 == "Ready" then
							if var20 == "Ready" and var28 == var19 then return end
							if fFlagBuildAdsNotificationRouting and var26 ~= nil and (var26.canPresent == false and canCreateCampaign(var28)) then return end
							if complete(if canCreateCampaign(var28) then "eligible" else "ineligible") and p4(var28) then
								var15(var25.id)
								p3("AD_CAMPAIGN_DEEP_LINK_PRESENTED", { universeId = var25.universeId }, { requestId = var25.id })
								
								return
							end
						elseif var29 == "Failed" and (var20 ~= "Failed" or var21) then
							complete("failed")
						end
					end)
					
					return function()
						-- upvalues: t (copy), var10 (copy), var24 (ref), complete (ref)
						t[var10] = nil
						var24()
						complete("cancelled")
					end
				end,
				clearPresentedRequest = function()
					-- upvalues: var15 (ref)
					var15(nil)
				end,
				getPresentedRequestId = function()
					-- upvalues: var14 (ref)
					return var14(false)
				end,
				startCreate = function()
					-- upvalues: var17 (ref), var10 (ref)
					var17(var10(false))
				end,
				finishCreate = function()
					-- upvalues: var16 (ref), var10 (ref), var17 (ref)
					local var18 = var16(false)
					local var19 = var10(false)
					var17(nil)
					
					return var18 ~= nil and (var19 ~= nil and (var18.universeId == var19.universeId and var18.sessionId == var19.sessionId))
				end
			}
		end,
		reset = function()
			-- upvalues: var2 (ref), var4 (ref), var6 (ref), var8 (ref)
			var2(nil)
			var4("idle")
			var6({})
			var8(nil)
		end
	}
end