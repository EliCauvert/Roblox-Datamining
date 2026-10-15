local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local cryoModule = require(sduiSharedUtilities.Parent.Cryo)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)

local function createSduiTemplateStore()
	-- upvalues: cryoModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	return {
		getTemplate = function(p1)
			-- upvalues: t (write)
			return t[p1]
		end,
		addTemplates = function(p1)
			-- upvalues: t (write), cryoModule (copy)
			t = cryoModule.Dictionary.join(t, p1)
		end,
		recordSurfaceTemplates = function(p1, p2)
			-- upvalues: t_1 (write)
			if p2 == nil then return end
			local var1 = t_1[p1]
			
			if var1 == nil then
				var1 = {}
				t_1[p1] = var1
			end
			for i, v in p2 do
				var1[i] = v
			end
		end,
		getCachedRobloxComponentToTemplateId = function(p3)
			-- upvalues: t_1 (write)
			local var2 = t_1[p3]
			
			return if var2 == nil then {} else var2
		end,
		getTemplateForRobloxComponent = function(p3, p4)
			-- upvalues: t_1 (write), t (write)
			local var2 = t_1[p3]
			
			if var2 == nil then
				return nil
			end
			local var3 = var2[p4]
			
			return if var3 == nil then nil else t[var3]
		end,
		getSurfaceTemplateMaps = function(p3)
			-- upvalues: t_1 (write), t (write)
			local t_2 = {}
			local t_3 = {}
			local var2 = t_1[p3]
			
			if var2 == nil then
				return t_2, t_3
			end
			for i, v in var2 do
				local var3 = t[v]
				
				if var3 then
					t_3[i] = var3
					t_2[v] = var3
				end
			end
			return t_2, t_3
		end,
		addLocalizedLiterals = function(p4)
			-- upvalues: t_2 (write)
			t_2 = t_2 or {}
			assert(t_2, "localizedLiterals is nil")
			
			for i, v in p4 do
				t_2[i] = v
			end
		end,
		getLocalizedLiterals = function()
			-- upvalues: t_2 (write)
			return t_2 or {}
		end,
		clear = function()
			-- upvalues: t (write), t_1 (write), t_2 (write)
			t = {}
			t_1 = {}
			t_2 = {}
		end
	}
end

local var4 = nil

return function()
	-- upvalues: var4 (write), createSduiTemplateStore (ref)
	if var4 == nil then
		var4 = createSduiTemplateStore()
	end
	return var4
end