local signalsModule = require(script:FindFirstAncestor("System").Parent.Signals)
local createSignal = signalsModule.createSignal
local createEffect = signalsModule.createEffect
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref), createSignal (ref), createEffect (ref)
	local tbl = setmetatable({}, t)
	local defaultVisible = false
	local defaultEnabled = false
	
	if p1 then
		defaultVisible = p1.defaultVisible
		defaultEnabled = p1.defaultEnabled
	end
	local var1, var2 = createSignal(defaultVisible)
	local var3, var4 = createSignal(defaultEnabled)
	tbl.getVisible = var1
	tbl.setVisible = var2
	tbl.getEnabled = var3
	tbl.setEnabled = var4
	local t_1 = {}
	local t_2 = {}
	local var5 = createEffect(function(p2)
		-- upvalues: var1 (ref), tbl (ref), t_1 (ref), var2 (ref)
		local var6 = var1(p2)
		
		if tbl.getEnabled(false) then
			for i, v in t_1 do
				local var7 = v(var6)
				
				if type(var7) == "boolean" and var7 ~= var6 then
					var2(var7)
					
					return
				end
			end
		end
	end)
	local var8 = createEffect(function(p3)
		-- upvalues: var3 (ref), t_2 (ref)
		local var9 = var3(p3)
		
		for i, v in t_2 do
			v(var9)
		end
	end)
	
	function tbl.dispose(_)
		-- upvalues: var5 (ref), var8 (ref)
		var5()
		var8()
	end
	
	function tbl.onVisibilityChanged(_, p4)
		-- upvalues: t_1 (ref)
		table.insert(t_1, p4)
		
		return function()
			-- upvalues: t_1 (copy), p4 (ref)
			local index = table.find(t_1, p4)
			
			if index then
				table.remove(t_1, index)
			end
		end
	end
	
	function tbl.onEnabledChanged(_, p4)
		-- upvalues: t_2 (ref), var3 (ref)
		table.insert(t_2, p4)
		p4(var3(false))
		
		return function()
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