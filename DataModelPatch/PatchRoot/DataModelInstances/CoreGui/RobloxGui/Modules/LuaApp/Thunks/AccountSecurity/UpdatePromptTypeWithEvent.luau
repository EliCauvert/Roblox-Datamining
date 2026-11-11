local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AccountSecurityPromptEventModule = require(Modules.LuaApp.Analytics.Events.accountSecurityPromptEvent)
local DisplayTypeModule = require(Modules.LuaApp.Enum.AccountSecurity.DisplayType)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local PromptTypeModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptType)
local UpdatePromptTypeModule = require(Modules.LuaApp.Actions.AccountSecurity.UpdatePromptType)

return function(p1, p2, PromptType, p3)
	-- upvalues: PromptTypeModule (copy), DisplayTypeModule (copy), OverlayTypeModule (copy), AccountSecurityPromptEventModule (copy), EventStreamConstantsModule (copy), UpdatePromptTypeModule (copy)
	assert(PromptType == nil or (PromptTypeModule.isEnumValue(PromptType) or p2 and (typeof(p3) == "table" and DisplayTypeModule.isEnumValue(DisplayTypeModule.fromRawValue(p3.displayType)))), "Invalid arguments for UpdatePromptTypeWithEvent")
	
	return function(p4)
		-- upvalues: PromptType (copy), OverlayTypeModule (upval), PromptTypeModule (upval), AccountSecurityPromptEventModule (upval), p1 (copy), EventStreamConstantsModule (upval), UpdatePromptTypeModule (upval), p2 (copy), p3 (copy)
		local OverlayType = p4:getState().CentralOverlay.OverlayType
		local PromptType1 = p4:getState().AccountSecurityPrompt.promptType
		
		if PromptType ~= nil and OverlayType ~= OverlayTypeModule.AccountSecurityPromptOverlay and PromptType ~= PromptType1 then
			local RawValue = PromptTypeModule.toRawValue(PromptType)
			
			if RawValue == nil then
				RawValue = PromptType
			end
			AccountSecurityPromptEventModule(p1.EventStream, EventStreamConstantsModule.Context.ModalStateViewed, RawValue, "NONE")
		end
		p4:dispatch(UpdatePromptTypeModule(p2, PromptType, p3))
	end
end