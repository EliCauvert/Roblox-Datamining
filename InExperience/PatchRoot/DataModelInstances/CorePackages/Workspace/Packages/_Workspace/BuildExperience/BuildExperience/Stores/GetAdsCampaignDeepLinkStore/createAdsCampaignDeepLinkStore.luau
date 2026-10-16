local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local signalsModule = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local _ = require(parent.DataHydration.AdCampaignEligibility)
local canCreateCampaign = require(buildExperience.Components.Ads.adCampaignEligibilityUtils).canCreateCampaign
local _ = require(buildExperience.Telemetry.sendBuildExperienceEvent)

return function()
	-- upvalues: createSessionScopedSignal (ref), signalsModule (ref), canCreateCampaign (ref)
	local var1, var2 = createSessionScopedSignal(nil)
	local var3, var4 = createSessionScopedSignal("idle")
	local var5, var6 = createSessionScopedSignal(function()
		return {}
	end)
	local var7, var8 = createSessionScopedSignal(nil)
	
	return {
		getRequest = var1,
		getStatus = var3,
		begin = function(p1, p2)
			-- upvalues: var5 (ref), var6 (ref), var4 (ref), var2 (ref)
			local var9 = var5(false)
			
			if var9[p1] then
				return false
			end
			local cloned = table.clone(var9)
			cloned[p1] = true
			var6(cloned)
			var4(if p2 ~= nil then "idle" else "pending")
			var2(if p2 ~= nil then nil else { id = p1, universeId = p2, expiresAt = os.clock() + 10 })
			
			return true
		end,
		claim = function(p1)
			-- upvalues: var1 (ref), var7 (ref), var8 (ref)
			local var9 = var1(false)
			
			if var9 == nil or var9.id ~= p1 or var7(false) == p1 then
				return false
			end
			var8(p1)
			
			return true
		end,
		finish = function(p1)
			-- upvalues: var1 (ref), var3 (ref), var4 (ref), var2 (ref)
			local var9 = var1(false)
			
			if var9 ~= nil and var9.id == p1 then
				local var10 = var3(false)
				
				if var10 == "pending" or var10 == "refreshing" then
					var4("cancelled")
				end
				var2(nil)
			end
		end,
		createChat = function()
			-- upvalues: createSessionScopedSignal (copy), signalsModule (copy), var1 (ref), var4 (ref), var3 (ref), var2 (ref), var7 (ref), var8 (ref), canCreateCampaign (copy)
			local var9, var10 = createSessionScopedSignal(nil)
			local var11, var12 = signalsModule.createSignal(0)
			local var13, var14 = createSessionScopedSignal(nil)
			local var15, var16 = createSessionScopedSignal(nil)
			
			return {
				getScopeRevision = var11,
				updateScope = function(p1, p2, p3)
					-- upvalues: var9 (ref), var13 (ref), var15 (ref), var16 (ref), var14 (ref), var12 (ref), var10 (ref)
					local var17 = var9(false)
					local t = { universeId = p1, sessionId = p2, isPageVisible = p3 }
					
					if var17 ~= nil then
						local var18 = if var17.universeId == p1 then var17.sessionId ~= p2 else true
						
						if not var18 and var17.isPageVisible == p3 then return end
						if var18 then
							local var19 = false
							
							if var17.universeId == p1 then
								if var17.sessionId ~= nil then
									var19 = false
									
									if var17.sessionId == "" then
										var19 = p2 ~= nil and (p2 ~= "" and var13(false) ~= nil)
									end
								end
							end
							if var19 then
								local var20 = var15(false)
								
								if var20 ~= nil and var20.universeId == p1 and var20.sessionId == var17.sessionId then
									var16(t)
								end
							else
								var14(nil)
								var12(function(p4)
									return p4 + 1
								end)
							end
						end
					end
					var10(t)
				end,
				connect = function(p1, p2, p3)
					-- upvalues: var1 (copy), var4 (copy), var3 (copy), var2 (copy), signalsModule (copy), var9 (ref), var7 (copy), var8 (copy), canCreateCampaign (copy), var14 (ref)
					local var17 = nil
					local var18 = nil
					local var19 = nil
					local var20 = false
					local var21 = nil
					
					local function complete(p4)
						-- upvalues: var17 (write), var21 (write), var1 (copy), var4 (copy), var3 (copy), var2 (copy), p2 (ref)
						if var17 == nil then
							return false
						end
						var17 = nil
						
						if var21 ~= nil then
							task.cancel(var21)
							var21 = nil
						end
						local var22 = var1(false)
						
						if var22 == nil or var22.id ~= var17.id then
							p4 = "cancelled"
						elseif p4 == "eligible" and var17.expiresAt <= os.clock() then
							p4 = "timeout"
						end
						if var22 ~= nil and var22.id == var17.id then
							var4(p4)
							local var23 = var1(false)
							
							if var23 ~= nil and var23.id == var17.id then
								local var24 = var3(false)
								
								if var24 == "pending" or var24 == "refreshing" then
									var4("cancelled")
								end
								var2(nil)
							end
						end
						p2("AD_CAMPAIGN_DEEP_LINK_ELIGIBILITY", { universeId = var17.universeId }, { requestId = var17.id, outcome = p4 })
						
						return p4 == "eligible"
					end
					
					local var22 = signalsModule.createEffect(function(p4)
						-- upvalues: var1 (copy), var9 (copy), var17 (write), complete (ref), p1 (ref), var7 (copy), var8 (copy), var18 (write), var19 (write), var20 (write), var4 (copy), var21 (write), canCreateCampaign (copy), p3 (ref), var14 (copy), p2 (ref)
						local var23 = var1(p4)
						local var24 = var9(p4)
						local var25 = var24 ~= nil and (var24.isPageVisible and (var23 ~= nil and var24.universeId == var23.universeId))
						
						if var17 ~= nil and (not var25 or var23 == nil or var23.id ~= var17.id) then
							complete("cancelled")
						end
						if not var25 or var23 == nil then return end
						local eligibility = p1.getEligibility(var23.universeId)
						local var26 = eligibility.data(p4)
						local var27 = eligibility.status(p4)
						
						if var17 == nil then
							local var28
							local id = var23.id
							local var29 = var1(false)
							
							if var29 == nil or var29.id ~= id or var7(false) == id then
								var28 = false
							else
								var8(id)
								var28 = true
							end
							if not var28 then return end
							var17 = var23
							var18 = var26
							var19 = var27
							var20 = var27 == "NotReady"
							local var30 = var23.expiresAt - os.clock()
							
							if var30 <= 0 then
								complete("timeout")
								
								return
							end
							var4("refreshing")
							var21 = task.delay(var30, function()
								-- upvalues: var21 (copy), complete (copy)
								var21 = nil
								complete("timeout")
							end)
							var20 = var20 or p1.fetchEligibility(var23.universeId).status(false) == "NotReady"
							
							return
						elseif var27 == "NotReady" then
							var20 = true
							
							return
						elseif var27 == "Ready" then
							if var19 == "Ready" and var26 == var18 then return end
							if complete(if canCreateCampaign(var26) then "eligible" else "ineligible") and p3(var26) then
								var14(var23.id)
								p2("AD_CAMPAIGN_DEEP_LINK_PRESENTED", { universeId = var23.universeId }, { requestId = var23.id })
								
								return
							end
						elseif var27 == "Failed" and (var19 ~= "Failed" or var20) then
							complete("failed")
						end
					end)
					
					return function()
						-- upvalues: var22 (ref), complete (ref)
						var22()
						complete("cancelled")
					end
				end,
				clearPresentedRequest = function()
					-- upvalues: var14 (ref)
					var14(nil)
				end,
				getPresentedRequestId = function()
					-- upvalues: var13 (ref)
					return var13(false)
				end,
				startCreate = function()
					-- upvalues: var16 (ref), var9 (ref)
					var16(var9(false))
				end,
				finishCreate = function()
					-- upvalues: var15 (ref), var9 (ref), var16 (ref)
					local var17 = var15(false)
					local var18 = var9(false)
					var16(nil)
					
					return var17 ~= nil and (var18 ~= nil and (var17.universeId == var18.universeId and var17.sessionId == var18.sessionId))
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