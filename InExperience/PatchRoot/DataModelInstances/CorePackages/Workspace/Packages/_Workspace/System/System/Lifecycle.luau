local signalsModule = require(script:FindFirstAncestor("System").Parent.Signals)
local createSignal = signalsModule.createSignal
local createEffect = signalsModule.createEffect
local t = {}
t.__index = t

function t.new(p0) --[[ line: 36 ]]
	-- upvalues: t (ref), createSignal (ref), createEffect (ref)
	local tbl = setmetatable({}, t)
	local defaultVisible = false
	local defaultEnabled = false
	
	if p0 then
		defaultVisible = p0.defaultVisible
		defaultEnabled = p0.defaultEnabled
	end
	local var3, var4 = createSignal(defaultVisible)
	local var5, var6 = createSignal(defaultEnabled)
	tbl.getVisible = var3
	tbl.setVisible = var4
	tbl.getEnabled = var5
	tbl.setEnabled = var6
	local t_1 = {}
	local t_2 = {}
	local var9 = createEffect(function(p1) --[[ line: 58 ]]
		-- upvalues: var3 (ref), tbl (ref), t_1 (ref), var4 (ref)
		local var11 = var3(p1)
		
		if tbl.getEnabled(false) then
			for i, v in t_1 do
				local var12 = v(var11)
				
				if type(var12) == "boolean" and var12 ~= var11 then
					var4(var12)
					
					return
				end
			end
		end
	end)
	local var10 = createEffect(function(p2) --[[ line: 71 ]]
		-- upvalues: var5 (ref), t_2 (ref)
		local var13 = var5(p2)
		
		for i, v in t_2 do
			v(var13)
		end
	end)
	
	function tbl.dispose(_) --[[ line: 78 ]]
		-- upvalues: var9 (ref), var10 (ref)
		var9()
		var10()
	end
	
	function tbl.onVisibilityChanged(_, p3) --[[ line: 83 ]]
		-- upvalues: t_1 (ref)
		table.insert(t_1, p3)
		
		return function() --[[ line: 86 ]]
			-- upvalues: t_1 (copy), p3 (ref)
			local index = table.find(t_1, p3)
			
			if index then
				table.remove(t_1, index)
			end
		end
	end
	
	function tbl.onEnabledChanged(_, p4) --[[ line: 94 ]]
		-- upvalues: t_2 (ref), var5 (ref)
		table.insert(t_2, p4)
		p4(var5(false))
		
		return function() --[[ line: 97 ]]
			-- upvalues: t_2 (copy), p4 (ref)
			local index = table.find(t_2, p4)
			
			if index then
				table.remove(t_2, index)
			end
		end
	end
	
	return tbl
end

return t