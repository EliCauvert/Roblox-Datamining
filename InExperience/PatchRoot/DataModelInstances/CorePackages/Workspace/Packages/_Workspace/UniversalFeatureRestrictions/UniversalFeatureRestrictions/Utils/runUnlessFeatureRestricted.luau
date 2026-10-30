local UniversalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local _ = require(UniversalFeatureRestrictions.Common.AbuseVector)
local FeatureRestrictionDisplayDirectSignalModule = require(UniversalFeatureRestrictions.Signals.featureRestrictionDisplayDirectSignal)
local GetModerationDetailModule = require(UniversalFeatureRestrictions.Http.GetModerationDetail)
local _ = require(UniversalFeatureRestrictions.Parent.ModerationCommon.Types)
local _ = require(UniversalFeatureRestrictions.Utils.showFeatureRestrictionDirect)
local UFRRunUnlessFeatureRestrictedTimeoutMs = game:DefineFastInt("UFRRunUnlessFeatureRestrictedTimeoutMs", 2000)

local function _(p1): boolean
	local PunishmentTypeDescription: string = p1.punishmentTypeDescription
	
	return type(PunishmentTypeDescription) == "string" and string.find(PunishmentTypeDescription:lower(), "nudge", 1, true) ~= nil
end

local _ = function(p1): boolean
	local InterventionId = p1.interventionId
	
	return p1.acknowledgeable == true and type(InterventionId) == "string" and InterventionId ~= ""
end

