local var0 = if game:GetEngineFeature("VoiceChatSupported") then Enum.VoiceChatState.Ended else nil
local t = { voiceEnabled = false, voiceState = var0 }
local reactModule = require(game:GetService("CorePackages").Packages.React)
local default = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default
local var3 = reactModule.createContext(t)

return {
	Provider = function(p0)
		-- upvalues: reactModule (ref), t (ref), default (ref), var0 (ref), var3 (ref)
		local var4, var5 = reactModule.useState(t)
		
		local function updateVoiceState(_, p1)
			-- upvalues: var4 (ref), var5 (ref)
			if p1 ~= var4.voiceState then
				var5({
					voiceEnabled = p1 ~= Enum.VoiceChatState.Ended,
					voiceState = p1
				})
			end
		end
		
		reactModule.useEffect(function()
			-- upvalues: default (copy), var4 (ref), var5 (ref), updateVoiceState (ref), var0 (copy)
			local var7 = true
			local var8 = nil
			
			if game:GetEngineFeature("VoiceChatSupported") then
				default:asyncInit():andThen(function()
					-- upvalues: var7 (write), default (copy), var4 (copy), var5 (copy), var8 (write), updateVoiceState (copy)
					if var7 then
						default:SetupParticipantListeners()
						local service = default:getService()
						
						if service then
							local voiceChatState = service.VoiceChatState
							
							if voiceChatState ~= var4.voiceState then
								var5({
									voiceEnabled = voiceChatState ~= Enum.VoiceChatState.Ended,
									voiceState = voiceChatState
								})
							end
							var8 = service.StateChanged:Connect(updateVoiceState)
						end
					end
				end):catch(function()
					-- upvalues: var0 (copy), var4 (copy), var5 (copy)
					if var0 ~= var4.voiceState then
						var5({
							voiceEnabled = var0 ~= Enum.VoiceChatState.Ended,
							voiceState = var0
						})
					end
				end)
			end
			return function()
				-- upvalues: var7 (write), var8 (write)
				var7 = false
				
				if var8 then
					var8:Disconnect()
					var8 = nil
				end
			end
		end, {})
		
		return reactModule.createElement(var3.Provider, { value = var4 }, p0.children)
	end,
	Consumer = var3.Consumer,
	Context = var3,
	withVoiceState = function(p2)
		-- upvalues: reactModule (ref), var3 (ref)
		return reactModule.createElement(var3.Consumer, { render = p2 })
	end
}