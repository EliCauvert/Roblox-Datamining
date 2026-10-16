local Parent = script:FindFirstAncestor("RobloxAppLocales").Parent
local LocalizationContext = require(Parent.Localization).LocalizationContext
local Signal = require(Parent.AppCommonLib).Signal
local Locales = game:GetService("CoreGui").RobloxGui.Modules.Common:FindFirstChild("Locales")

local function loadTables(Locale) --[[ Line: 30 ]]
	-- upvalues: Locales (copy), LocalizationContext (copy)
	if not Locales then
		error("ERROR: Locales tables does not exist")
	end
	local t = {}
	
	for _, ChildName in ipairs((LocalizationContext.getRelevantLanguages(Locale))) do
		local Child = Locales:FindFirstChild(ChildName)
		
		if Child then
			t[ChildName] = require(Child)
		end
	end
	return t
end

local LocalizationModule = {}
LocalizationModule.__index = LocalizationModule

function LocalizationModule.new(Locale) --[[ Line: 49 ]]
	-- upvalues: Signal (copy), LocalizationContext (copy), loadTables (copy), LocalizationModule (copy)
	local config = {
		locale = Locale,
		changed = Signal.new(),
		localizationContext = LocalizationContext.new((loadTables(Locale)))
	}
	setmetatable(config, LocalizationModule)
	
	return config
end

function LocalizationModule:SetLocale(Locale) --[[ Line: 59 ]]
	-- upvalues: loadTables (copy)
	self.locale = Locale
	self.localizationContext:addTranslations((loadTables(Locale)))
	self.changed:fire()
end

function LocalizationModule:GetLocale() --[[ Line: 66 ]]
	return self.locale
end

function LocalizationModule:Format(p1, p2) --[[ Line: 70 ]]
	if not p1 then
		error("ERROR: NO STRING FOR KEY")
	end
	return (self.localizationContext:getString(self.locale, p1, p2))
end

return LocalizationModule