local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.DataHydration.CreatorAgentChat)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.chatTypes)
local GetAgentRollbackRequestStoreModule = require(BuildExperience.Stores.GetAgentRollbackRequestStore)

return function(p1)
	-- upvalues: GetAgentRollbackRequestStoreModule (copy), ReactModule (copy)
	local AgentRollbackRequestStoreModule = GetAgentRollbackRequestStoreModule(false)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p2): boolean
		-- upvalues: UseRefResult1 (copy)
		local Current = UseRefResult1.current
		
		if Current == nil then
			return false
		else
			UseRefResult1.current = nil
			p2.stop()
			Current.rejectStartup()
			
			return true
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2, Callback, Callback1): boolean
		-- upvalues: p1 (copy), UseRefResult1 (copy)
		if p1.session == nil or p1.activeTurnHandleRef.current ~= nil then
			return false
		else
			UseRefResult1.current = { requestId = p2.id, rejectStartup = Callback1 }
			p1.startRollbackTurn(p2, function()
				-- upvalues: UseRefResult1 (upval), p2 (copy), Callback (copy)
				local Current = UseRefResult1.current
				
				if Current ~= nil and Current.requestId == p2.id then
					UseRefResult1.current = nil
					Callback()
					
					return
				end
			end, function()
				-- upvalues: UseRefResult1 (upval), p2 (copy), Callback1 (copy)
				local Current = UseRefResult1.current
				
				if Current ~= nil and Current.requestId == p2.id then
					UseRefResult1.current = nil
					Callback1()
					
					return
				end
			end)
			
			return true
		end
	end, { p1.session, p1.activeTurnHandleRef, p1.startRollbackTurn })
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), AgentRollbackRequestStoreModule (copy), UseRefResult (copy), UseResult1 (copy)
		if p1.session == nil or p1.placeId == nil then
			AgentRollbackRequestStoreModule.unregisterTurnStarter(UseRefResult.current)
			
			return
		else
			AgentRollbackRequestStoreModule.registerTurnStarter({ universeId = p1.universeId, placeId = p1.placeId }, UseRefResult.current, UseResult1)
		end
	end, {
		p1.universeId,
		p1.placeId,
		p1.session,
		UseResult1,
		AgentRollbackRequestStoreModule
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), AgentRollbackRequestStoreModule (copy)
		local Current = UseRefResult.current
		
		return function()
			-- upvalues: AgentRollbackRequestStoreModule (upval), Current (copy)
			AgentRollbackRequestStoreModule.unregisterTurnStarter(Current)
		end
	end, { AgentRollbackRequestStoreModule })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseResult (copy)
		return function()
			-- upvalues: p1 (upval), UseResult (upval)
			local Current = p1.activeTurnHandleRef.current
			
			if Current ~= nil then
				UseResult(Current)
			end
		end
	end, { p1.activeTurnHandleRef, UseResult })
	
	return {
		stopRequestBeforeReceipt = UseResult,
		cancelRequestBeforeTurnStarts = ReactModule.useCallback(function()
			-- upvalues: UseRefResult1 (copy), p1 (copy), AgentRollbackRequestStoreModule (copy)
			return UseRefResult1.current == nil and (p1.placeId ~= nil and AgentRollbackRequestStoreModule.cancelRequestForPlaceId(p1.placeId))
		end, { p1.placeId, AgentRollbackRequestStoreModule })
	}
end