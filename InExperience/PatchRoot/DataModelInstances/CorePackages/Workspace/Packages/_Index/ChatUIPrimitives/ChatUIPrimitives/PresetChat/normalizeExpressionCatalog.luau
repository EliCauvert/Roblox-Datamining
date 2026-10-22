local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(ChatUIPrimitives.Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(ChatUIPrimitives.UniversalMessage.Types)

local function mapPreset(PresetId, Text, PresetVersion)
	if type(PresetId) ~= "string" or PresetId == "" or type(Text) ~= "string" then
		return nil
	end
	local Content = { kind = "preset", presetId = PresetId, text = Text }
	
	if type(PresetVersion) == "string" then
		Content.presetVersion = PresetVersion
	end
	return { content = Content }
end

local function mapEmoji(Content)
	local EmoteId = Content.emoteId
	
	if type(EmoteId) ~= "string" or EmoteId == "" then
		return nil
	end
	local Content1 = { kind = "emoji", emojiId = EmoteId }
	
	if type(Content.unicode) == "string" then
		Content1.unicode = Content.unicode
	end
	if type(Content.name) == "string" then
		Content1.name = Content.name
	end
	return { content = Content1 }
end

local function _(Content)
	-- upvalues: mapPreset (copy), mapEmoji (copy)
	return if type(Content) == "table" then if Content.kind == "Preset" then mapPreset(Content.presetId, Content.text, Content.presetVersion) elseif Content.kind == "Emoji" then mapEmoji(Content) else nil else nil
end

local _ = function(p1)
	-- upvalues: mapPreset (copy)
	return if type(p1) == "table" then mapPreset(p1.presetId, p1.value, nil) else nil
end

local function mapCategory(p1)
	-- upvalues: EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy), mapPreset (copy), mapEmoji (copy)
	if type(p1) ~= "table" then
		return nil
	end
	local CategoryId = p1.categoryId
	
	if type(CategoryId) ~= "string" or CategoryId == "" then
		return nil
	end
	local Contents = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then p1.contents else p1.messages
	
	if type(Contents) ~= "table" then
		return nil
	end
	local Items = {}
	
	for _, content in Contents do
		local MapPresetResult = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then if type(content) == "table" then if content.kind == "Preset" then mapPreset(content.presetId, content.text, content.presetVersion) elseif content.kind == "Emoji" then mapEmoji(content) else nil else nil elseif type(content) == "table" then mapPreset(content.presetId, content.value, nil) else nil
		
		if MapPresetResult ~= nil then
			table.insert(Items, MapPresetResult)
		end
	end
	if #Items == 0 then
		return nil
	end
	local config = { categoryId = CategoryId, items = Items }
	local Name = p1.name
	
	if type(Name) == "string" then
		config.name = Name
	end
	return config
end

local function mapGroup(p2)
	-- upvalues: mapCategory (copy)
	if type(p2) ~= "table" then
		return nil
	end
	local CategoryGroupId = p2.categoryGroupId
	
	if type(CategoryGroupId) ~= "string" or CategoryGroupId == "" then
		return nil
	end
	if type(p2.categories) ~= "table" then
		return nil
	end
	local Categories = {}
	
	for _, category in p2.categories do
		local MapCategoryResult = mapCategory(category)
		
		if MapCategoryResult ~= nil then
			table.insert(Categories, MapCategoryResult)
		end
	end
	if #Categories == 0 then
		return nil
	end
	local config = {
		categoryGroupId = CategoryGroupId,
		categories = Categories
	}
	local Name = p2.name
	
	if type(Name) == "string" then
		config.name = Name
	end
	return config
end

local _ = function(p3)
	return if p3 == "Enabled" then "enabled" elseif p3 == "ReadOnly" or p3 == "Disabled" then "disabled" else nil
end

return function(p3)
	-- upvalues: EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy), mapGroup (copy)
	if type(p3) ~= "table" then
		return nil
	end
	local Status = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then p3.status else p3.accessLevel
	
	if type(Status) ~= "string" then
		return nil
	end
	local Enabled = if Status == "Enabled" then "enabled" elseif Status == "ReadOnly" or Status == "Disabled" then "disabled" else nil
	
	if Enabled == nil then
		return nil
	end
	local Version = p3.version
	
	if not EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint and Status ~= "Disabled" and (type(Version) ~= "string" or Version == "") then
		return nil
	end
	local CategoryGroups = {}
	
	if type(p3.categoryGroups) == "table" then
		for _, categoryGroup in p3.categoryGroups do
			local MapGroupResult = mapGroup(categoryGroup)
			
			if MapGroupResult ~= nil then
				table.insert(CategoryGroups, MapGroupResult)
			end
		end
	end
	return {
		status = Enabled,
		categoryGroups = CategoryGroups,
		version = if type(Version) == "string" then Version else ""
	}
end