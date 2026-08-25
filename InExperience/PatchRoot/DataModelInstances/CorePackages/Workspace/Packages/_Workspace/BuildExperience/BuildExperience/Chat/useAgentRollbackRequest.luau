local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = require(parent.DataHydration.CreatorAgentChat)
local reactModule = require(parent.React)
local _ = require(script.Parent.chatTypes)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)

return function(p1)
	-- upvalues: getAgentRollbackRequestStoreModule (ref), reactModule (ref)
	local var1 = getAgentRollbackRequestStoreModule(false)
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref)
		local current = var3.current
		
		if current == nil then
			return false
		end
		var3.current = nil
		p1.stop()
		current.rejectStartup()
		
		return true
	end, {})
	local var5 = reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: p1 (ref), var3 (ref)
		if p1.session == nil or p1.activeTurnHandleRef.current ~= nil then
			return false
		end
		var3.current = { requestId = p1.id, rejectStartup = p3 }
		p1.startRollbackTurn(p1, function()
			-- upvalues: var3 (copy), p1 (ref), p2 (ref)
			local current = var3.current
			
			if current == nil or current.requestId ~= p1.id then
				return
			end
			var3.current = nil
			p2()
		end, function()
			-- upvalues: var3 (copy), p1 (ref), p3 (ref)
			local current = var3.current
			
			if current == nil or current.requestId ~= p1.id then
				return
			end
			var3.current = nil
			p3()
		end)
		
		return true
	end, { p1.session, p1.activeTurnHandleRef, p1.startRollbackTurn })
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var1 (ref), var2 (ref), var5 (ref)
		if p1.session == nil or p1.placeId == nil then
			var1.unregisterTurnStarter(var2.current)
			
			return
		end
		var1.registerTurnStarter({ universeId = p1.universeId, placeId = p1.placeId }, var2.current, var5)
	end, {
		p1.universeId,
		p1.placeId,
		p1.session,
		var5,
		var1
	})
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), var1 (ref)
		local current = var2.current
		
		return function()
			-- upvalues: var1 (copy), current (ref)
			var1.unregisterTurnStarter(current)
		end
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref)
		return function()
			-- upvalues: p1 (copy), var4 (copy)
			local current = p1.activeTurnHandleRef.current
			
			if current ~= nil then
				var4(current)
			end
		end
	end, { p1.activeTurnHandleRef, var4 })
	
	return {
		stopRequestBeforeReceipt = var4,
		cancelRequestBeforeTurnStarts = reactModule.useCallback(function()
			-- upvalues: var3 (ref), p1 (ref), var1 (ref)
			return var3.current == nil and (p1.placeId ~= nil and var1.cancelRequestForPlaceId(p1.placeId))
		end, { p1.placeId, var1 })
	}
end