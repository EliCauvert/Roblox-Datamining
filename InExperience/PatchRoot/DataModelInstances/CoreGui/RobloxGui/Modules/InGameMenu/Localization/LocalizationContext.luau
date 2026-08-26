local function _(p1)
	return p1:match("^(%w+)[-_]")
end

local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = { _translations = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:addTranslations(p1)
	self._translations = p1
end

function t:getRelevantLanguages()
	local t = {}
	table.insert(t, self)
	local var1 = self:match("^(%w+)[-_]")
	
	if var1 then
		table.insert(t, var1)
	end
	table.insert(t, "en-us")
	
	return t
end

function t:_getSourceString(p1, p2)
	local var1 = self._translations[p1]
	
	return if var1 then var1[p2] else nil
end

function t:getString(p1, p2, p3)
	local var1 = p1:match("^(%w+)[-_]")
	local var2 = self:_getSourceString(p1, p2) or ((if var1 then self:_getSourceString(var1, p2) else nil) or self:_getSourceString("en-us", p2))
	
	if not var2 then
		error(("Couldn't find value for translation key %q!\nTried these languages: %s, %s, %s"):format(p2, p1, var1, "en-us"), 2)
	end
	return if p3 then var2:gsub("{(.-)}", p3) else var2
end

return t