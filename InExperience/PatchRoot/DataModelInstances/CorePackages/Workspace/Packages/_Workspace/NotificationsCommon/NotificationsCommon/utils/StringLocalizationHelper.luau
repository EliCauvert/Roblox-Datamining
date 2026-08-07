local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(script:FindFirstAncestor("NotificationsCommon").type)
local robloxTranslatorModule = require(parent.RobloxTranslator)

return {
	getLocalizedStrings = function(p0) --[[ line: 13 ]]
		-- upvalues: reactModule (ref), localizationRoactContext (ref), useLocalization (ref), robloxTranslatorModule (ref)
		if reactModule.useContext(localizationRoactContext) ~= nil then
			return useLocalization(p0)
		end
		local t = {}
		
		for i, v in pairs(p0) do
			local ok, status = pcall(function() --[[ line: 24 ]]
				-- upvalues: robloxTranslatorModule (copy), v (ref)
				return robloxTranslatorModule:FormatByKey(v)
			end)
			
			if ok then
				t[i] = status
			else
				t[i] = v
			end
		end
		return t
	end
}