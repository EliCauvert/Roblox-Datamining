local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.DataHydration.BuildLibrary)
local signalsModule = require(buildExperience.Parent.Signals)

return function(p1)
	-- upvalues: signalsModule (ref)
	local t = {}
	local var1 = nil
	local var2 = nil
	local var3 = nil
	
	local function _()
		-- upvalues: var3 (write), p1 (ref)
		if var3 ~= nil then
			p1.cancel(var3)
			var3 = nil
		end
	end
	
	local function beginStart(p2)
		-- upvalues: var2 (write), var3 (write), p1 (ref), var1 (write)
		var2 = p2
		p2.setStatus("Loading")
		var3 = p1.schedule(60, function()
			-- upvalues: var3 (copy), var2 (copy), p2 (ref), var1 (copy)
			var3 = nil
			
			if var2 == p2 then
				p2.setStatus("Failed")
				
				if var1 ~= nil then
					var1.setStatus("Failed")
				end
			end
		end)
		
		if not pcall(p1.start, p2.config.placeId) and var2 == p2 then
			if var3 ~= nil then
				p1.cancel(var3)
				var3 = nil
			end
			var2 = nil
			p2.setStatus("Failed")
		end
	end
	
	local var4 = p1.subscribeStarted(function(p2)
		-- upvalues: var2 (write), var3 (write), p1 (ref), var1 (write), beginStart (ref)
		if p2 ~= "TeamCreate" or var2 == nil then return end
		var2 = nil
		
		if var3 ~= nil then
			p1.cancel(var3)
			var3 = nil
		end
		if var1 == nil or var1.getStatus(false) == "Failed" then
			p1.stop()
			
			return
		elseif var1 == var2 then
			var1.setStatus("Ready")
			
			return
		end
		beginStart(var1)
	end)
	
	return {
		getSource = function(p2)
			-- upvalues: t (ref), signalsModule (copy)
			local kind = `{p2.kind}:{p2.placeId}`
			
			if t[kind] == nil then
				local notReady, notReady_1 = signalsModule.createSignal("NotReady")
				local t_1 = {
					retainCount = 0,
					config = { kind = p2.kind, placeId = p2.placeId },
					getStatus = notReady,
					setStatus = notReady_1
				}
				t[kind] = t_1
				
				return t_1
			end
			return t[kind]
		end,
		retain = function(p2)
			-- upvalues: p1 (ref), var1 (write), var2 (write), beginStart (ref), t (ref)
			p2.retainCount += 1
			
			if p2.releaseToken ~= nil then
				p1.cancel(p2.releaseToken)
				p2.releaseToken = nil
			end
			if p2.config.kind == "LocalDataModel" then
				p2.setStatus("Ready")
			elseif var1 ~= p2 then
				p1.clear()
				
				if var1 ~= nil then
					var1.setStatus("NotReady")
				end
				var1 = p2
				p2.setStatus("Loading")
				
				if var2 == nil then
					beginStart(p2)
				end
			end
			local var5 = false
			
			return function()
				-- upvalues: var5 (write), p2 (ref), p1 (copy), t (copy), var1 (copy), var2 (copy)
				if var5 then return end
				var5 = true
				p2.retainCount -= 1
				
				if p2.retainCount == 0 then
					p2.releaseToken = p1.schedule(0.1, function()
						-- upvalues: p2 (copy), t (copy), var1 (copy), p1 (copy), var2 (copy)
						p2.releaseToken = nil
						
						if p2.retainCount ~= 0 then return end
						t[`{p2.config.kind}:{p2.config.placeId}`] = nil
						
						if var1 == p2 then
							var1 = nil
							p1.clear()
							
							if var2 == nil then
								p1.stop()
								
								return
							end
						elseif next(t) == nil then
							p1.clear()
						end
					end)
					
					return
				end
			end
		end,
		retry = function(p2)
			-- upvalues: var1 (write), var2 (write), beginStart (ref)
			if var1 == p2 and var2 == nil and p2.getStatus(false) == "Failed" then
				beginStart(p2)
			end
		end,
		destroy = function()
			-- upvalues: var4 (ref), var3 (write), p1 (ref), t (ref)
			var4()
			
			if var3 ~= nil then
				p1.cancel(var3)
				var3 = nil
			end
			for i, v in t do
				if v.releaseToken ~= nil then
					p1.cancel(v.releaseToken)
				end
			end
		end
	}
end