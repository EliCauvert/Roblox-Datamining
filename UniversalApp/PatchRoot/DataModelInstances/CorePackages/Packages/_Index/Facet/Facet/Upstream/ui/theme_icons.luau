local IconsModule = require("./icons")
local _ = require("./theme_types")

local function resolveIcon(p1, Text: string, p2)
	-- upvalues: IconsModule (copy), resolveIcon (copy)
	local Assets = p1.assets or {}
	local Icon = (p1.icons or {})[Text] or (IconsModule.BUILTIN[Text] or IconsModule.ART[Text])
	local Match: string? = string.match(Text, "^(.+)%.fill$")
	
	if Icon == nil and Match then
		return resolveIcon(p1, Match, p2)
	end
	if type(Icon) == "table" and Icon.default ~= nil then
		Icon = Icon[p2 or "default"] or Icon.default
	end
	if type(Icon) == "string" then
		Icon = Assets[Icon] or { contentId = Icon }
	end
	if type(Icon) ~= "table" then
		return nil
	end
	if Icon.codepoint ~= nil then
		return Icon
	end
	local Asset = if Icon.asset then Assets[Icon.asset] else Icon
	local ContentId = nil
	
	if Asset then
		ContentId = Asset.contentId
		
		if not ContentId then
			return Asset.content
		end
	else
		ContentId = nil
	end
	return ContentId
end

return resolveIcon