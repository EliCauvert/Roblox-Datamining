local socialCards = script:FindFirstAncestor("SocialCards")
local parent = socialCards.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local httpModule = require(parent.Http)
local luauPolyfillModule = require(parent.LuauPolyfill)
local reactModule = require(parent.React)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local useCurrentSquadSelector = require(parent.RoduxSquads).Hooks.useCurrentSquadSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local networkingSquads = require(parent.SquadsCore.Http).NetworkingSquads
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local squadViewFlags = squadExternalContractProviderModule.SquadViewFlags
local clearInterval = luauPolyfillModule.clearInterval
local setInterval = luauPolyfillModule.setInterval
local squadStartedCardModule = require(socialCards.Components.SquadCard.SquadStartedCard)
local squadEndedCardModule = require(socialCards.Components.SquadCard.SquadEndedCard)

return function(p0)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), squadExternalContractContext (ref), useCurrentSquadSelector (ref), cryoModule (ref), useNavigationFocus (ref), squadViewFlags (ref), networkingSquads (ref), httpModule (ref), setInterval (ref), clearInterval (ref), squadStartedCardModule (ref), squadEndedCardModule (ref), foundationModule (ref)
	local var13
	local var9 = useDispatch()
	local var10 = useLocalUserId()
	local var11 = reactModule.useContext(squadExternalContractContext)
	local var12 = useCurrentSquadSelector()
	
	if var12 then
		var13 = var12.squadId == p0.group_up_id
		var13 = nil
	else
		var13 = false
	end
	local var14 = reactModule.useCallback(function(p1)
		-- upvalues: var13 (ref), var12 (ref), cryoModule (copy), var10 (ref)
		if not var13 then
			return cryoModule.List.filter(p1, function(p2)
				-- upvalues: var10 (copy)
				return tostring(p2) ~= var10
			end)
		end
		local t = {}
		
		for i, v in ipairs(var12.members) do
			table.insert(t, v.userId)
		end
		return t
	end, { var13, var12, var10 })
	local var15, var16 = reactModule.useState(p0.is_alive)
	local var17, var18 = reactModule.useState(var14(p0.participant_user_ids))
	local var19 = var13 and useNavigationFocus()
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var11 (ref), squadViewFlags (copy)
		if var19 then
			var11.updateSquadViewFlags(squadViewFlags.SquadSystemMessage, true)
		end
		return function()
			-- upvalues: var19 (copy), var11 (copy), squadViewFlags (copy)
			if var19 then
				var11.updateSquadViewFlags(squadViewFlags.SquadSystemMessage, false)
			end
		end
	end, { var11.updateSquadViewFlags, var19 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var14 (ref), p0 (ref)
		var18(var14(p0.participant_user_ids))
	end, { var18, p0.participant_user_ids, var14 })
	local var20 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref), networkingSquads (copy), var18 (ref), httpModule (copy), var16 (ref)
		var9(networkingSquads.GetSquadFromSquadId.API({ squadId = p3 })):andThen(function(p5)
			-- upvalues: var18 (copy)
			if p5 and p5.responseBody and (p5.responseBody.groupUp and p5.responseBody.groupUp.members) then
				local t = {}
				
				for i, v in ipairs(p5.responseBody.groupUp.members) do
					table.insert(t, v.userId)
				end
				var18(t)
			end
		end):catch(function(p4)
			-- upvalues: httpModule (copy), var16 (copy)
			if p4.StatusCode == httpModule.StatusCodes.NOT_FOUND then
				var16(false)
				
				return
			end
			warn("Unsupported error type")
		end)
	end, { var9 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var13 (ref), setInterval (copy), var20 (ref), p0 (ref), clearInterval (copy)
		local var23 = if var15 and not var13 then setInterval(function()
			-- upvalues: var20 (copy), p0 (copy)
			var20(p0.group_up_id)
		end, 10000) else nil
		
		return function()
			-- upvalues: var23 (write), clearInterval (copy)
			if var23 then
				clearInterval(var23)
			end
		end
	end, { var20, var15, var13, p0.group_up_id })
	
	return reactModule.createElement(foundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(0, 280, 0, 0)
	}, reactModule.useMemo(function()
		-- upvalues: var15 (ref), reactModule (copy), squadStartedCardModule (copy), p0 (ref), var17 (ref), squadEndedCardModule (copy)
		return if var15 then reactModule.createElement(squadStartedCardModule, {
			conversationId = p0.conversation_id,
			participantUserIds = var17,
			squadLocation = p0.moduleLocation
		}) else reactModule.createElement(squadEndedCardModule, {
			conversationId = p0.conversation_id,
			squadLocation = p0.moduleLocation
		})
	end, { var15, var17, p0.conversation_id, p0.group_up_id }))
end