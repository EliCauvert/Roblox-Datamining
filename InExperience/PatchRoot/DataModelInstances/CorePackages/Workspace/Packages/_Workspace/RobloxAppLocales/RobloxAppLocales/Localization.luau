local parent = script:FindFirstAncestor("RobloxAppLocales").Parent
local localizationContext = require(parent.Localization).LocalizationContext
local signal = require(parent.AppCommonLib).Signal
local locales = game:GetService("CoreGui").RobloxGui.Modules.Common:FindFirstChild("Locales")

local function loadTables(p0) --[[ line: 30 ]]
	-- upvalues: locales (ref), localizationContext (ref)
	if not locales then
		error("ERROR: Locales tables does not exist")
	end
	local t = {}
	
	for i, v in ipairs(localizationContext.getRelevantLanguages(p0)) do
		local var4 = locales:FindFirstChild(v)
		
		if var4 then
			t[v] = require(var4)
		end
	end
	return t
end

local t = {}
t.__index = t

function t.new(p1) --[[ line: 49 ]]
	-- upvalues: signal (ref), localizationContext (ref), loadTables (ref), t (ref)
	local t_1 = {
		locale = p1,
		changed = signal.new(),
		localizationContext = localizationContext.new(loadTables(p1))
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:SetLocale(p2) --[[ line: 59 ]]
	-- upvalues: loadTables (ref)
	self.locale = p2
	self.localizationContext:addTranslations(loadTables(p2))
	self.changed:fire()
end

function t:GetLocale() --[[ line: 66 ]]
	return self.locale
end

function t:Format(p3, p4) --[[ line: 70 ]]
	if not p3 then
		error("ERROR: NO STRING FOR KEY")
	end
	return self.localizationContext:getString(self.locale, p3, p4)
end

return t