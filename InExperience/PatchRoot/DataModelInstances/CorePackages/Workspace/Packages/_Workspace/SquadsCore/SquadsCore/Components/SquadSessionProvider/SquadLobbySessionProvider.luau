local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local SessionService = game:GetService("SessionService")
local LoggerModule = require(SquadsCore.Logger)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local SquadLocationEnumModule = require(SquadsCore.Enums.SquadLocationEnum)
local SquadRootViewTypeModule = require(SquadsCore.Enums.SquadRootViewType)
local SquadViewFlagsModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadViewFlags)
local ReactModule = require(Parent.React)
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local Context = ReactModule.createContext({ updateMetadata = function() --[[ Line: 29 ]] end })

return {
	Context = Context,
	Provider = function(p1) --[[ Line: 32 ]]
		-- upvalues: ReactModule (copy), SquadExternalContractContextModule (copy), SquadLocationEnumModule (copy), SessionType (copy), SquadViewFlagsModule (copy), SquadRootViewTypeModule (copy), SessionService (copy), LoggerModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
		local UseSquadRootViewResult = UseContextResult.useSquadRootView()
		local SquadLobbyPageInExpSessionInfo = if UseContextResult.squadLocation == SquadLocationEnumModule.InExperience then SessionType.StructuralIdentifier.SquadLobbyPageInExpSessionInfo else SessionType.StructuralIdentifier.SquadLobbyPageUASessionInfo
		local IsNotUseSquadRootViewResultMatch: boolean = bit32.band(UseContextResult.useSquadViewFlags(), SquadViewFlagsModule.SquadLobby) ~= 0 and UseSquadRootViewResult ~= SquadRootViewTypeModule.None
		local UseResult = ReactModule.useCallback(function() --[[ Line: 44 ]]
			-- upvalues: SessionType (upval), SessionService (upval), SquadLobbyPageInExpSessionInfo (copy)
			local Level1 = SessionType.StructuralIdentifier.Level1
			
			if Level1 and SessionService:SessionExists(Level1) and not SessionService:SessionExists(SquadLobbyPageInExpSessionInfo) then
				SessionService:SetSession(Level1, SquadLobbyPageInExpSessionInfo, SquadLobbyPageInExpSessionInfo)
			end
		end, {
			SquadLobbyPageInExpSessionInfo,
			UseContextResult.squadLocation
		})
		local UseResult1 = ReactModule.useCallback(function() --[[ Line: 52 ]]
			-- upvalues: SessionService (upval), SquadLobbyPageInExpSessionInfo (copy)
			if SessionService:SessionExists(SquadLobbyPageInExpSessionInfo) then
				SessionService:RemoveSession(SquadLobbyPageInExpSessionInfo)
			end
		end, { SquadLobbyPageInExpSessionInfo })
		local UseResult2 = ReactModule.useCallback(function(Key, Value) --[[ Line: 58 ]]
			-- upvalues: SessionService (upval), SquadLobbyPageInExpSessionInfo (copy), LoggerModule (upval)
			if SessionService:SessionExists(SquadLobbyPageInExpSessionInfo) then
				SessionService:SetMetadata(SquadLobbyPageInExpSessionInfo, Key, Value)
				
				return
			else
				LoggerModule:warning("Squad {} session does not exist, cannot update metadata with key {}, value {}", SquadLobbyPageInExpSessionInfo, Key, Value)
			end
		end, { SquadLobbyPageInExpSessionInfo })
		ReactModule.useEffect(function() --[[ Line: 71 ]]
			-- upvalues: IsNotUseSquadRootViewResultMatch (copy), UseResult (copy), UseResult1 (copy)
			if IsNotUseSquadRootViewResultMatch then
				UseResult()
				
				return function() --[[ Line: 75 ]]
					-- upvalues: UseResult1 (upval)
					UseResult1()
				end
			else
				return function() --[[ Line: 80 ]] end
			end
		end, { IsNotUseSquadRootViewResultMatch, UseResult, UseResult1 })
		
		return ReactModule.createElement(Context.Provider, { value = { updateMetadata = UseResult2 } }, p1.children)
	end
}