local Modules = game:GetService("CoreGui").RobloxGui.Modules
local DisplayTypeModule = require(Modules.LuaApp.Enum.AccountSecurity.DisplayType)
local PromptTypeModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptType)

return require(Modules.Common.Rodux).makeActionCreator(script.Name, function(IsGeneric, PromptType, Metadata)
	-- upvalues: PromptTypeModule (copy), DisplayTypeModule (copy)
	assert(PromptType == nil or (PromptTypeModule.isEnumValue(PromptType) or IsGeneric and (typeof(Metadata) == "table" and DisplayTypeModule.isEnumValue(DisplayTypeModule.fromRawValue(Metadata.displayType)))), "Expected the passed prompt type must either be a valid enum value or nil")
	
	return {
		isGeneric = IsGeneric,
		promptType = PromptType,
		metadata = Metadata,
		lastUpdatedPromptTypeAt = DateTime.now()
	}
end)