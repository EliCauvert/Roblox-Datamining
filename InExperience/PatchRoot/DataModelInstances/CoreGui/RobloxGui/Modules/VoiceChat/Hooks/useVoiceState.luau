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
local var1 = if localPlayer then localPlayer.UserId else 0
local var2 = if game:GetEngineFeature("VoiceChatSupported") then Enum.VoiceChatState else {
	Idle = 1,
	Joining = 2,
	JoiningRetry = 3,
	Joined = 4,
	Leaving = 5,
	Ended = 6,
	Failed = 7
}
local t = {
	[var2.Idle] = VOICE_STATE.HIDDEN,
	[var2.Joining] = VOICE_STATE.CONNECTING,
	[var2.JoiningRetry] = VOICE_STATE.CONNECTING,
	[var2.Joined] = VOICE_STATE.MUTED,
	[var2.Leaving] = VOICE_STATE.MUTED,
	[var2.Ended] = VOICE_STATE.HIDDEN,
	[var2.Failed] = VOICE_STATE.ERROR
}

local function _(p1)
	-- upvalues: t (ref), VOICE_STATE (ref)
	return if t[p1] then t[p1] else VOICE_STATE.MUTED
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

return function(p1, p2, p3)
	-- upvalues: default (ref), reactModule (ref), voiceStateContextModule (ref), VOICE_STATE (ref), var1 (ref), t (ref), var2 (write), blockedStatusChangedEvent (ref)
	local var3 = if p3 then p3.voiceChatServiceManager else default
	local var4 = reactModule.useContext(voiceStateContextModule.Context)
	local var5, var6 = reactModule.useState(VOICE_STATE.HIDDEN)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p1 (ref), p2 (ref), var6 (ref), VOICE_STATE (copy), var1 (copy), var5 (ref), t (copy), var3 (ref), var2 (copy), blockedStatusChangedEvent (copy)
		if var4.voiceEnabled and p1 and not p2 then
			local var7 = tonumber(p1)
			local var8 = tostring(p1)
			local var9 = var1 == var7
			local var10 = nil
			local t_1 = {}
			local var11 = false
			
			local function _(p4)
				-- upvalues: var11 (write), var6 (copy)
				if not var11 then
					var6(p4)
				end
			end
			
			local function setVoiceEnabled(value)
				-- upvalues: var5 (copy), var9 (ref), t (copy), VOICE_STATE (copy), var3 (copy), var8 (ref), var10 (write), var2 (copy), var11 (write), var6 (copy)
				local var12 = var5
				
				if var9 then
					var12 = if not t[value] then VOICE_STATE.MUTED else t[value]
				else
					local var13 = var3.participants[var8]
					
					if var13 and not var10 then
						local INACTIVE = VOICE_STATE.INACTIVE
						
						if var13.subscriptionFailed then
							INACTIVE = VOICE_STATE.ERROR
						elseif not var13.subscriptionCompleted then
							INACTIVE = VOICE_STATE.CONNECTING
						elseif var13.isMutedLocally then
							INACTIVE = VOICE_STATE.LOCAL_MUTED
						elseif var13.isMuted then
							INACTIVE = VOICE_STATE.MUTED
						elseif var13.isSignalActive then
							INACTIVE = VOICE_STATE.TALKING
						end
						var12 = INACTIVE
					end
				end
				if value == var2.Failed then
					if not var9 then
						var12 = VOICE_STATE.HIDDEN
					end
				elseif value == var2.Joined and not var3.localMuted and var9 then
					var12 = if var3.isTalking then VOICE_STATE.TALKING elseif var3.localMuted then VOICE_STATE.MUTED else VOICE_STATE.INACTIVE
				end
				if not var11 then
					var6(var12)
				end
			end
			
			setVoiceEnabled(var4.voiceState)
			delay(0, function()
				-- upvalues: var11 (write), setVoiceEnabled (ref), var4 (copy), var9 (ref), t_1 (ref), var3 (copy), VOICE_STATE (copy), var6 (copy), var8 (ref), var10 (write), var7 (ref), blockedStatusChangedEvent (copy)
				if var11 then return end
				setVoiceEnabled(var4.voiceState)
				
				if var9 then
					table.insert(t_1, var3.talkingChanged.Event:Connect(function(p4)
						-- upvalues: VOICE_STATE (copy), var11 (copy), var6 (copy)
						local var12 = if p4 then VOICE_STATE.TALKING else VOICE_STATE.INACTIVE
						
						if not var11 then
							var6(var12)
						end
					end))
					table.insert(t_1, var3.muteChanged.Event:Connect(function(p4)
						-- upvalues: VOICE_STATE (copy), var11 (copy), var6 (copy)
						local var12 = if p4 then VOICE_STATE.MUTED else VOICE_STATE.INACTIVE
						
						if not var11 then
							var6(var12)
						end
					end))
					
					return
				end
				table.insert(t_1, var3.participantsUpdate.Event:Connect(function(p4)
					-- upvalues: var8 (copy), var10 (copy), VOICE_STATE (copy), var11 (copy), var6 (copy)
					local var12 = p4[var8]
					
					if var12 and not var10 then
						local INACTIVE = VOICE_STATE.INACTIVE
						
						if var12.subscriptionFailed then
							INACTIVE = VOICE_STATE.ERROR
						elseif not var12.subscriptionCompleted then
							INACTIVE = VOICE_STATE.CONNECTING
						elseif var12.isMutedLocally then
							INACTIVE = VOICE_STATE.LOCAL_MUTED
						elseif var12.isMuted then
							INACTIVE = VOICE_STATE.MUTED
						elseif var12.isSignalActive then
							INACTIVE = VOICE_STATE.TALKING
						end
						local var13 = INACTIVE
						
						if var11 then
							return
						else
							var6(var13)
							
							return
						end
					else
						local HIDDEN = VOICE_STATE.HIDDEN
						
						if not var11 then
							var6(HIDDEN)
						end
					end
				end))
				table.insert(t_1, var3.participantLeft.Event:Connect(function(_, p4)
					-- upvalues: var7 (copy), VOICE_STATE (copy), var11 (copy), var6 (copy)
					if p4 == var7 then
						local HIDDEN = VOICE_STATE.HIDDEN
						
						if not var11 then
							var6(HIDDEN)
						end
					end
				end))
				table.insert(t_1, var3.participantJoined.Event:Connect(function(_, p4)
					-- upvalues: var7 (copy), VOICE_STATE (copy), var11 (copy), var6 (copy)
					if p4 == var7 then
						local HIDDEN = VOICE_STATE.HIDDEN
						
						if not var11 then
							var6(HIDDEN)
						end
					end
				end))
				table.insert(t_1, blockedStatusChangedEvent:Connect(function(p4, p5)
					-- upvalues: var7 (copy), var10 (copy), VOICE_STATE (copy), var11 (copy), var6 (copy), var3 (copy), var8 (copy)
					if var7 == p4 then
						if p5 then
							var10 = true
							local HIDDEN = VOICE_STATE.HIDDEN
							
							if var11 then
								return
							else
								var6(HIDDEN)
								
								return
							end
						else
							var10 = nil
							local var12 = var3.participants[var8]
							
							if var12 then
								local INACTIVE = VOICE_STATE.INACTIVE
								
								if var12.subscriptionFailed then
									INACTIVE = VOICE_STATE.ERROR
								elseif not var12.subscriptionCompleted then
									INACTIVE = VOICE_STATE.CONNECTING
								elseif var12.isMutedLocally then
									INACTIVE = VOICE_STATE.LOCAL_MUTED
								elseif var12.isMuted then
									INACTIVE = VOICE_STATE.MUTED
								elseif var12.isSignalActive then
									INACTIVE = VOICE_STATE.TALKING
								end
								local var13 = INACTIVE
								
								if var11 then
								else
									var6(var13)
									
									return
								end
							else
								local HIDDEN = VOICE_STATE.HIDDEN
								
								if not var11 then
									var6(HIDDEN)
								end
							end
						end
					end
				end))
			end)
			
			return function()
				-- upvalues: var11 (write), t_1 (ref)
				var11 = true
				delay(0, function()
					-- upvalues: t_1 (copy)
					for i, v in t_1 do
						v:disconnect()
					end
				end)
			end
		end
		var6(VOICE_STATE.HIDDEN)
		
		return function() end
	end, { p1, var4.voiceState, p2 == true })
	
	return var5
end