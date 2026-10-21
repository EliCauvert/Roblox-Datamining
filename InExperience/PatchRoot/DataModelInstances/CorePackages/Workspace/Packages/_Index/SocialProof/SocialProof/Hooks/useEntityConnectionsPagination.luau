local SocialProof = script:FindFirstAncestor("SocialProof")
local Parent = SocialProof.Parent
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local CryoModule = require(Parent.Cryo)
local NetworkingSocialProofModule = require(SocialProof.Networking.NetworkingSocialProof)
local ConstantsModule = require(SocialProof.Common.Constants)
local _ = require(SocialProof.Common.Enums)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseStateFunction (copy), UseRefFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), GetDeepValueFunction (copy), UseEffectFunction (copy), CryoModule (copy), UseCallbackFunction (copy), NetworkingSocialProofModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local EntityId = p1.entityId
	local EntityType = p1.entityType
	local ConnectionType = p1.connectionType
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(true)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(nil)
	local UseStateResult4, UseStateResult2_3 = UseStateFunction("")
	local UseStateResult5, UseStateResult2_4 = UseStateFunction({})
	local UseRefResult = UseRefFunction(true)
	local UseStateResult6, UseStateResult2_5 = UseStateFunction(0)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval), ConnectionType (copy), EntityType (copy), EntityId (copy), GetDeepValueFunction (upval)
		return GetDeepValueFunction(p2[ConstantsModule.RODUX_KEY].ConnectionsByEntityId or {}, (string.format("%s.%s.%s", ConnectionType, EntityType, EntityId))) or {}
	end)
	UseEffectFunction(function()
		-- upvalues: UseSelectorResult (copy), UseStateResult5 (copy), UseStateResult2_5 (copy), UseStateResult2_1 (copy), UseStateResult2_3 (copy), UseStateResult2_4 (copy), CryoModule (upval)
		if UseSelectorResult.userIds then
			local UserIds = UseSelectorResult.userIds
			local v1 = #UseStateResult5 + #UserIds
			local TotalConnections = UseSelectorResult.totalConnections or 0
			local IsTotalConnectionsAbove = v1 < TotalConnections
			UseStateResult2_5(TotalConnections)
			UseStateResult2_1(IsTotalConnectionsAbove)
			UseStateResult2_3((tostring(v1)))
			UseStateResult2_4(function(p2)
				-- upvalues: CryoModule (upval), UserIds (copy)
				return CryoModule.List.join(p2, UserIds)
			end)
			
			return
		end
	end, {
		UseSelectorResult.userIds,
		UseSelectorResult.totalConnections
	})
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UseStateResult2 (copy), UseStateResult2_2 (copy), EntityId (copy), EntityType (copy), ConnectionType (copy), UseStateResult4 (copy), UseDispatchResult (copy), NetworkingSocialProofModule (upval), UseRefResult (copy)
		if not UseStateResult and UseStateResult1 then
			UseStateResult2(true)
			UseStateResult2_2(nil)
			UseDispatchResult(NetworkingSocialProofModule.GetConnectionsByEntityId.API({
				entityId = EntityId,
				entityType = EntityType,
				connectionType = ConnectionType,
				cursor = UseStateResult4
			})):andThen(function()
				-- upvalues: UseRefResult (upval), UseStateResult2 (upval)
				if UseRefResult.current then
					UseStateResult2(false)
				end
			end):catch(function(Err)
				-- upvalues: UseRefResult (upval), UseStateResult2 (upval), UseStateResult2_2 (upval)
				if UseRefResult.current then
					UseStateResult2(false)
					UseStateResult2_2(Err)
				end
			end)
			
			return
		end
	end, {
		UseStateResult4, UseStateResult, UseStateResult1, EntityId, EntityType,
		ConnectionType, UseDispatchResult
	})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_4 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), UseStateResult2_2 (copy)
		UseStateResult2_4({})
		UseStateResult2_1(true)
		UseStateResult2(false)
		UseStateResult2_2(nil)
	end, {})
	UseEffectFunction(function()
		-- upvalues: EntityId (copy), EntityType (copy), ConnectionType (copy), UseSelectorResult (copy), UseCallbackResult (copy)
		if EntityId and EntityType and ConnectionType and not UseSelectorResult.userIds then
			UseCallbackResult()
		end
	end, {
		EntityId,
		EntityType,
		ConnectionType,
		UseSelectorResult.userIds
	})
	
	return {
		userIds = UseStateResult5,
		isLoading = UseStateResult,
		hasMore = UseStateResult1,
		error = UseStateResult3,
		fetchPage = UseCallbackResult,
		reset = UseCallbackResult1,
		totalConnections = UseStateResult6
	}
end