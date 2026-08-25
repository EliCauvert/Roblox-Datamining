local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local socialExperimentsModule = require(parent.SocialExperiments)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local enumsModule = require(parent.SquadsCore.Enums)
local setSquadPrompt = require(parent.SquadsCore.Actions).SetSquadPrompt
local closeSquadPrompt = require(parent.SquadsCore.Actions).CloseSquadPrompt
local squadRootViewType = enumsModule.SquadRootViewType
local makeSquadContract = squadExternalContractProviderModule.makeSquadContract
local inExperienceAppChatModalModule = require(appChat.App.InExperienceAppChatModal)
local squadCoordinationExperienceJoinExperimentation = socialExperimentsModule.SquadCoordinationExperienceJoinExperimentation

return makeSquadContract(cryoModule.Dictionary.union(require(script.Parent.SquadContract), {
	setSquadPrompt = function(p0, p1)
		-- upvalues: setSquadPrompt (ref)
		p0:dispatch(setSquadPrompt(p1))
	end,
	closeSquadPrompt = closeSquadPrompt,
	useSquadRootView = function()
		-- upvalues: reactModule (ref), squadCoordinationExperienceJoinExperimentation (ref), inExperienceAppChatModalModule (ref), squadRootViewType (ref)
		local useState = reactModule.useState
		local var7 = if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled and inExperienceAppChatModalModule.default:getVisible() then squadRootViewType.InExperienceAppChatModal else squadRootViewType.None
		useState, var7 = useState(var7)
		reactModule.useEffect(function()
			-- upvalues: inExperienceAppChatModalModule (copy), var7 (ref), squadRootViewType (copy)
			local eventConnection = inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p2)
				-- upvalues: var7 (copy), squadRootViewType (copy)
				if p2 then
					var7(squadRootViewType.InExperienceAppChatModal)
					
					return
				end
				var7(squadRootViewType.None)
			end)
			
			return function()
				-- upvalues: eventConnection (ref)
				if eventConnection then
					eventConnection:Disconnect()
				end
			end
		end, {})
		
		return useState
	end
}))