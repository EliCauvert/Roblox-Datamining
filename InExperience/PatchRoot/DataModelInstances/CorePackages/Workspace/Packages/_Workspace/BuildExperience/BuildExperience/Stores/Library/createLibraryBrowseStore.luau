local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local buildLibrarySearchDebounceMs = game:DefineFastInt("BuildLibrarySearchDebounceMs", 250)

local function initialPageTokens()
	return { Model = { "" }, Audio = { "" }, Image = { "" } }
end

return function(p1)
	-- upvalues: buildLibrarySearchDebounceMs (ref), signalsModule (ref), initialPageTokens (ref), signalsExperimentalModule (ref)
	p1 = p1 or {}
	local debounceMs = p1.debounceMs or buildLibrarySearchDebounceMs
	local schedule = p1.schedule or task.delay
	local cancel = p1.cancel or task.cancel
	local initialQuery = p1.initialQuery or ""
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
	
	local _ = function(p2)
		-- upvalues: signalsExperimentalModule (copy), var4 (ref), var6 (ref), initialPageTokens (copy)
		signalsExperimentalModule.batch(function()
			-- upvalues: var4 (copy), p2 (ref), var6 (copy), initialPageTokens (copy)
			var4(p2)
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
		addPageToken = function(p2, p3)
			-- upvalues: var5 (ref), var6 (ref)
			if p3 == "" then return end
			local var8 = var5(false)
			
			if table.find(var8[p2], p3) == nil then
				local t = {
					Model = table.clone(var8.Model),
					Audio = table.clone(var8.Audio),
					Image = table.clone(var8.Image)
				}
				table.insert(t[p2], p3)
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