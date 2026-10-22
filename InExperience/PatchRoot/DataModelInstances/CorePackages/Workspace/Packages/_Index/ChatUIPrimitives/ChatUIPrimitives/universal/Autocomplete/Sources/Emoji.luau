local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local EmojiListModule = require(Parent.EmojiList)
local _ = require(script.Parent.Parent.AutocompleteTypes)
local InternalProvidersModule = require(ChatUIPrimitives.Components.ChatInputBar.Autocomplete.internalProviders)
local Utf8RangeModule = require(script.Parent.Parent.utf8Range)

local function _(p1): boolean
	return p1 == " " or p1 == "\n"
end

local function matchEmojiTrigger(Text, p1: number)
	-- upvalues: Utf8RangeModule (copy)
	local Length = utf8.len(Text)
	
	if Length == nil or p1 < 2 or Length + 1 < p1 then
		return nil
	end
	local v1 = 1
	
	for i = p1 - 1, 1, -1 do
		local CharAtResult = Utf8RangeModule.charAt(Text, i)
		
		if CharAtResult == nil then
			return nil
		elseif CharAtResult ~= " " and CharAtResult ~= "\n" then
			continue
		else
			v1 = i + 1
			break
		end
	end
	local function _(ReplaceStart: number)
		-- upvalues: p1 (copy), Utf8RangeModule (upval), Text (copy)
		if p1 - ReplaceStart < 3 then
			return nil
		else
			local SliceResult = Utf8RangeModule.slice(Text, ReplaceStart, p1 - 1)
			
			return if SliceResult == nil then nil else {
				query = SliceResult,
				replaceStart = ReplaceStart,
				replaceFinish = p1 - 1
			}
		end
	end
	
	local CharAtResult1 = Utf8RangeModule.charAt(Text, v1)
	
	if CharAtResult1 == nil then
		return nil
	end
	if CharAtResult1 == ":" then
		local ReplaceStart: number = v1
		
		if p1 - ReplaceStart < 3 then
			return nil
		else
			local SliceResult = Utf8RangeModule.slice(Text, ReplaceStart, p1 - 1)
			
			return if SliceResult == nil then nil else {
				query = SliceResult,
				replaceStart = ReplaceStart,
				replaceFinish = p1 - 1
			}
		end
	else
		local v2: number? = nil
		
		for i1 = p1 - 1, v1, -1 do
			if Utf8RangeModule.charAt(Text, i1) ~= ":" then
				continue
			end
			v2 = i1
			break
		end
		if v2 == nil then
			return nil
		end
		local ReplaceStart: number = v2
		
		if p1 - ReplaceStart < 3 then
			return nil
		else
			local SliceResult = Utf8RangeModule.slice(Text, ReplaceStart, p1 - 1)
			
			return if SliceResult == nil then nil else {
				query = SliceResult,
				replaceStart = ReplaceStart,
				replaceFinish = p1 - 1
			}
		end
	end
end

local function matchEmojiCompletion(Text, p2: number)
	-- upvalues: Utf8RangeModule (copy), EmojiListModule (copy)
	local Length = utf8.len(Text)
	
	if Length == nil or p2 - 1 < 3 or Length < p2 - 1 then
		return nil
	elseif Utf8RangeModule.charAt(Text, p2 - 1) ~= ":" then
		return nil
	else
		local SliceResult: string = Utf8RangeModule.slice(Text, 1, p2 - 1)
		
		if SliceResult == nil then
			return nil
		end
		local StartIndex, _, FoundAt3 = string.find(SliceResult, ":([^:%s]+):$")
		
		if FoundAt3 == nil or StartIndex == nil then
			return nil
		end
		local EmojiListModuleEntry = EmojiListModule[string.lower(FoundAt3)]
		
		if EmojiListModuleEntry == nil then
			return nil
		else
			local Length1 = utf8.len((string.sub(SliceResult, 1, StartIndex - 1)))
			
			return if Length1 == nil then nil else {
				replacement = EmojiListModuleEntry.base,
				replaceStart = Length1 + 1,
				replaceFinish = p2 - 1
			}
		end
	end
end

local function compareEmojiPopularity(Text: string, Text1: string): boolean
	-- upvalues: EmojiListModule (copy)
	local Popularity = EmojiListModule[string.sub(Text, 2)].popularity
	local Popularity1 = EmojiListModule[string.sub(Text1, 2)].popularity
	
	return if Popularity == Popularity1 then Text < Text1 else Popularity < Popularity1
end

local function searchEmojis(p2)
	-- upvalues: InternalProvidersModule (copy), compareEmojiPopularity (copy)
	return InternalProvidersModule.searchSortedArray(InternalProvidersModule.getEmojiStructure(), p2, compareEmojiPopularity)
end

local function selectEmoji(Text: string)
	-- upvalues: EmojiListModule (copy)
	local EmojiListModuleEntry = EmojiListModule[string.sub(Text, 2)]
	
	return {
		kind = "insert",
		text = if EmojiListModuleEntry == nil then Text else EmojiListModuleEntry.base
	}
end

local function renderEmojiEntry(Text: string, _)
	-- upvalues: EmojiListModule (copy), ReactModule (copy), FoundationModule (copy)
	local Segment = string.sub(Text, 2)
	local EmojiListModuleEntry = EmojiListModule[Segment]
	
	return ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center gap-large size-full" }, {
		glyph = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-body-medium content-emphasis",
			LayoutOrder = 1,
			Text = if EmojiListModuleEntry then EmojiListModuleEntry.base else ""
		}),
		name = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-body-medium content-emphasis",
			LayoutOrder = 2,
			Text = Segment
		})
	})
end

return function(p2)
	-- upvalues: matchEmojiTrigger (copy), searchEmojis (copy), selectEmoji (copy), renderEmojiEntry (copy), matchEmojiCompletion (copy)
	assert(type(p2.id) == "string" and p2.id ~= "", "AutocompleteSources.emoji requires an id")
	
	return {
		id = p2.id,
		matchTrigger = matchEmojiTrigger,
		search = searchEmojis,
		select = selectEmoji,
		renderEntry = renderEmojiEntry,
		matchCompletion = matchEmojiCompletion
	}
end