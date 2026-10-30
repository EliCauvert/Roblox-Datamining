local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local FFlagSduiHostedDependencies = require(SduiCoreSystem.Parent.SharedFlags).FFlagSduiHostedDependencies
local _ = require(SduiCoreSystem.SduiBuilderTypes)

local function createSduiServiceDependenciesStore()
	-- upvalues: FFlagSduiHostedDependencies (copy), SduiLoggerModule (copy), SduiErrorsModule (copy)
	local Dependencies = nil
	local T = if FFlagSduiHostedDependencies then {} else nil
	local Config = if FFlagSduiHostedDependencies then {
		__index = function(_, p1)
			-- upvalues: Dependencies (ref)
			return if Dependencies then Dependencies[p1] else nil
		end
	} else nil
	
	local function setScopedDependencies(Key, Tbl)
		-- upvalues: T (copy), Config (copy)
		local Entry = T[Key]
		
		if Entry == nil then
			Entry = {}
			T[Key] = Entry
		end
		local self = setmetatable(table.clone(Tbl), Config)
		table.insert(Entry, self)
		
		return function()
			-- upvalues: Entry (ref), self (copy), T (upval), Key (copy)
			local FoundIndex: number? = table.find(Entry, self)
			
			if FoundIndex then
				table.remove(Entry, FoundIndex)
			end
			if #Entry == 0 and T[Key] == Entry then
				T[Key] = nil
			end
		end
	end
	
	return {
		getDependencies = function(p1)
			-- upvalues: Dependencies (ref), FFlagSduiHostedDependencies (upval), T (copy), SduiLoggerModule (upval), SduiErrorsModule (upval)
			local Dependencies1 = Dependencies
			
			if FFlagSduiHostedDependencies then
				local Entry = T[p1]
				Dependencies1 = if Entry then Entry[#Entry] else Dependencies
			end
			if Dependencies1 == nil then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.GetNilDependencies, { message = "Getting dependencies before they were set" }, p1)
			end
			return Dependencies1
		end,
		setDependencies = function(Value)
			-- upvalues: Dependencies (ref)
			Dependencies = Value
		end,
		setScopedDependencies = if FFlagSduiHostedDependencies then setScopedDependencies else nil
	}
end

local v1 = nil

return function()
	-- upvalues: v1 (ref), createSduiServiceDependenciesStore (copy)
	if v1 == nil then
		v1 = createSduiServiceDependenciesStore()
	end
	return v1
end