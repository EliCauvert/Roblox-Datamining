local var1 = if game:GetEngineFeature("VoiceChatSupported") then Enum.VoiceChatState.Ended else nil
local t = { voiceEnabled = false, voiceState = var1 }
local reactModule = require(game:GetService("CorePackages").Packages.React)
local default = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default
local var2 = reactModule.createContext(t)

return {
	Provider = function(p1)
		-- upvalues: reactModule (ref), t (ref), default (ref), var1 (ref), var2 (ref)
		local var3, var4 = reactModule.useState(t)
		
		local function updateVoiceState(_, p2)
			-- upvalues: var3 (ref), var4 (ref)
			if p2 ~= var3.voiceState then
				var4({
					voiceEnabled = p2 ~= Enum.VoiceChatState.Ended,
					voiceState = p2
				})
			end
		end
		
		reactModule.useEffect(function()
			-- upvalues: default (copy), var3 (ref), var4 (ref), updateVoiceState (ref), var1 (copy)
			local var5 = true
			local var6 = nil
			
			if game:GetEngineFeature("VoiceChatSupported") then
				default:asyncInit():andThen(function()
					-- upvalues: var5 (write), default (copy), var3 (copy), var4 (copy), var6 (write), updateVoiceState (copy)
					if var5 then
						default:SetupParticipantListeners()
						local service = default:getService()
						
						if service then
							local voiceChatState = service.VoiceChatState
							
							if voiceChatState ~= var3.voiceState then
								var4({
									voiceEnabled = voiceChatState ~= Enum.VoiceChatState.Ended,
									voiceState = voiceChatState
								})
							end
							var6 = service.StateChanged:Connect(updateVoiceState)
						end
					end
				end):catch(function()
					-- upvalues: var1 (copy), var3 (copy), var4 (copy)
					if var1 ~= var3.voiceState then
						var4({
							voiceEnabled = var1 ~= Enum.VoiceChatState.Ended,
							voiceState = var1
						})
					end
				end)
			end
			return function()
				-- upvalues: var5 (write), var6 (write)
				var5 = false
				
				if var6 then
					var6:Disconnect()
					var6 = nil
				end
			end
		end, {})
		
		return reactModule.createElement(var2.Provider, { value = var3 }, p1.children)
	end,
	Consumer = var2.Consumer,
	Context = var2,
	withVoiceState = function(p1)
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.createElement(var2.Consumer, { render = p1 })
	end
}