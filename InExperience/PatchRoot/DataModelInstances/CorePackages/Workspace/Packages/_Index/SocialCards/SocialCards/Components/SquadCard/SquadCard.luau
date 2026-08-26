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

return function(p1)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), squadExternalContractContext (ref), useCurrentSquadSelector (ref), cryoModule (ref), useNavigationFocus (ref), squadViewFlags (ref), networkingSquads (ref), httpModule (ref), setInterval (ref), clearInterval (ref), squadStartedCardModule (ref), squadEndedCardModule (ref), foundationModule (ref)
	local var1
	local var2 = useDispatch()
	local var3 = useLocalUserId()
	local var4 = reactModule.useContext(squadExternalContractContext)
	local var5 = useCurrentSquadSelector()
	
	if var5 then
		var1 = var5.squadId == p1.group_up_id
		var1 = nil
	else
		var1 = false
	end
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var5 (ref), cryoModule (copy), var3 (ref)
		if not var1 then
			return cryoModule.List.filter(p2, function(p3)
				-- upvalues: var3 (copy)
				return tostring(p3) ~= var3
			end)
		end
		local t = {}
		
		for i, v in ipairs(var5.members) do
			table.insert(t, v.userId)
		end
		return t
	end, { var1, var5, var3 })
	local var7, var8 = reactModule.useState(p1.is_alive)
	local var9, var10 = reactModule.useState(var6(p1.participant_user_ids))
	local var11 = var1 and useNavigationFocus()
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var4 (ref), squadViewFlags (copy)
		if var11 then
			var4.updateSquadViewFlags(squadViewFlags.SquadSystemMessage, true)
		end
		return function()
			-- upvalues: var11 (copy), var4 (copy), squadViewFlags (copy)
			if var11 then
				var4.updateSquadViewFlags(squadViewFlags.SquadSystemMessage, false)
			end
		end
	end, { var4.updateSquadViewFlags, var11 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var6 (ref), p1 (ref)
		var10(var6(p1.participant_user_ids))
	end, { var10, p1.participant_user_ids, var6 })
	local var12 = reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref), networkingSquads (copy), var10 (ref), httpModule (copy), var8 (ref)
		var2(networkingSquads.GetSquadFromSquadId.API({ squadId = p3 })):andThen(function(p4)
			-- upvalues: var10 (copy)
			if p4 and p4.responseBody and (p4.responseBody.groupUp and p4.responseBody.groupUp.members) then
				local t = {}
				
				for i, v in ipairs(p4.responseBody.groupUp.members) do
					table.insert(t, v.userId)
				end
				var10(t)
			end
		end):catch(function(p5)
			-- upvalues: httpModule (copy), var8 (copy)
			if p5.StatusCode == httpModule.StatusCodes.NOT_FOUND then
				var8(false)
				
				return
			end
			warn("Unsupported error type")
		end)
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var1 (ref), setInterval (copy), var12 (ref), p1 (ref), clearInterval (copy)
		local var13 = if var7 and not var1 then setInterval(function()
			-- upvalues: var12 (copy), p1 (copy)
			var12(p1.group_up_id)
		end, 10000) else nil
		
		return function()
			-- upvalues: var13 (write), clearInterval (copy)
			if var13 then
				clearInterval(var13)
			end
		end
	end, { var12, var7, var1, p1.group_up_id })
	
	return reactModule.createElement(foundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(0, 280, 0, 0)
	}, reactModule.useMemo(function()
		-- upvalues: var7 (ref), reactModule (copy), squadStartedCardModule (copy), p1 (ref), var9 (ref), squadEndedCardModule (copy)
		return if var7 then reactModule.createElement(squadStartedCardModule, {
			conversationId = p1.conversation_id,
			participantUserIds = var9,
			squadLocation = p1.moduleLocation
		}) else reactModule.createElement(squadEndedCardModule, {
			conversationId = p1.conversation_id,
			squadLocation = p1.moduleLocation
		})
	end, { var7, var9, p1.conversation_id, p1.group_up_id }))
end