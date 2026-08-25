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

local var6, var7 = signalsModule.createSignal({})
local var8 = nil

return {
	getVisible = var1,
	setVisible = setVisible,
	setShouldPersistVisibility = setShouldPersistVisibility,
	getEffectiveVisible = signalsModule.createComputed(function(p0)
		-- upvalues: var1 (ref), var6 (ref)
		return var1(p0) and next(var6(p0)) == nil
	end),
	setTempHide = function(value, p1)
		-- upvalues: var6 (ref), var7 (ref), var8 (write), var1 (ref), var2 (ref)
		local var9 = next(var6(false)) == nil
		var7(function(p2)
			-- upvalues: value (ref), p1 (ref)
			local cloned = table.clone(p2)
			cloned[value] = if p1 then true else nil
			
			return cloned
		end)
		local var10 = next(var6(false)) == nil
		
		if var9 and not var10 then
			var8 = var1(false)
			
			return
		elseif not var9 and var10 and var8 ~= nil then
			local var11 = var8
			var8 = nil
			
			if var1(false) ~= var11 then
				var2(var11)
			end
		end
	end,
	reset = function()
		-- upvalues: var3 (write), var8 (write), var7 (ref), var2 (ref)
		var3 = false
		var8 = nil
		var7({})
		var2(true)
	end
}