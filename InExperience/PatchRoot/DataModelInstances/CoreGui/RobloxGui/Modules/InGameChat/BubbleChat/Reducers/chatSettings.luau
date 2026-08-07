local corePackagesService = game:GetService("CorePackages")
local _ = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local updateChatSettingsModule = require(script.Parent.Parent.Actions.UpdateChatSettings)
local chatSettingsModule = require(script.Parent.Parent.ChatSettings)

local function deepCopy(p0) --[[ line: 9 ]]
	-- upvalues: deepCopy (ref)
	if type(p0) ~= "table" then
		return p0
	end
	local t = {}
	
	for i, v in pairs(p0) do
		t[i] = deepCopy(v)
	end
	return t
end

local function mergeInto(p1, p2) --[[ line: 22 ]]
	-- upvalues: mergeInto (ref)
	for i, v in pairs(p2) do
		if type(v) ~= "table" then
			p1[i] = v
		elseif p1[i] then
			mergeInto(p1[i], v)
		end
	end
end

return roduxModule.createReducer(chatSettingsModule, {
	[updateChatSettingsModule.name] = function(_, p3) --[[ line: 33 ]]
		-- upvalues: deepCopy (ref), chatSettingsModule (ref), mergeInto (ref)
		local var7 = deepCopy(chatSettingsModule)
		mergeInto(var7, p3.settings)
		local userSpecificSettings = p3.settings.UserSpecificSettings
		
		if userSpecificSettings then
			for i, v in pairs(userSpecificSettings) do
				local var8 = deepCopy(chatSettingsModule)
				var8.UserSpecificSettings = nil
				mergeInto(var8, v)
				var7.UserSpecificSettings[i] = var8
			end
		end
		return var7
	end
})