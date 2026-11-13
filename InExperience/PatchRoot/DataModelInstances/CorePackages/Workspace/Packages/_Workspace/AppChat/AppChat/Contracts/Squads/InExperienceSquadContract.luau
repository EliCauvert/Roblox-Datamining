local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SocialExperimentsModule = require(Parent.SocialExperiments)
local SquadExternalContractProviderModule = require(Parent.SquadsCore.SquadExternalContractProvider)
local SetSquadPromptFunction = require(Parent.SquadsCore.Actions).SetSquadPrompt
local CloseSquadPrompt = require(Parent.SquadsCore.Actions).CloseSquadPrompt
local SquadRootViewType = require(Parent.SquadsCore.Enums).SquadRootViewType
local MakeSquadContractFunction = SquadExternalContractProviderModule.makeSquadContract
local InExperienceAppChatModalModule = require(AppChat.App.InExperienceAppChatModal)
local SquadCoordinationExperienceJoinExperimentation = SocialExperimentsModule.SquadCoordinationExperienceJoinExperimentation

return (MakeSquadContractFunction(CryoModule.Dictionary.union(require(script.Parent.SquadContract), {
	setSquadPrompt = function(p1, p2)
		-- upvalues: SetSquadPromptFunction (copy)
		p1:dispatch(SetSquadPromptFunction(p2))
	end,
	closeSquadPrompt = CloseSquadPrompt,
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