local signalsModule = require(script:FindFirstAncestor("GamePlayButton").Parent.Signals)

local function createStore(p1)
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal("")
	local var3, var4 = signalsModule.createSignal(false)
	local var5 = nil
	
	local function refresh()
		-- upvalues: p1 (ref), var5 (write), var2 (ref), var4 (ref)
		local ok, status, var6 = pcall(function()
			-- upvalues: p1 (copy)
			local var7 = p1()
			
			if var7 and type(var7.SetForcedPop) == "function" then
				return var7, var7:GetForcedPop()
			end
			return nil, nil
		end)
		
		if ok and type(var6) == "string" then
			var5 = status
			var2(var6)
			var4(true)
			
			return
		end
		var5 = nil
		var4(false)
	end
	
	return {
		getSelection = var1,
		getSupported = var3,
		refresh = refresh,
		select = function(p2)
			-- upvalues: var5 (write), refresh (ref), var3 (ref), var1 (ref)
			if not var5 then
				refresh()
			end
			if var5 then
				local ok = pcall(function()
					-- upvalues: var5 (copy), p2 (ref)
					var5:SetForcedPop(p2)
				end)
				refresh()
				
				return ok and (var3(false) and var1(false) == p2)
			end
			return false
		end,
		getSnapshot = function()
			-- upvalues: var5 (write)
			local ok, status = pcall(function()
				-- upvalues: var5 (copy)
				return var5:GetSnapshot()
			end)
			
			return if ok and type(status) == "table" then status else nil
		end
	}
end

return {
	createStore = createStore,
	getStore = signalsModule.createComputed(function()
		-- upvalues: createStore (ref)
		return createStore(function()
			return game:GetService("PopLatencyService")
		end)
	end)
}