local LocalizationContextModule = {}
LocalizationContextModule.__index = LocalizationContextModule

function LocalizationContextModule:getBaseLanguage() --[[ Line: 47 ]]
	return self:match("^(%w+)[-_]")
end

function LocalizationContextModule.new(_translations) --[[ Line: 51 ]]
	-- upvalues: LocalizationContextModule (copy)
	local config = { _translations = _translations }
	setmetatable(config, LocalizationContextModule)
	
	return config
end

function LocalizationContextModule:addTranslations(_translations) --[[ Line: 65 ]]
	self._translations = _translations
end

function LocalizationContextModule.getRelevantLanguages(p1) --[[ Line: 75 ]]
	-- upvalues: LocalizationContextModule (copy)
	local List = {}
	table.insert(List, p1)
	local BaseLanguage = LocalizationContextModule.getBaseLanguage(p1)
	
	if BaseLanguage then
		table.insert(List, BaseLanguage)
	end
	table.insert(List, "en-us")
	
	return List
end

function LocalizationContextModule:_getSourceString(BaseLanguage, p1) --[[ Line: 92 ]]
	local Translation = self._translations[BaseLanguage]
	
	return if Translation then Translation[p1] else nil
end

function LocalizationContextModule:getString(p1, p2, p3) --[[ Line: 107 ]]
	-- upvalues: LocalizationContextModule (copy)
	local BaseLanguage = LocalizationContextModule.getBaseLanguage(p1)
	local SourceString = if BaseLanguage then self:_getSourceString(BaseLanguage, p2) else nil
	local EnUs = self:_getSourceString("en-us", p2)
	local SourceString1 = self:_getSourceString(p1, p2) or (SourceString or EnUs)
	
	if not SourceString1 then
		error(("Couldn't find value for translation key %q!\nTried these languages: %s, %s, %s"):format(p2, p1, BaseLanguage, "en-us"), 2)
	end
	return if p3 then SourceString1:gsub("{(.-)}", p3) else SourceString1
end

return LocalizationContextModule