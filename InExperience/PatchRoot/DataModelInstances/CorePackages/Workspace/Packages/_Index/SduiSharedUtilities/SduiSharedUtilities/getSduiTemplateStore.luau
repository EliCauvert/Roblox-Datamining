local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local cryoModule = require(sduiSharedUtilities.Parent.Cryo)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)

local function createSduiTemplateStore() --[[ line: 24 ]]
	-- upvalues: cryoModule (ref)
	local t = {}
	local t_1 = {}
	
	return {
		getTemplate = function(p0) --[[ line: 35 ]]
			-- upvalues: t (write)
			return t[p0]
		end,
		addTemplates = function(p1) --[[ line: 41 ]]
			-- upvalues: t (write), cryoModule (copy)
			t = cryoModule.Dictionary.join(t, p1)
		end,
		recordSurfaceTemplates = function(p2, p3) --[[ line: 48 ]]
			-- upvalues: t_1 (write)
			if p3 == nil then return end
			local var6 = t_1[p2]
			
			if var6 == nil then
				var6 = {}
				t_1[p2] = var6
			end
			for i, v in p3 do
				var6[i] = v
			end
		end,
		getCachedRobloxComponentToTemplateId = function(p4) --[[ line: 66 ]]
			-- upvalues: t_1 (write)
			local var7 = t_1[p4]
			
			return if var7 == nil then {} else var7
		end,
		getTemplateForRobloxComponent = function(p5, p6) --[[ line: 76 ]]
			-- upvalues: t_1 (write), t (write)
			local var8 = t_1[p5]
			
			if var8 == nil then
				return nil
			end
			local var9 = var8[p6]
			
			return if var9 == nil then nil else t[var9]
		end,
		clear = function() --[[ line: 88 ]]
			-- upvalues: t (write), t_1 (write)
			t = {}
			t_1 = {}
		end
	}
end

local var3 = nil

return function() --[[ line: 108 | named "getSduiTemplateStore" ]]
	-- upvalues: var3 (write), createSduiTemplateStore (ref)
	if var3 == nil then
		var3 = createSduiTemplateStore()
	end
	return var3
end