return function(AbuseVector, p1)
	-- upvalues: FeatureRestrictionDisplayDirectSignalModule (copy), GetModerationDetailModule (copy), UFRRunUnlessFeatureRestrictedTimeoutMs (copy)
	local Flag = false
	local Flag1 = false
	local DelayedThread = nil
	
	local function _(p2)
		-- upvalues: p1 (copy)
		if p1.onPhaseChanged then
			p1.onPhaseChanged(p2)
		end
	end
	
	local _ = function()
		-- upvalues: Flag1 (ref), p1 (copy)
		if Flag1 then return end
		Flag1 = true
		
		if p1.onPhaseChanged then
			p1.onPhaseChanged("Settled")
		end
	end
	
	local _ = function(p2)
		-- upvalues: Flag (ref), p1 (copy)
		if not Flag then
			Flag = true
			task.spawn(function()
				-- upvalues: p1 (upval), p2 (copy)
				p1.onProceed(p2)
			end)
			
			return
		end
	end
	
	local _ = function(p2)
		-- upvalues: Flag (ref), p1 (copy)
		if Flag then return end
		Flag = true
		local OnRestricted = p1.onRestricted
		
		if OnRestricted then
			task.spawn(function()
				-- upvalues: OnRestricted (copy), p2 (copy)
				OnRestricted(p2)
			end)
		end
	end
	
	local _ = function()
		-- upvalues: Flag1 (ref), p1 (copy), Flag (ref)
		if not Flag1 then
			Flag1 = true
			
			if p1.onPhaseChanged then
				p1.onPhaseChanged("Settled")
			end
		end
		if not Flag then
			Flag = true
			local v1 = "CheckFailed"
			task.spawn(function()
				-- upvalues: p1 (upval), v1 (copy)
				p1.onProceed(v1)
			end)
			
			return
		end
	end
	
	local function showDialog(ModerationDetail)
		-- upvalues: p1 (copy), Flag1 (ref), Flag (ref), FeatureRestrictionDisplayDirectSignalModule (upval), AbuseVector (copy)
		local PunishmentTypeDescription: string = ModerationDetail.punishmentTypeDescription
		local HasFoundAt: boolean = type(PunishmentTypeDescription) == "string" and string.find(PunishmentTypeDescription:lower(), "nudge", 1, true) ~= nil
		local HasFoundAt1: boolean = HasFoundAt
		
		if HasFoundAt1 then
			local InterventionId = ModerationDetail.interventionId
			HasFoundAt1 = ModerationDetail.acknowledgeable == true and type(InterventionId) == "string" and InterventionId ~= ""
		end
		local Flag2 = false
		local v1 = false
		local v2 = nil
		
		local function evaluate()
			-- upvalues: Flag2 (ref), v1 (ref), HasFoundAt1 (copy), v2 (ref), p1 (upval), Flag1 (upval), HasFoundAt (copy), Flag (upval)
			if not Flag2 then return end
			if not v1 or not HasFoundAt1 or v2 ~= nil then
				if not Flag1 then
					Flag1 = true
					
					if p1.onPhaseChanged then
						p1.onPhaseChanged("Settled")
					end
				end
				if HasFoundAt then
					if v2 == "Succeeded" then
						if not Flag then
							Flag = true
							local v3 = "Nudged"
							task.spawn(function()
								-- upvalues: p1 (upval), v3 (copy)
								p1.onProceed(v3)
							end)
							
							return
						end
						return
					elseif v2 == "Failed" then
						if Flag then return end
						Flag = true
						local OnRestricted1 = p1.onRestricted
						
						if OnRestricted1 then
							local v4 = "NudgeAcknowledgementFailed"
							task.spawn(function()
								-- upvalues: OnRestricted1 (copy), v4 (copy)
								OnRestricted1(v4)
							end)
							
							return
						end
					elseif v1 then
						if Flag then return end
						Flag = true
						local v5 = "Nudged"
						task.spawn(function()
							-- upvalues: p1 (upval), v5 (copy)
							p1.onProceed(v5)
						end)
					elseif Flag then return end
					Flag = true
					local OnRestrictedFunction = p1.onRestricted
					
					if OnRestrictedFunction then
						local v6 = "NudgeDismissedUnacknowledged"
						task.spawn(function()
							-- upvalues: OnRestrictedFunction (copy), v6 (copy)
							OnRestrictedFunction(v6)
						end)
						
						return
					end
				elseif Flag then return end
				Flag = true
				local OnRestricted = p1.onRestricted
				
				if OnRestricted then
					local v7 = "ActiveRestriction"
					task.spawn(function()
						-- upvalues: OnRestricted (copy), v7 (copy)
						OnRestricted(v7)
					end)
					
					return
				end
				return
			elseif p1.onPhaseChanged then
				p1.onPhaseChanged("Acknowledging")
			end
		end
		
		local Copy = table.clone(p1.dialogOptions or {})
		local OnAcknowledgementSuccessFunction = Copy.onAcknowledgementSuccess
		local OnAcknowledgementFailureFunction = Copy.onAcknowledgementFailure
		
		function Copy.onAcknowledgementSuccess()
			-- upvalues: v2 (ref), evaluate (copy), OnAcknowledgementSuccessFunction (copy)
			v2 = "Succeeded"
			evaluate()
			
			if OnAcknowledgementSuccessFunction then
				OnAcknowledgementSuccessFunction()
			end
		end
		
		function Copy.onAcknowledgementFailure()
			-- upvalues: v2 (ref), evaluate (copy), OnAcknowledgementFailureFunction (copy)
			v2 = "Failed"
			evaluate()
			
			if OnAcknowledgementFailureFunction then
				OnAcknowledgementFailureFunction()
			end
		end
		
		local Flag3 = false
		local Success, Result = pcall(function()
			-- upvalues: FeatureRestrictionDisplayDirectSignalModule (upval), AbuseVector (upval), ModerationDetail (copy), Copy (copy), Flag3 (ref), Flag2 (ref), v1 (ref), evaluate (copy)
			FeatureRestrictionDisplayDirectSignalModule:fire({
				abuseVector = AbuseVector,
				moderationDetail = ModerationDetail,
				options = Copy,
				onHandled = function()
					-- upvalues: Flag3 (upval)
					Flag3 = true
				end,
				onClosed = function(p2)
					-- upvalues: Flag2 (upval), v1 (upval), evaluate (upval)
					if not Flag2 then
						Flag2 = true
						v1 = p2
						evaluate()
						
						return
					end
				end
			})
		end)
		
		if not Success then
			warn(`runUnlessFeatureRestricted: a listener failed while showing the dialog: {Result}`)
		end
		if Flag3 then
			if p1.onPhaseChanged then
				p1.onPhaseChanged("ShowingDialog")
			end
			evaluate()
			
			return
		else
			if not Flag1 then
				Flag1 = true
				
				if p1.onPhaseChanged then
					p1.onPhaseChanged("Settled")
				end
			end
			if not Flag then
				Flag = true
				local v3 = "CheckFailed"
				task.spawn(function()
					-- upvalues: p1 (upval), v3 (copy)
					p1.onProceed(v3)
				end)
			end
		end
	end
	
	if p1.onPhaseChanged then
		p1.onPhaseChanged("Checking")
	end
	local Flag2 = false
	local ModerationDetailModule = GetModerationDetailModule({ abuseVector = AbuseVector })
	DelayedThread = task.delay(p1.timeoutSeconds or UFRRunUnlessFeatureRestrictedTimeoutMs / 1000, function()
		-- upvalues: DelayedThread (ref), Flag2 (ref), ModerationDetailModule (copy), Flag1 (ref), p1 (copy), Flag (ref)
		DelayedThread = nil
		
		if Flag2 then return end
		Flag2 = true
		ModerationDetailModule:cancel()
		
		if not Flag1 then
			Flag1 = true
			
			if p1.onPhaseChanged then
				p1.onPhaseChanged("Settled")
			end
		end
		if not Flag then
			Flag = true
			local v4 = "CheckFailed"
			task.spawn(function()
				-- upvalues: p1 (upval), v4 (copy)
				p1.onProceed(v4)
			end)
			
			return
		end
	end)
	
	local _ = function(): boolean
		-- upvalues: Flag2 (ref), DelayedThread (ref)
		if Flag2 then
			return false
		end
		Flag2 = true
		
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		return true
	end
	
	ModerationDetailModule:andThen(function(Result)
		-- upvalues: Flag2 (ref), DelayedThread (ref), Flag1 (ref), p1 (copy), Flag (ref), showDialog (copy)
		local Flag3 = nil
		if Flag2 then
			Flag3 = false
		else
			Flag2 = true
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Flag3 = true
		end
		if not Flag3 then return end
		if Result == nil or type(Result) == "table" and next(Result) == nil then
			if not Flag1 then
				Flag1 = true
				
				if p1.onPhaseChanged then
					p1.onPhaseChanged("Settled")
				end
			end
			if not Flag then
				Flag = true
				local v4 = "Clear"
				task.spawn(function()
					-- upvalues: p1 (upval), v4 (copy)
					p1.onProceed(v4)
				end)
				
				return
			end
			return
		else
			if type(Result) == "table" then
				showDialog(Result)
				
				return
			end
			if not Flag1 then
				Flag1 = true
				
				if p1.onPhaseChanged then
					p1.onPhaseChanged("Settled")
				end
			end
			if not Flag then
				Flag = true
				local v5 = "CheckFailed"
				task.spawn(function()
					-- upvalues: p1 (upval), v5 (copy)
					p1.onProceed(v5)
				end)
				
				return
			end
		end
	end, function()
		-- upvalues: Flag2 (ref), DelayedThread (ref), Flag1 (ref), p1 (copy), Flag (ref)
		local Flag3 = nil
		if Flag2 then
			Flag3 = false
		else
			Flag2 = true
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Flag3 = true
		end
		if Flag3 then
			if not Flag1 then
				Flag1 = true
				
				if p1.onPhaseChanged then
					p1.onPhaseChanged("Settled")
				end
			end
			if Flag then return end
			Flag = true
			local v4 = "CheckFailed"
			task.spawn(function()
				-- upvalues: p1 (upval), v4 (copy)
				p1.onProceed(v4)
			end)
		end
	end)
end