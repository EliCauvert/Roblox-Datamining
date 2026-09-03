local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local cryoModule = require(parent.Cryo)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local fFlagSduiClientDrivenTemplates = require(parent.SharedFlags).FFlagSduiClientDrivenTemplates

local function createSduiTemplateStore()
	-- upvalues: fFlagSduiClientDrivenTemplates (ref), cryoModule (ref)
	local t = {}
	local t_1 = {}
	local var1 = if fFlagSduiClientDrivenTemplates then {} else nil
	
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
			local var2 = t_1[p1]
			
			if var2 == nil then
				var2 = {}
				t_1[p1] = var2
			end
			for i, v in p2 do
				var2[i] = v
			end
		end,
		getCachedRobloxComponentToTemplateId = function(p3)
			-- upvalues: t_1 (write)
			local var3 = t_1[p3]
			
			return if var3 == nil then {} else var3
		end,
		getTemplateForRobloxComponent = function(p3, p4)
			-- upvalues: t_1 (write), t (write)
			local var3 = t_1[p3]
			
			if var3 == nil then
				return nil
			end
			local var4 = var3[p4]
			
			return if var4 == nil then nil else t[var4]
		end,
		getSurfaceTemplateMaps = if fFlagSduiClientDrivenTemplates then function(p3)
			-- upvalues: t_1 (write), t (write)
			local t_2 = {}
			local t_3 = {}
			local var3 = t_1[p3]
			
			if var3 == nil then
				return t_2, t_3
			end
			for i, v in var3 do
				local var4 = t[v]
				
				if var4 then
					t_3[i] = var4
					t_2[v] = var4
				end
			end
			return t_2, t_3
		end else nil,
		addLocalizedLiterals = if fFlagSduiClientDrivenTemplates then function(p4)
			-- upvalues: var1 (write)
			var1 = var1 or {}
			assert(var1, "localizedLiterals is nil")
			
			for i, v in p4 do
				var1[i] = v
			end
		end else nil,
		getLocalizedLiterals = if fFlagSduiClientDrivenTemplates then function()
			-- upvalues: var1 (write)
			return var1 or {}
		end else nil,
		clear = function()
			-- upvalues: t (write), t_1 (write), fFlagSduiClientDrivenTemplates (copy), var1 (write)
			t = {}
			t_1 = {}
			
			if fFlagSduiClientDrivenTemplates then
				var1 = {}
			end
		end
	}
end

local var5 = nil

return function()
	-- upvalues: var5 (write), createSduiTemplateStore (ref)
	if var5 == nil then
		var5 = createSduiTemplateStore()
	end
	return var5
end