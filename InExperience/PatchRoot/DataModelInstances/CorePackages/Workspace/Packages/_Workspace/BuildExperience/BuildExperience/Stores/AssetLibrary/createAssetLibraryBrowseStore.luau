local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local buildAssetLibrarySearchDebounceMs = game:DefineFastInt("BuildAssetLibrarySearchDebounceMs", 250)

local function initialPageTokens()
	return { Model = { "" }, Audio = { "" }, Image = { "" } }
end

return function(value)
	-- upvalues: buildAssetLibrarySearchDebounceMs (ref), signalsModule (ref), initialPageTokens (ref), signalsExperimentalModule (ref)
	local value_1 = value or {}
	local debounceMs = value_1.debounceMs or buildAssetLibrarySearchDebounceMs
	local schedule = value_1.schedule or task.delay
	local cancel = value_1.cancel or task.cancel
	local initialQuery = value_1.initialQuery or ""
	local var1, var2 = signalsModule.createSignal(initialQuery)
	local var3, var4 = signalsModule.createSignal(initialQuery)
	local var5, var6 = signalsModule.createSignal(initialPageTokens())
	local var7 = nil
	
	local function _()
		-- upvalues: var7 (write), cancel (ref)
		if var7 == nil then
			return
		end
		pcall(cancel, var7)
		var7 = nil
	end
	
	local _ = function()
		-- upvalues: var6 (ref), initialPageTokens (copy)
		var6(initialPageTokens())
	end
	
	local _ = function(p1)
		-- upvalues: signalsExperimentalModule (copy), var4 (ref), var6 (ref), initialPageTokens (copy)
		signalsExperimentalModule.batch(function()
			-- upvalues: var4 (copy), p1 (ref), var6 (copy), initialPageTokens (copy)
			var4(p1)
			var6(initialPageTokens())
		end)
	end
	
	return {
		getDraftQuery = var1,
		getDebouncedQuery = var3,
		getPageTokens = var5,
		setQuery = function(value)
			-- upvalues: var2 (ref), var7 (write), cancel (ref), var3 (ref), schedule (ref), debounceMs (ref), signalsExperimentalModule (copy), var4 (ref), var6 (ref), initialPageTokens (copy)
			var2(value)
			
			if var7 ~= nil then
				pcall(cancel, var7)
				var7 = nil
			end
			if value == var3(false) then
				return
			end
			var7 = schedule(debounceMs / 1000, function()
				-- upvalues: var7 (copy), value (ref), signalsExperimentalModule (copy), var4 (copy), var6 (copy), initialPageTokens (copy)
				var7 = nil
				signalsExperimentalModule.batch(function()
					-- upvalues: var4 (copy), value (ref), var6 (copy), initialPageTokens (copy)
					var4(value)
					var6(initialPageTokens())
				end)
			end)
		end,
		clearQuery = function()
			-- upvalues: var7 (write), cancel (ref), signalsExperimentalModule (copy), var2 (ref), var4 (ref), var6 (ref), initialPageTokens (copy)
			if var7 ~= nil then
				pcall(cancel, var7)
				var7 = nil
			end
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), var4 (copy), var6 (copy), initialPageTokens (copy)
				var2("")
				var4("")
				var6(initialPageTokens())
			end)
		end,
		addPageToken = function(p1, p2)
			-- upvalues: var5 (ref), var6 (ref)
			if p2 == "" then return end
			local var8 = var5(false)
			
			if table.find(var8[p1], p2) == nil then
				local t = {
					Model = table.clone(var8.Model),
					Audio = table.clone(var8.Audio),
					Image = table.clone(var8.Image)
				}
				table.insert(t[p1], p2)
				var6(t)
				
				return
			end
		end,
		reset = function()
			-- upvalues: var7 (write), cancel (ref), signalsExperimentalModule (copy), var2 (ref), var4 (ref), var6 (ref), initialPageTokens (copy)
			if var7 ~= nil then
				pcall(cancel, var7)
				var7 = nil
			end
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), var4 (copy), var6 (copy), initialPageTokens (copy)
				var2("")
				var4("")
				var6(initialPageTokens())
			end)
		end,
		destroy = function()
			-- upvalues: var7 (write), cancel (ref)
			if var7 == nil then
				return
			end
			pcall(cancel, var7)
			var7 = nil
		end
	}
end