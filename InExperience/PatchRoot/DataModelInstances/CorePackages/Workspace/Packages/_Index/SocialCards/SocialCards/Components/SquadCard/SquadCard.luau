local SocialCards = script:FindFirstAncestor("SocialCards")
local Parent = SocialCards.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local HttpModule = require(Parent.Http)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ReactModule = require(Parent.React)
local SquadExternalContractProviderModule = require(Parent.SquadsCore.SquadExternalContractProvider)
local UseCurrentSquadSelectorFunction = require(Parent.RoduxSquads).Hooks.useCurrentSquadSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local NetworkingSquads = require(Parent.SquadsCore.Http).NetworkingSquads
local SquadExternalContractContext = SquadExternalContractProviderModule.SquadExternalContractContext
local SquadViewFlags = SquadExternalContractProviderModule.SquadViewFlags
local ClearIntervalFunction = LuauPolyfillModule.clearInterval
local SetIntervalFunction = LuauPolyfillModule.setInterval
local SquadStartedCardModule = require(SocialCards.Components.SquadCard.SquadStartedCard)
local SquadEndedCardModule = require(SocialCards.Components.SquadCard.SquadEndedCard)

return function(p1) --[[ Line: 35 | Named "SquadCard" ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), UseCurrentSquadSelectorFunction (copy), CryoModule (copy), UseNavigationFocusFunction (copy), SquadViewFlags (copy), NetworkingSquads (copy), HttpModule (copy), SetIntervalFunction (copy), ClearIntervalFunction (copy), SquadStartedCardModule (copy), SquadEndedCardModule (copy), FoundationModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local IsSquadIdMatch: boolean = if UseCurrentSquadSelectorResult then UseCurrentSquadSelectorResult.squadId == p1.group_up_id else false
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 48 ]]
		-- upvalues: IsSquadIdMatch (copy), UseCurrentSquadSelectorResult (copy), CryoModule (upval), UseLocalUserIdResult (copy)
		if not IsSquadIdMatch then
			return CryoModule.List.filter(p2, function(p3): boolean --[[ Line: 56 ]]
				-- upvalues: UseLocalUserIdResult (upval)
				return tostring(p3) ~= UseLocalUserIdResult
			end)
		end
		local List = {}
		
		for _, member in ipairs(UseCurrentSquadSelectorResult.members) do
			table.insert(List, member.userId)
		end
		return List
	end, {
		IsSquadIdMatch,
		UseCurrentSquadSelectorResult,
		UseLocalUserIdResult
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.is_alive)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(UseResult(p1.participant_user_ids))
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseNavigationFocusResult1 = IsSquadIdMatch and UseNavigationFocusResult
	ReactModule.useEffect(function() --[[ Line: 68 ]]
		-- upvalues: UseNavigationFocusResult1 (copy), UseContextResult (copy), SquadViewFlags (upval)
		if UseNavigationFocusResult1 then
			UseContextResult.updateSquadViewFlags(SquadViewFlags.SquadSystemMessage, true)
		end
		return function() --[[ Line: 72 ]]
			-- upvalues: UseNavigationFocusResult1 (upval), UseContextResult (upval), SquadViewFlags (upval)
			if UseNavigationFocusResult1 then
				UseContextResult.updateSquadViewFlags(SquadViewFlags.SquadSystemMessage, false)
			end
		end
	end, {
		UseContextResult.updateSquadViewFlags,
		UseNavigationFocusResult1
	})
	ReactModule.useEffect(function() --[[ Line: 79 ]]
		-- upvalues: UseStateResult2_1 (copy), UseResult (copy), p1 (copy)
		UseStateResult2_1(UseResult(p1.participant_user_ids))
	end, { UseStateResult2_1, p1.participant_user_ids, UseResult })
	local UseResult1 = ReactModule.useCallback(function(SquadId) --[[ Line: 84 ]]
		-- upvalues: UseDispatchResult (copy), NetworkingSquads (upval), UseStateResult2_1 (copy), HttpModule (upval), UseStateResult2 (copy)
		UseDispatchResult(NetworkingSquads.GetSquadFromSquadId.API({ squadId = SquadId })):andThen(function(Result) --[[ Line: 86 ]]
			-- upvalues: UseStateResult2_1 (upval)
			if Result and Result.responseBody and Result.responseBody.groupUp and Result.responseBody.groupUp.members then
				local List = {}
				
				for _, member in ipairs(Result.responseBody.groupUp.members) do
					table.insert(List, member.userId)
				end
				UseStateResult2_1(List)
			end
		end):catch(function(Err) --[[ Line: 100 ]]
			-- upvalues: HttpModule (upval), UseStateResult2 (upval)
			if Err.StatusCode == HttpModule.StatusCodes.NOT_FOUND then
				UseStateResult2(false)
				
				return
			else
				warn("Unsupported error type")
			end
		end)
	end, { UseDispatchResult })
	ReactModule.useEffect(function() --[[ Line: 109 ]]
		-- upvalues: UseStateResult (copy), IsSquadIdMatch (copy), SetIntervalFunction (upval), UseResult1 (copy), p1 (copy), ClearIntervalFunction (upval)
		local SetIntervalResult = if UseStateResult and not IsSquadIdMatch then SetIntervalFunction(function() --[[ Line: 113 ]]
			-- upvalues: UseResult1 (upval), p1 (upval)
			UseResult1(p1.group_up_id)
		end, 10000) else nil
		
		return function() --[[ Line: 118 ]]
			-- upvalues: SetIntervalResult (ref), ClearIntervalFunction (upval)
			if SetIntervalResult then
				ClearIntervalFunction(SetIntervalResult)
			end
		end
	end, {
		UseResult1,
		UseStateResult,
		IsSquadIdMatch,
		p1.group_up_id
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(0, 280, 0, 0)
	}, (ReactModule.useMemo(function() --[[ Line: 125 ]]
		-- upvalues: UseStateResult (copy), ReactModule (upval), SquadStartedCardModule (upval), p1 (copy), UseStateResult1 (copy), SquadEndedCardModule (upval)
		return if UseStateResult then ReactModule.createElement(SquadStartedCardModule, {
			conversationId = p1.conversation_id,
			participantUserIds = UseStateResult1,
			squadLocation = p1.moduleLocation
		}) else ReactModule.createElement(SquadEndedCardModule, {
			conversationId = p1.conversation_id,
			squadLocation = p1.moduleLocation
		})
	end, {
		UseStateResult,
		UseStateResult1,
		p1.conversation_id,
		p1.group_up_id
	})))
end