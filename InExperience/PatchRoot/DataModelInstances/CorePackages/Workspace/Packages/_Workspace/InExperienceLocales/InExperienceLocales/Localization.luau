local parent = script:FindFirstAncestor("InExperienceLocales").Parent
local localizationContext = require(parent.Localization).LocalizationContext
local signal = require(parent.AppCommonLib).Signal
local locales = game:GetService("CoreGui").RobloxGui.Modules.Common:FindFirstChild("Locales")

local function loadTables(p1)
	-- upvalues: locales (ref), localizationContext (ref)
	if not locales then
		error("ERROR: Locales tables does not exist")
	end
	local t = {}
	
	for i, v in ipairs(localizationContext.getRelevantLanguages(p1)) do
		local var1 = locales:FindFirstChild(v)
		
		if var1 then
			t[v] = require(var1)
		end
	end
	return t
end

local t = {}
t.__index = t

function t.new(p2)
	-- upvalues: signal (ref), localizationContext (ref), loadTables (ref), t (ref)
	local t_1 = {
		locale = p2,
		changed = signal.new(),
		localizationContext = localizationContext.new(loadTables(p2))
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:SetLocale(p2)
	-- upvalues: loadTables (ref)
	self.locale = p2
	self.localizationContext:addTranslations(loadTables(p2))
	self.changed:fire()
end

function t:GetLocale()
	return self.locale
end

function t:Format(p2, p3)
	if not p2 then
		error("ERROR: NO STRING FOR KEY")
	end
	return self.localizationContext:getString(self.locale, p2, p3)
end

return t