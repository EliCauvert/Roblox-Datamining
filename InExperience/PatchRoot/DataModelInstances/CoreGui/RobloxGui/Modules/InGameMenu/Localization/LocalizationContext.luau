local function _(p0) --[[ line: 43 | named "getBaseLanguage" ]]
	return p0:match("^(%w+)[-_]")
end

local t = {}
t.__index = t

function t.new(p1) --[[ line: 50 ]]
	-- upvalues: t (ref)
	local t_1 = { _translations = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:addTranslations(p2) --[[ line: 64 ]]
	self._translations = p2
end

function t:getRelevantLanguages() --[[ line: 74 ]]
	local t = {}
	table.insert(t, self)
	local var3 = self:match("^(%w+)[-_]")
	
	if var3 then
		table.insert(t, var3)
	end
	table.insert(t, "en-us")
	
	return t
end

function t:_getSourceString(p3, p4) --[[ line: 91 ]]
	local var4 = self._translations[p3]
	
	return if var4 then var4[p4] else nil
end

function t:getString(p5, p6, p7) --[[ line: 106 ]]
	local var5 = p5:match("^(%w+)[-_]")
	local var6 = self:_getSourceString(p5, p6) or ((if var5 then self:_getSourceString(var5, p6) else nil) or self:_getSourceString("en-us", p6))
	
	if not var6 then
		error(("Couldn't find value for translation key %q!\nTried these languages: %s, %s, %s"):format(p6, p5, var5, "en-us"), 2)
	end
	return if p7 then var6:gsub("{(.-)}", p7) else var6
end

return t