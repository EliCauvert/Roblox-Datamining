local corePackagesService = game:GetService("CorePackages")
local _ = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local updateChatSettingsModule = require(script.Parent.Parent.Actions.UpdateChatSettings)
local chatSettingsModule = require(script.Parent.Parent.ChatSettings)

local function deepCopy(p1)
	-- upvalues: deepCopy (ref)
	if type(p1) ~= "table" then
		return p1
	end
	local t = {}
	
	for i, v in pairs(p1) do
		t[i] = deepCopy(v)
	end
	return t
end

local function mergeInto(p2, p3)
	-- upvalues: mergeInto (ref)
	for i, v in pairs(p3) do
		if type(v) ~= "table" then
			p2[i] = v
		elseif p2[i] then
			mergeInto(p2[i], v)
		end
	end
end

return roduxModule.createReducer(chatSettingsModule, {
	[updateChatSettingsModule.name] = function(_, p4)
		-- upvalues: deepCopy (ref), chatSettingsModule (ref), mergeInto (ref)
		local var1 = deepCopy(chatSettingsModule)
		mergeInto(var1, p4.settings)
		local userSpecificSettings = p4.settings.UserSpecificSettings
		
		if userSpecificSettings then
			for i, v in pairs(userSpecificSettings) do
				local var2 = deepCopy(chatSettingsModule)
				var2.UserSpecificSettings = nil
				mergeInto(var2, v)
				var1.UserSpecificSettings[i] = var2
			end
		end
		return var1
	end
})