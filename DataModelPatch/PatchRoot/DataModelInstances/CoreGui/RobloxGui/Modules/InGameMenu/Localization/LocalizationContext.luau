local function _(p1)
	return p1:match("^(%w+)[-_]")
end

local LocalizationContextModule = {}
LocalizationContextModule.__index = LocalizationContextModule

function LocalizationContextModule.new(_translations)
	-- upvalues: LocalizationContextModule (copy)
	local config = { _translations = _translations }
	setmetatable(config, LocalizationContextModule)
	
	return config
end

function LocalizationContextModule:addTranslations(_translations)
	self._translations = _translations
end

function LocalizationContextModule:getRelevantLanguages()
	local List = {}
	table.insert(List, self)
	local W = self:match("^(%w+)[-_]")
	
	if W then
		table.insert(List, W)
	end
	table.insert(List, "en-us")
	
	return List
end

function LocalizationContextModule:_getSourceString(W, p1)
	local Translation = self._translations[W]
	
	return if Translation then Translation[p1] else nil
end

function LocalizationContextModule:getString(p1, p2, p3)
	local W = p1:match("^(%w+)[-_]")
	local SourceString = if W then self:_getSourceString(W, p2) else nil
	local EnUs = self:_getSourceString("en-us", p2)
	local SourceString1 = self:_getSourceString(p1, p2) or (SourceString or EnUs)
	
	if not SourceString1 then
		error(("Couldn't find value for translation key %q!\nTried these languages: %s, %s, %s"):format(p2, p1, W, "en-us"), 2)
	end
	return if p3 then SourceString1:gsub("{(.-)}", p3) else SourceString1
end

return LocalizationContextModule