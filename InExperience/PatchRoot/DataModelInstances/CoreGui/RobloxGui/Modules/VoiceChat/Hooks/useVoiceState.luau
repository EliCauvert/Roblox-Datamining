local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local blockedStatusChangedEvent = require(corePackagesService.Workspace.Packages.BlockingUtility):GetBlockedStatusChangedEvent()
local default = require(script.Parent.Parent.VoiceChatServiceManager).default
local voiceStateContextModule = require(robloxGui.Modules.VoiceChat.VoiceStateContext)
local VOICE_STATE = require(corePackagesService.Workspace.Packages.VoiceChat).Constants.VOICE_STATE
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
local var6 = if localPlayer then localPlayer.UserId else 0
local var7 = if game:GetEngineFeature("VoiceChatSupported") then Enum.VoiceChatState else {
	Idle = 1,
	Joining = 2,
	JoiningRetry = 3,
	Joined = 4,
	Leaving = 5,
	Ended = 6,
	Failed = 7
}
local t = {
	[var7.Idle] = VOICE_STATE.HIDDEN,
	[var7.Joining] = VOICE_STATE.CONNECTING,
	[var7.JoiningRetry] = VOICE_STATE.CONNECTING,
	[var7.Joined] = VOICE_STATE.MUTED,
	[var7.Leaving] = VOICE_STATE.MUTED,
	[var7.Ended] = VOICE_STATE.HIDDEN,
	[var7.Failed] = VOICE_STATE.ERROR
}

local function _(p0)
	-- upvalues: t (ref), VOICE_STATE (ref)
	return if t[p0] then t[p0] else VOICE_STATE.MUTED
end

local _ = function(p1)
	-- upvalues: VOICE_STATE (ref)
	local INACTIVE = VOICE_STATE.INACTIVE
	
	if p1.subscriptionFailed then
		INACTIVE = VOICE_STATE.ERROR
		
		return INACTIVE
	elseif not p1.subscriptionCompleted then
		INACTIVE = VOICE_STATE.CONNECTING
		
		return INACTIVE
	elseif p1.isMutedLocally then
		INACTIVE = VOICE_STATE.LOCAL_MUTED
		
		return INACTIVE
	elseif p1.isMuted then
		INACTIVE = VOICE_STATE.MUTED
		
		return INACTIVE
	elseif p1.isSignalActive then
		INACTIVE = VOICE_STATE.TALKING
	end
	return INACTIVE
end

