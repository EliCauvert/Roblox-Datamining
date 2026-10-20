local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local CryoModule = require(SduiSharedUtilities.Parent.Cryo)
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)

local function createSduiTemplateStore()
	-- upvalues: CryoModule (copy)
	local JoinResult = {}
	local t = {}
	local t1 = {}
	
	return {
		getTemplate = function(p1)
			-- upvalues: JoinResult (ref)
			return JoinResult[p1]
		end,
		addTemplates = function(p1)
			-- upvalues: JoinResult (ref), CryoModule (upval)
			JoinResult = CryoModule.Dictionary.join(JoinResult, p1)
		end,
		recordSurfaceTemplates = function(Key, List)
			-- upvalues: t (ref)
			if List == nil then return end
			local Entry = t[Key]
			
			if Entry == nil then
				Entry = {}
				t[Key] = Entry
			end
			for i, value in List do
				Entry[i] = value
			end
		end,
		getCachedRobloxComponentToTemplateId = function(p1)
			-- upvalues: t (ref)
			local Entry = t[p1]
			
			return if Entry == nil then {} else Entry
		end,
		getTemplateForRobloxComponent = function(p1, p2)
			-- upvalues: t (ref), JoinResult (ref)
			local Entry = t[p1]
			
			if Entry == nil then
				return nil
			else
				local Entry1 = Entry[p2]
				
				return if Entry1 == nil then nil else JoinResult[Entry1]
			end
		end,
		getSurfaceTemplateMaps = function(p1)
			-- upvalues: t (ref), JoinResult (ref)
			local t2 = {}
			local t3 = {}
			local Entry = t[p1]
			
			if Entry == nil then
				return t2, t3
			end
			for i, value in Entry do
				local JoinResultEntry = JoinResult[value]
				
				if JoinResultEntry then
					t3[i] = JoinResultEntry
					t2[value] = JoinResultEntry
				end
			end
			return t2, t3
		end,
		addLocalizedLiterals = function(List)
			-- upvalues: t2 (ref)
			t2 = t2 or {}
			assert(t2, "localizedLiterals is nil")
			
			for i, value in List do
				t2[i] = value
			end
		end,
		getLocalizedLiterals = function()
			-- upvalues: t2 (ref)
			return t2 or {}
		end,
		clear = function()
			-- upvalues: JoinResult (ref), t (ref), t2 (ref)
			JoinResult = {}
			t = {}
			t2 = {}
		end
	}
end

local v1 = nil

return function()
	-- upvalues: v1 (ref), createSduiTemplateStore (copy)
	if v1 == nil then
		v1 = createSduiTemplateStore()
	end
	return v1
end