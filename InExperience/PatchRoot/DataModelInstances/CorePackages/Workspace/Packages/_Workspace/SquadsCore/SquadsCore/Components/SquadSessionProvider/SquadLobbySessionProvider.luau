local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local sessionService = game:GetService("SessionService")
local loggerModule = require(squadsCore.Logger)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local squadLocationEnumModule = require(squadsCore.Enums.SquadLocationEnum)
local squadRootViewTypeModule = require(squadsCore.Enums.SquadRootViewType)
local squadViewFlagsModule = require(squadsCore.Components.SquadExternalContractProvider.SquadViewFlags)
local reactModule = require(parent.React)
local sessionType = require(parent.RobloxAppSessionization).SessionType
local var8 = reactModule.createContext({ updateMetadata = function() end })

return {
	Context = var8,
	Provider = function(p0)
		-- upvalues: reactModule (ref), squadExternalContractContextModule (ref), squadLocationEnumModule (ref), sessionType (ref), squadViewFlagsModule (ref), squadRootViewTypeModule (ref), sessionService (ref), loggerModule (ref), var8 (ref)
		local var9 = reactModule.useContext(squadExternalContractContextModule)
		local var10 = if var9.squadLocation == squadLocationEnumModule.InExperience then sessionType.StructuralIdentifier.SquadLobbyPageInExpSessionInfo else sessionType.StructuralIdentifier.SquadLobbyPageUASessionInfo
		local var11 = bit32.band(var9.useSquadViewFlags(), squadViewFlagsModule.SquadLobby) ~= 0 and var9.useSquadRootView() ~= squadRootViewTypeModule.None
		local var12 = reactModule.useCallback(function()
			-- upvalues: sessionType (copy), sessionService (copy), var10 (ref)
			local level1 = sessionType.StructuralIdentifier.Level1
			
			if level1 and sessionService:SessionExists(level1) and not sessionService:SessionExists(var10) then
				sessionService:SetSession(level1, var10, var10)
			end
		end, { var10, var9.squadLocation })
		local var13 = reactModule.useCallback(function()
			-- upvalues: sessionService (copy), var10 (ref)
			if sessionService:SessionExists(var10) then
				sessionService:RemoveSession(var10)
			end
		end, { var10 })
		local var14 = reactModule.useCallback(function(p1, p2)
			-- upvalues: sessionService (copy), var10 (ref), loggerModule (copy)
			if sessionService:SessionExists(var10) then
				sessionService:SetMetadata(var10, p1, p2)
				
				return
			end
			loggerModule:warning("Squad {} session does not exist, cannot update metadata with key {}, value {}", var10, p1, p2)
		end, { var10 })
		reactModule.useEffect(function()
			-- upvalues: var11 (ref), var12 (ref), var13 (ref)
			if var11 then
				var12()
				
				return function()
					-- upvalues: var13 (copy)
					var13()
				end
			end
			return function() end
		end, { var11, var12, var13 })
		
		return reactModule.createElement(var8.Provider, { value = { updateMetadata = var14 } }, p0.children)
	end
}