return function(p2, p3, p4)
	-- upvalues: default (ref), reactModule (ref), voiceStateContextModule (ref), VOICE_STATE (ref), var6 (ref), t (ref), var7 (write), blockedStatusChangedEvent (ref)
	local var9 = if p4 then p4.voiceChatServiceManager else default
	local var10 = reactModule.useContext(voiceStateContextModule.Context)
	local var11, var12 = reactModule.useState(VOICE_STATE.HIDDEN)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), p2 (ref), p3 (ref), var12 (ref), VOICE_STATE (copy), var6 (copy), var11 (ref), t (copy), var9 (ref), var7 (copy), blockedStatusChangedEvent (copy)
		if var10.voiceEnabled and p2 and not p3 then
			local var13 = tonumber(p2)
			local var14 = tostring(p2)
			local var15 = var6 == var13
			local var16 = nil
			local t_1 = {}
			local var18 = false
			
			local function _(p5)
				-- upvalues: var18 (write), var12 (copy)
				if not var18 then
					var12(p5)
				end
			end
			
			local function setVoiceEnabled(value)
				-- upvalues: var11 (copy), var15 (ref), t (copy), VOICE_STATE (copy), var9 (copy), var14 (ref), var16 (write), var7 (copy), var18 (write), var12 (copy)
				local var20 = var11
				
				if var15 then
					var20 = if not t[value] then VOICE_STATE.MUTED else t[value]
				else
					local var21 = var9.participants[var14]
					
					if var21 and not var16 then
						local INACTIVE = VOICE_STATE.INACTIVE
						
						if var21.subscriptionFailed then
							INACTIVE = VOICE_STATE.ERROR
						elseif not var21.subscriptionCompleted then
							INACTIVE = VOICE_STATE.CONNECTING
						elseif var21.isMutedLocally then
							INACTIVE = VOICE_STATE.LOCAL_MUTED
						elseif var21.isMuted then
							INACTIVE = VOICE_STATE.MUTED
						elseif var21.isSignalActive then
							INACTIVE = VOICE_STATE.TALKING
						end
						var20 = INACTIVE
					end
				end
				if value == var7.Failed then
					if not var15 then
						var20 = VOICE_STATE.HIDDEN
					end
				elseif value == var7.Joined and not var9.localMuted and var15 then
					var20 = if var9.isTalking then VOICE_STATE.TALKING elseif var9.localMuted then VOICE_STATE.MUTED else VOICE_STATE.INACTIVE
				end
				if not var18 then
					var12(var20)
				end
			end
			
			setVoiceEnabled(var10.voiceState)
			delay(0, function()
				-- upvalues: var18 (write), setVoiceEnabled (ref), var10 (copy), var15 (ref), t_1 (ref), var9 (copy), VOICE_STATE (copy), var12 (copy), var14 (ref), var16 (write), var13 (ref), blockedStatusChangedEvent (copy)
				if var18 then return end
				setVoiceEnabled(var10.voiceState)
				
				if var15 then
					table.insert(t_1, var9.talkingChanged.Event:Connect(function(p6)
						-- upvalues: VOICE_STATE (copy), var18 (copy), var12 (copy)
						local var22 = if p6 then VOICE_STATE.TALKING else VOICE_STATE.INACTIVE
						
						if not var18 then
							var12(var22)
						end
					end))
					table.insert(t_1, var9.muteChanged.Event:Connect(function(p7)
						-- upvalues: VOICE_STATE (copy), var18 (copy), var12 (copy)
						local var23 = if p7 then VOICE_STATE.MUTED else VOICE_STATE.INACTIVE
						
						if not var18 then
							var12(var23)
						end
					end))
					
					return
				end
				table.insert(t_1, var9.participantsUpdate.Event:Connect(function(p8)
					-- upvalues: var14 (copy), var16 (copy), VOICE_STATE (copy), var18 (copy), var12 (copy)
					local var24 = p8[var14]
					
					if var24 and not var16 then
						local INACTIVE = VOICE_STATE.INACTIVE
						
						if var24.subscriptionFailed then
							INACTIVE = VOICE_STATE.ERROR
						elseif not var24.subscriptionCompleted then
							INACTIVE = VOICE_STATE.CONNECTING
						elseif var24.isMutedLocally then
							INACTIVE = VOICE_STATE.LOCAL_MUTED
						elseif var24.isMuted then
							INACTIVE = VOICE_STATE.MUTED
						elseif var24.isSignalActive then
							INACTIVE = VOICE_STATE.TALKING
						end
						local var25 = INACTIVE
						
						if var18 then
							return
						else
							var12(var25)
							
							return
						end
					else
						local HIDDEN = VOICE_STATE.HIDDEN
						
						if not var18 then
							var12(HIDDEN)
						end
					end
				end))
				table.insert(t_1, var9.participantLeft.Event:Connect(function(_, p9)
					-- upvalues: var13 (copy), VOICE_STATE (copy), var18 (copy), var12 (copy)
					if p9 == var13 then
						local HIDDEN = VOICE_STATE.HIDDEN
						
						if not var18 then
							var12(HIDDEN)
						end
					end
				end))
				table.insert(t_1, var9.participantJoined.Event:Connect(function(_, p10)
					-- upvalues: var13 (copy), VOICE_STATE (copy), var18 (copy), var12 (copy)
					if p10 == var13 then
						local HIDDEN = VOICE_STATE.HIDDEN
						
						if not var18 then
							var12(HIDDEN)
						end
					end
				end))
				table.insert(t_1, blockedStatusChangedEvent:Connect(function(p11, p12)
					-- upvalues: var13 (copy), var16 (copy), VOICE_STATE (copy), var18 (copy), var12 (copy), var9 (copy), var14 (copy)
					if var13 == p11 then
						if p12 then
							var16 = true
							local HIDDEN = VOICE_STATE.HIDDEN
							
							if var18 then
								return
							else
								var12(HIDDEN)
								
								return
							end
						else
							var16 = nil
							local var26 = var9.participants[var14]
							
							if var26 then
								local INACTIVE = VOICE_STATE.INACTIVE
								
								if var26.subscriptionFailed then
									INACTIVE = VOICE_STATE.ERROR
								elseif not var26.subscriptionCompleted then
									INACTIVE = VOICE_STATE.CONNECTING
								elseif var26.isMutedLocally then
									INACTIVE = VOICE_STATE.LOCAL_MUTED
								elseif var26.isMuted then
									INACTIVE = VOICE_STATE.MUTED
								elseif var26.isSignalActive then
									INACTIVE = VOICE_STATE.TALKING
								end
								local var27 = INACTIVE
								
								if var18 then
								else
									var12(var27)
									
									return
								end
							else
								local HIDDEN = VOICE_STATE.HIDDEN
								
								if not var18 then
									var12(HIDDEN)
								end
							end
						end
					end
				end))
			end)
			
			return function()
				-- upvalues: var18 (write), t_1 (ref)
				var18 = true
				delay(0, function()
					-- upvalues: t_1 (copy)
					for i, v in t_1 do
						v:disconnect()
					end
				end)
			end
		end
		var12(VOICE_STATE.HIDDEN)
		
		return function() end
	end, { p2, var10.voiceState, p3 == true })
	
	return var11
end