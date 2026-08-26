local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local signalsModule = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

return function(p1)
	-- upvalues: dataHydrationModule (ref), signalsModule (ref)
	local gameIconStore = dataHydrationModule.Game.getGameIconStore(false)
	local universeId = p1.universeId
	universeId, var3 = signalsModule.createSignal(if universeId ~= nil then nil else tostring(universeId))
	local var1 = nil
	local var2 = true
	
	return {
		getCurrent = function()
			-- upvalues: var1 (write)
			return var1
		end,
		update = function(p2)
			-- upvalues: var3 (ref)
			var3(if p2 ~= nil then nil else tostring(p2))
		end,
		dispose = signalsModule.createEffect(function(p2)
			-- upvalues: universeId (ref), var1 (write), gameIconStore (ref), p1 (ref), var2 (write)
			local var3 = universeId(p2)
			var1 = if var3 == nil then nil else gameIconStore.getGameIcon(var3, p1.size).data(p2)
			
			if var2 then
				var2 = false
				
				return
			end
			p1.onChange(var1)
		end)
	}
end