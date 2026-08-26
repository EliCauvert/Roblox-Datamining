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
local var1 = reactModule.createContext({ updateMetadata = function() end })

return {
	Context = var1,
	Provider = function(p1)
		-- upvalues: reactModule (ref), squadExternalContractContextModule (ref), squadLocationEnumModule (ref), sessionType (ref), squadViewFlagsModule (ref), squadRootViewTypeModule (ref), sessionService (ref), loggerModule (ref), var1 (ref)
		local var2 = reactModule.useContext(squadExternalContractContextModule)
		local var3 = if var2.squadLocation == squadLocationEnumModule.InExperience then sessionType.StructuralIdentifier.SquadLobbyPageInExpSessionInfo else sessionType.StructuralIdentifier.SquadLobbyPageUASessionInfo
		local var4 = bit32.band(var2.useSquadViewFlags(), squadViewFlagsModule.SquadLobby) ~= 0 and var2.useSquadRootView() ~= squadRootViewTypeModule.None
		local var5 = reactModule.useCallback(function()
			-- upvalues: sessionType (copy), sessionService (copy), var3 (ref)
			local level1 = sessionType.StructuralIdentifier.Level1
			
			if level1 and sessionService:SessionExists(level1) and not sessionService:SessionExists(var3) then
				sessionService:SetSession(level1, var3, var3)
			end
		end, { var3, var2.squadLocation })
		local var6 = reactModule.useCallback(function()
			-- upvalues: sessionService (copy), var3 (ref)
			if sessionService:SessionExists(var3) then
				sessionService:RemoveSession(var3)
			end
		end, { var3 })
		local var7 = reactModule.useCallback(function(p2, p3)
			-- upvalues: sessionService (copy), var3 (ref), loggerModule (copy)
			if sessionService:SessionExists(var3) then
				sessionService:SetMetadata(var3, p2, p3)
				
				return
			end
			loggerModule:warning("Squad {} session does not exist, cannot update metadata with key {}, value {}", var3, p2, p3)
		end, { var3 })
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), var5 (ref), var6 (ref)
			if var4 then
				var5()
				
				return function()
					-- upvalues: var6 (copy)
					var6()
				end
			end
			return function() end
		end, { var4, var5, var6 })
		
		return reactModule.createElement(var1.Provider, { value = { updateMetadata = var7 } }, p1.children)
	end
}