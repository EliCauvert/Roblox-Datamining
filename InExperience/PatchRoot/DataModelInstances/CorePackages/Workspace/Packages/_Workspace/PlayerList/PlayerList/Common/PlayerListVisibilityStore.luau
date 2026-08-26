local signalsModule = require(script.Parent.Parent.Parent.Signals)
local var1, var2 = signalsModule.createSignal(true)
local var3 = false

local function setShouldPersistVisibility(value)
	-- upvalues: var3 (write)
	var3 = value
end

local function setVisible(value)
	-- upvalues: var2 (ref), var3 (write)
	var2(value)
	
	if var3 then
		UserSettings().GameSettings.PlayerListVisible = value
	end
end

local var4, var5 = signalsModule.createSignal({})
local var6 = nil

return {
	getVisible = var1,
	setVisible = setVisible,
	setShouldPersistVisibility = setShouldPersistVisibility,
	getEffectiveVisible = signalsModule.createComputed(function(p1)
		-- upvalues: var1 (ref), var4 (ref)
		return var1(p1) and next(var4(p1)) == nil
	end),
	setTempHide = function(value, p1)
		-- upvalues: var4 (ref), var5 (ref), var6 (write), var1 (ref), var2 (ref)
		local var7 = next(var4(false)) == nil
		var5(function(p2)
			-- upvalues: value (ref), p1 (ref)
			local cloned = table.clone(p2)
			cloned[value] = if p1 then true else nil
			
			return cloned
		end)
		local var8 = next(var4(false)) == nil
		
		if var7 and not var8 then
			var6 = var1(false)
			
			return
		elseif not var7 and var8 and var6 ~= nil then
			local var9 = var6
			var6 = nil
			
			if var1(false) ~= var9 then
				var2(var9)
			end
		end
	end,
	reset = function()
		-- upvalues: var3 (write), var6 (write), var5 (ref), var2 (ref)
		var3 = false
		var6 = nil
		var5({})
		var2(true)
	end
}