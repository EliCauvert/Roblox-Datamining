local t = {}
t.__index = t

function t:getBaseLanguage()
	return self:match("^(%w+)[-_]")
end

function t.new(p0)
	-- upvalues: t (ref)
	local t_1 = { _translations = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:addTranslations(p1)
	self._translations = p1
end

function t.getRelevantLanguages(p2)
	-- upvalues: t (ref)
	local t_1 = {}
	table.insert(t_1, p2)
	local baseLanguage = t.getBaseLanguage(p2)
	
	if baseLanguage then
		table.insert(t_1, baseLanguage)
	end
	table.insert(t_1, "en-us")
	
	return t_1
end

function t:_getSourceString(p3, p4)
	local var4 = self._translations[p3]
	
	return if var4 then var4[p4] else nil
end

function t:getString(p5, p6, p7)
	-- upvalues: t (ref)
	local baseLanguage = t.getBaseLanguage(p5)
	local var6 = self:_getSourceString(p5, p6) or ((if baseLanguage then self:_getSourceString(baseLanguage, p6) else nil) or self:_getSourceString("en-us", p6))
	
	if not var6 then
		error(("Couldn't find value for translation key %q!\nTried these languages: %s, %s, %s"):format(p6, p5, baseLanguage, "en-us"), 2)
	end
	return if p7 then var6:gsub("{(.-)}", p7) else var6
end

return t