local Ended = game:GetEngineFeature("VoiceChatSupported") and Enum.VoiceChatState.Ended or nil
local config = { voiceEnabled = false, voiceState = Ended }
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local Default = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default
local Context = ReactModule.createContext(config)

return {
	Provider = function(p1) --[[ Line: 49 ]]
		-- upvalues: ReactModule (copy), config (copy), Default (copy), Ended (copy), Context (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(config)
		
		local function updateVoiceState(_, NewState) --[[ Line: 52 ]]
			-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
			if NewState ~= UseStateResult.voiceState then
				UseStateResult2({
					voiceEnabled = NewState ~= Enum.VoiceChatState.Ended,
					voiceState = NewState
				})
			end
		end
		
		ReactModule.useEffect(function() --[[ Line: 62 ]]
			-- upvalues: Default (upval), UseStateResult (copy), UseStateResult2 (copy), updateVoiceState (copy), Ended (upval)
			local Flag = true
			local StateChangedConnection = nil
			
			if game:GetEngineFeature("VoiceChatSupported") then
				Default:asyncInit():andThen(function() --[[ Line: 67 ]]
					-- upvalues: Flag (ref), Default (upval), UseStateResult (upval), UseStateResult2 (upval), StateChangedConnection (ref), updateVoiceState (upval)
					if Flag then
						Default:SetupParticipantListeners()
						local Service = Default:getService()
						
						if Service then
							local VoiceChatState = Service.VoiceChatState
							
							if VoiceChatState ~= UseStateResult.voiceState then
								UseStateResult2({
									voiceEnabled = VoiceChatState ~= Enum.VoiceChatState.Ended,
									voiceState = VoiceChatState
								})
							end
							StateChangedConnection = Service.StateChanged:Connect(updateVoiceState)
						end
					end
				end):catch(function() --[[ Line: 77 ]]
					-- upvalues: Ended (upval), UseStateResult (upval), UseStateResult2 (upval)
					if Ended ~= UseStateResult.voiceState then
						UseStateResult2({
							voiceEnabled = Ended ~= Enum.VoiceChatState.Ended,
							voiceState = Ended
						})
					end
				end)
			end
			return function() --[[ Line: 82 ]]
				-- upvalues: Flag (ref), StateChangedConnection (ref)
				Flag = false
				
				if StateChangedConnection then
					StateChangedConnection:Disconnect()
					StateChangedConnection = nil
				end
			end
		end, {})
		
		return ReactModule.createElement(Context.Provider, { value = UseStateResult }, p1.children)
	end,
	Consumer = Context.Consumer,
	Context = Context,
	withVoiceState = function(Render) --[[ Line: 100 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.createElement(Context.Consumer, { render = Render })
	end
}