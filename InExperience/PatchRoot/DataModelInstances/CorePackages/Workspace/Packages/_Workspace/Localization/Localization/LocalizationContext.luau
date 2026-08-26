local t = {}
t.__index = t

function t:getBaseLanguage()
	return self:match("^(%w+)[-_]")
end

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = { _translations = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:addTranslations(p1)
	self._translations = p1
end

function t.getRelevantLanguages(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	table.insert(t_1, p1)
	local baseLanguage = t.getBaseLanguage(p1)
	
	if baseLanguage then
		table.insert(t_1, baseLanguage)
	end
	table.insert(t_1, "en-us")
	
	return t_1
end

function t:_getSourceString(p1, p2)
	local var1 = self._translations[p1]
	
	return if var1 then var1[p2] else nil
end

function t:getString(p1, p2, p3)
	-- upvalues: t (ref)
	local baseLanguage = t.getBaseLanguage(p1)
	local var1 = self:_getSourceString(p1, p2) or ((if baseLanguage then self:_getSourceString(baseLanguage, p2) else nil) or self:_getSourceString("en-us", p2))
	
	if not var1 then
		error(("Couldn't find value for translation key %q!\nTried these languages: %s, %s, %s"):format(p2, p1, baseLanguage, "en-us"), 2)
	end
	return if p3 then var1:gsub("{(.-)}", p3) else var1
end

return t