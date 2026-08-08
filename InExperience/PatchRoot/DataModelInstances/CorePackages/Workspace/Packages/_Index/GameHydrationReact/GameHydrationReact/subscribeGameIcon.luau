local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local signalsModule = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)

local function _(p0) --[[ line: 27 | named "toId" ]]
	return if p0 == nil then nil else tostring(p0)
end

return function(p1) --[[ line: 39 | named "subscribeGameIcon" ]]
	-- upvalues: dataHydrationModule (ref), signalsModule (ref)
	local gameIconStore = dataHydrationModule.Game.getGameIconStore(false)
	local universeId = p1.universeId
	universeId, var3 = signalsModule.createSignal(if universeId ~= nil then nil else tostring(universeId))
	local var4 = nil
	local var5 = true
	
	return {
		getCurrent = function() --[[ line: 66 ]]
			-- upvalues: var4 (write)
			return var4
		end,
		update = function(p2) --[[ line: 69 ]]
			-- upvalues: var3 (ref)
			var3(if p2 ~= nil then nil else tostring(p2))
		end,
		dispose = signalsModule.createEffect(function(p3) --[[ line: 47 ]]
			-- upvalues: universeId (ref), var4 (write), gameIconStore (ref), p1 (ref), var5 (write)
			local var6 = universeId(p3)
			var4 = if var6 == nil then nil else gameIconStore.getGameIcon(var6, p1.size).data(p3)
			
			if var5 then
				var5 = false
				
				return
			end
			p1.onChange(var4)
		end)
	}
end