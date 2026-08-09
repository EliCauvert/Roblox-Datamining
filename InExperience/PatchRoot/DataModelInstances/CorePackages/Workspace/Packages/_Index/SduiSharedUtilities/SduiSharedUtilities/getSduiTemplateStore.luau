local cryoModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.Cryo)

local function createSduiTemplateStore() --[[ line: 38 ]]
	-- upvalues: cryoModule (ref)
	local t = {}
	local t_1 = {}
	
	return {
		getTemplate = function(p0) --[[ line: 49 ]]
			-- upvalues: t (write)
			return t[p0]
		end,
		addTemplates = function(p1) --[[ line: 55 ]]
			-- upvalues: t (write), cryoModule (copy)
			t = cryoModule.Dictionary.join(t, p1)
		end,
		recordSurfaceTemplates = function(p2, p3) --[[ line: 62 ]]
			-- upvalues: t_1 (write)
			if p3 == nil then return end
			local var5 = t_1[p2]
			
			if var5 == nil then
				var5 = {}
				t_1[p2] = var5
			end
			for i, v in p3 do
				var5[i] = v
			end
		end,
		getCachedRobloxComponentToTemplateId = function(p4) --[[ line: 80 ]]
			-- upvalues: t_1 (write)
			local var6 = t_1[p4]
			
			return if var6 == nil then {} else var6
		end,
		getTemplateForRobloxComponent = function(p5, p6) --[[ line: 90 ]]
			-- upvalues: t_1 (write), t (write)
			local var7 = t_1[p5]
			
			if var7 == nil then
				return nil
			end
			local var8 = var7[p6]
			
			return if var8 == nil then nil else t[var8]
		end,
		clear = function() --[[ line: 102 ]]
			-- upvalues: t (write), t_1 (write)
			t = {}
			t_1 = {}
		end
	}
end

local var2 = nil

return function() --[[ line: 122 | named "getSduiTemplateStore" ]]
	-- upvalues: var2 (write), createSduiTemplateStore (ref)
	if var2 == nil then
		var2 = createSduiTemplateStore()
	end
	return var2
end