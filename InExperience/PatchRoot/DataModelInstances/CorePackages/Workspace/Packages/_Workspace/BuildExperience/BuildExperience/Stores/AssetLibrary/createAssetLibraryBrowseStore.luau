local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local buildAssetLibrarySearchDebounceMs = game:DefineFastInt("BuildAssetLibrarySearchDebounceMs", 250)

local function initialPageTokens() --[[ line: 39 ]]
	return { Model = { "" }, Audio = { "" }, Image = { "" } }
end

return function(value) --[[ line: 47 | named "createAssetLibraryBrowseStore" ]]
	-- upvalues: buildAssetLibrarySearchDebounceMs (ref), signalsModule (ref), initialPageTokens (ref), signalsExperimentalModule (ref)
	local value_1 = value or {}
	local debounceMs = value_1.debounceMs or buildAssetLibrarySearchDebounceMs
	local schedule = value_1.schedule or task.delay
	local cancel = value_1.cancel or task.cancel
	local initialQuery = value_1.initialQuery or ""
	local var9, var10 = signalsModule.createSignal(initialQuery)
	local var11, var12 = signalsModule.createSignal(initialQuery)
	local var13, var14 = signalsModule.createSignal(initialPageTokens())
	local var15 = nil
	
	local function _() --[[ line: 59 | named "cancelPending" ]]
		-- upvalues: var15 (write), cancel (ref)
		if var15 == nil then
			return
		end
		pcall(cancel, var15)
		var15 = nil
	end
	
	local _ = function() --[[ line: 67 | named "resetPages" ]]
		-- upvalues: var14 (ref), initialPageTokens (copy)
		var14(initialPageTokens())
	end
	
	local _ = function(p0) --[[ line: 71 | named "commitQuery" ]]
		-- upvalues: signalsExperimentalModule (copy), var12 (ref), var14 (ref), initialPageTokens (copy)
		signalsExperimentalModule.batch(function() --[[ line: 72 ]]
			-- upvalues: var12 (copy), p0 (ref), var14 (copy), initialPageTokens (copy)
			var12(p0)
			var14(initialPageTokens())
		end)
	end
	
	return {
		getDraftQuery = var9,
		getDebouncedQuery = var11,
		getPageTokens = var13,
		setQuery = function(value) --[[ line: 78 ]]
			-- upvalues: var10 (ref), var15 (write), cancel (ref), var11 (ref), schedule (ref), debounceMs (ref), signalsExperimentalModule (copy), var12 (ref), var14 (ref), initialPageTokens (copy)
			var10(value)
			
			if var15 ~= nil then
				pcall(cancel, var15)
				var15 = nil
			end
			if value == var11(false) then
				return
			end
			var15 = schedule(debounceMs / 1000, function() --[[ line: 84 ]]
				-- upvalues: var15 (copy), value (ref), signalsExperimentalModule (copy), var12 (copy), var14 (copy), initialPageTokens (copy)
				var15 = nil
				signalsExperimentalModule.batch(function() --[[ line: 72 ]]
					-- upvalues: var12 (copy), value (ref), var14 (copy), initialPageTokens (copy)
					var12(value)
					var14(initialPageTokens())
				end)
			end)
		end,
		clearQuery = function() --[[ line: 90 ]]
			-- upvalues: var15 (write), cancel (ref), signalsExperimentalModule (copy), var10 (ref), var12 (ref), var14 (ref), initialPageTokens (copy)
			if var15 ~= nil then
				pcall(cancel, var15)
				var15 = nil
			end
			signalsExperimentalModule.batch(function() --[[ line: 92 ]]
				-- upvalues: var10 (copy), var12 (copy), var14 (copy), initialPageTokens (copy)
				var10("")
				var12("")
				var14(initialPageTokens())
			end)
		end,
		addPageToken = function(p1, p2) --[[ line: 99 ]]
			-- upvalues: var13 (ref), var14 (ref)
			if p2 == "" then return end
			local var16 = var13(false)
			
			if table.find(var16[p1], p2) == nil then
				local t = {
					Model = table.clone(var16.Model),
					Audio = table.clone(var16.Audio),
					Image = table.clone(var16.Image)
				}
				table.insert(t[p1], p2)
				var14(t)
				
				return
			end
		end,
		reset = function() --[[ line: 118 ]]
			-- upvalues: var15 (write), cancel (ref), signalsExperimentalModule (copy), var10 (ref), var12 (ref), var14 (ref), initialPageTokens (copy)
			if var15 ~= nil then
				pcall(cancel, var15)
				var15 = nil
			end
			signalsExperimentalModule.batch(function() --[[ line: 120 ]]
				-- upvalues: var10 (copy), var12 (copy), var14 (copy), initialPageTokens (copy)
				var10("")
				var12("")
				var14(initialPageTokens())
			end)
		end,
		destroy = function() --[[ line: 127 ]]
			-- upvalues: var15 (write), cancel (ref)
			if var15 == nil then
				return
			end
			pcall(cancel, var15)
			var15 = nil
		end
	}
end