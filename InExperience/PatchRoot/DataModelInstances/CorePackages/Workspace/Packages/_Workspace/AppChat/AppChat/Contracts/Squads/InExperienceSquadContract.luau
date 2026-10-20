local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SetSquadPromptFunction = require(Parent.SquadsCore.Actions).SetSquadPrompt
local SquadRootViewType = require(Parent.SquadsCore.Enums).SquadRootViewType
local InExperienceAppChatModalModule = require(AppChat.App.InExperienceAppChatModal)
local SquadCoordinationExperienceJoinExperimentation = require(Parent.SocialExperiments).SquadCoordinationExperienceJoinExperimentation

return (require(Parent.SquadsCore.SquadExternalContractProvider).makeSquadContract(require(Parent.Cryo).Dictionary.union(require(script.Parent.SquadContract), {
	setSquadPrompt = function(p1, p2)
		-- upvalues: SetSquadPromptFunction (copy)
		p1:dispatch(SetSquadPromptFunction(p2))
	end,
	closeSquadPrompt = require(Parent.SquadsCore.Actions).CloseSquadPrompt,
	useSquadRootView = function()
		-- upvalues: ReactModule (copy), SquadCoordinationExperienceJoinExperimentation (copy), InExperienceAppChatModalModule (copy), SquadRootViewType (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled and InExperienceAppChatModalModule.default:getVisible() then SquadRootViewType.InExperienceAppChatModal else SquadRootViewType.None)
		ReactModule.useEffect(function()
			-- upvalues: InExperienceAppChatModalModule (upval), UseStateResult2 (copy), SquadRootViewType (upval)
			local EventConnection = InExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p1)
				-- upvalues: UseStateResult2 (upval), SquadRootViewType (upval)
				if p1 then
					UseStateResult2(SquadRootViewType.InExperienceAppChatModal)
					
					return
				else
					UseStateResult2(SquadRootViewType.None)
				end
			end)
			
			return function()
				-- upvalues: EventConnection (copy)
				if EventConnection then
					EventConnection:Disconnect()
				end
			end
		end, {})
		
		return UseStateResult
	end
})))