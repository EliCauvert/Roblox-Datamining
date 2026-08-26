local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local signalsModule = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)

local function toIds(p1)
	local t = {}
	
	if p1 == nil then
		return t
	end
	local t_1 = {}
	
	for i, v in p1 do
		local var1 = tostring(v)
		
		if not t_1[var1] then
			t_1[var1] = true
			table.insert(t, var1)
		end
	end
	return t
end

local function sameIds(p2, p3)
	if #p2 ~= #p3 then
		return false
	end
	local t = {}
	
	for i, v in p2 do
		t[v] = true
	end
	for i, v_1 in p3 do
		if not t[v_1] then
			return false
		end
	end
	return true
end

return function(p4)
	-- upvalues: dataHydrationModule (ref), signalsModule (ref), toIds (ref), sameIds (ref)
	local gameIconStore = dataHydrationModule.Game.getGameIconStore(false)
	local var2, var3 = signalsModule.createSignal(toIds(p4.universeIds), sameIds)
	local t = {}
	local var4 = true
	
	return {
		getCurrent = function()
			-- upvalues: t (write)
			return t
		end,
		update = function(p5)
			-- upvalues: var3 (ref), toIds (copy)
			var3(toIds(p5))
		end,
		dispose = signalsModule.createEffect(function(p5)
			-- upvalues: var2 (ref), gameIconStore (ref), p4 (ref), t (write), var4 (write)
			local var5 = var2(p5)
			local t_1 = {}
			
			if #var5 > 0 then
				for i, v in gameIconStore.getGameIcons(var5, p4.size) do
					local var6 = v.data(p5)
					
					if var6 ~= nil then
						t_1[i] = var6
					end
				end
			end
			t = t_1
			
			if var4 then
				var4 = false
				
				return
			end
			p4.onChange(t_1)
		end)
	}
end