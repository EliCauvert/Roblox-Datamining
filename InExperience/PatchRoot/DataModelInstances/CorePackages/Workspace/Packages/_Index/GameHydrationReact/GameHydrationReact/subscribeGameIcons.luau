local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local signalsModule = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)

local function toIds(p0)
	local t = {}
	
	if p0 == nil then
		return t
	end
	local t_1 = {}
	
	for i, v in p0 do
		local var6 = tostring(v)
		
		if not t_1[var6] then
			t_1[var6] = true
			table.insert(t, var6)
		end
	end
	return t
end

local function sameIds(p1, p2)
	if #p1 ~= #p2 then
		return false
	end
	local t = {}
	
	for i, v in p1 do
		t[v] = true
	end
	for i, v_1 in p2 do
		if not t[v_1] then
			return false
		end
	end
	return true
end

return function(p3)
	-- upvalues: dataHydrationModule (ref), signalsModule (ref), toIds (ref), sameIds (ref)
	local gameIconStore = dataHydrationModule.Game.getGameIconStore(false)
	local var9, var10 = signalsModule.createSignal(toIds(p3.universeIds), sameIds)
	local t = {}
	local var12 = true
	
	return {
		getCurrent = function()
			-- upvalues: t (write)
			return t
		end,
		update = function(p4)
			-- upvalues: var10 (ref), toIds (copy)
			var10(toIds(p4))
		end,
		dispose = signalsModule.createEffect(function(p5)
			-- upvalues: var9 (ref), gameIconStore (ref), p3 (ref), t (write), var12 (write)
			local var13 = var9(p5)
			local t_1 = {}
			
			if #var13 > 0 then
				for i, v in gameIconStore.getGameIcons(var13, p3.size) do
					local var15 = v.data(p5)
					
					if var15 ~= nil then
						t_1[i] = var15
					end
				end
			end
			t = t_1
			
			if var12 then
				var12 = false
				
				return
			end
			p3.onChange(t_1)
		end)
	}
end