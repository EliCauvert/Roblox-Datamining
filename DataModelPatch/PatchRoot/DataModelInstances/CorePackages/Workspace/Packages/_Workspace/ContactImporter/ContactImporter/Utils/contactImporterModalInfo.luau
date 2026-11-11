local ConstantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local GetFIntContactImporterModalDisplayMaxCountModule = require(script.Parent.Parent.Flags.getFIntContactImporterModalDisplayMaxCount)
local GetFIntContactImporterModalDisplayMinDaysModule = require(script.Parent.Parent.Flags.getFIntContactImporterModalDisplayMinDays)
local EngineFeature = game:GetEngineFeature(ConstantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	isUserOptedInLocalStorage = function(_, p1, p2): boolean
		-- upvalues: EngineFeature (copy), ConstantsModule (copy)
		if not EngineFeature then
			return false
		end
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), ConstantsModule (upval)
			return p1:GetItem(ConstantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS)
		end)
		
		if Success then
			for i in string.gmatch(Result or "", "([^,]+)") do
				if p2 == i then
					return true
				end
			end
		end
		return false
	end,
	shouldUserSeeModalPotentiallyAgain = function(_, p3, p4): boolean
		-- upvalues: EngineFeature (copy), ConstantsModule (copy), GetFIntContactImporterModalDisplayMaxCountModule (copy), GetFIntContactImporterModalDisplayMinDaysModule (copy)
		if not EngineFeature then
			return true
		end
		local Success, Result = pcall(function()
			-- upvalues: p3 (copy), ConstantsModule (upval)
			return p3:GetItem(ConstantsModule.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT)
		end)
		
		if not Success then
			return true
		end
		local Number = 0
		local Parts = nil
		
		for i in string.gmatch(Result or "", "([^,]+)") do
			Parts = string.split(i, ":")
			
			if Parts[1] == p4 then
				Number = tonumber(Parts[2]) or 0
				break
			end
		end
		if Number <= GetFIntContactImporterModalDisplayMaxCountModule() then
			return true
		end
		local Success1, Result1 = pcall(function()
			-- upvalues: p3 (copy), ConstantsModule (upval)
			return p3:GetItem(ConstantsModule.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP)
		end)
		
		if not Success1 then
			return true
		end
		local Number1 = 0
		local Parts1 = nil
		
		for i1 in string.gmatch(Result1 or "", "([^,]+)") do
			Parts1 = string.split(i1, ":")
			
			if Parts1[1] == p4 then
				Number1 = tonumber(Parts1[2]) or 0
				break
			end
		end
		return Number1 + GetFIntContactImporterModalDisplayMinDaysModule() * 86400000 <= DateTime.now().UnixTimestampMillis
	end
}