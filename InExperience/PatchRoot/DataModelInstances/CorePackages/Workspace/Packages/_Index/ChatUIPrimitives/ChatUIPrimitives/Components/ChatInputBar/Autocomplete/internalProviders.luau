local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CryoModule = require(Parent.Cryo)
local EmojiListModule = require(Parent.EmojiList)
local TrieModule = require(script.Parent.Trie)

local function buildEmojiArray()
	-- upvalues: CryoModule (copy), EmojiListModule (copy)
	local List = {}
	
	for _, value in CryoModule.Dictionary.keys(EmojiListModule) do
		table.insert(List, ":" .. value)
	end
	table.sort(List)
	
	return List
end

local v1 = nil

local function searchSortedArray(Emoji, Text1: string, CompareEmojiPopularity)
	local Lowered = Text1:lower()
	local CountLowered = #Lowered
	local v2 = 1
	local v3 = #Emoji + 1
	while v2 < v3 do
		local v4 = (v2 + v3) // 2
		
		if Emoji[v4] < Lowered then
			v2 = v4 + 1
		else
			v3 = v4
		end
	end
	local List = {}
	
	for i = v2, #Emoji do
		local Text: string = Emoji[i]
		
		if string.sub(Text, 1, CountLowered) ~= Lowered then break end
		table.insert(List, Text)
	end
	if CompareEmojiPopularity then
		table.sort(List, CompareEmojiPopularity)
	end
	return List
end

local function compareEmojiPopularity(Text: string, Text1: string): boolean
	-- upvalues: EmojiListModule (copy)
	local Popularity = EmojiListModule[string.sub(Text, 2)].popularity
	local Popularity1 = EmojiListModule[string.sub(Text1, 2)].popularity
	
	return if Popularity == Popularity1 then Text < Text1 else Popularity < Popularity1
end

return {
	buildTrie = function(List, p1)
		-- upvalues: TrieModule (copy), CryoModule (copy), EmojiListModule (copy)
		local NewTrie = TrieModule.new()
		
		if List then
			for _, Text in List do
				NewTrie:insert(Text:lower())
			end
		end
		if p1 then
			for _, value in CryoModule.Dictionary.keys(EmojiListModule) do
				NewTrie:insert(":" .. value)
			end
		end
		return NewTrie
	end,
	buildEmojiArray = buildEmojiArray,
	buildCommandTrie = function(List)
		-- upvalues: TrieModule (copy)
		local NewTrie = TrieModule.new()
		
		for _, Text in List do
			NewTrie:insert(Text:lower())
		end
		return NewTrie
	end,
	getEmojiStructure = function()
		-- upvalues: v1 (ref), buildEmojiArray (copy)
		if not v1 then
			v1 = buildEmojiArray()
		end
		return v1
	end,
	matchTrigger = function(Text: string, p2: number)
		if p2 < 2 then
			return nil
		end
		local StartIndex = 1
		
		for i = p2 - 1, 1, -1 do
			local Segment = string.sub(Text, i, i)
			
			if Segment ~= " " and Segment ~= "\n" then
				continue
			end
			StartIndex = i + 1
			break
		end
		local Segment = string.sub(Text, StartIndex, StartIndex)
		
		if Segment ~= "/" then
			if Segment ~= ":" then
				local v5: number? = nil
				
				for i1 = p2 - 1, StartIndex, -1 do
					if string.sub(Text, i1, i1) ~= ":" then
						continue
					end
					v5 = i1
					break
				end
				if not v5 or p2 - v5 < 3 then
					return nil
				end
				StartIndex = v5
			elseif p2 - StartIndex < 3 then
				return nil
			end
		elseif StartIndex ~= 1 then
			return nil
		end
		return {
			query = string.sub(Text, StartIndex, p2 - 1),
			replaceStart = StartIndex,
			replaceFinish = p2 - 1
		}
	end,
	matchColonCompletion = function(Text: string, p3: number)
		-- upvalues: EmojiListModule (copy)
		if p3 - 1 < 3 then
			return nil
		elseif string.sub(Text, p3 - 1, p3 - 1) ~= ":" then
			return nil
		else
			local StartIndex, _, FoundAt3 = string.find(string.sub(Text, 1, p3 - 1), ":([^:%s]+):$")
			
			if FoundAt3 then
				local EmojiListModuleEntry = EmojiListModule[string.lower(FoundAt3)]
				
				return if EmojiListModuleEntry then {
					replacement = EmojiListModuleEntry.base,
					replaceStart = StartIndex,
					replaceFinish = p3 - 1
				} else nil
			else
				return nil
			end
		end
	end,
	search = function(p3, Text: string)
		-- upvalues: EmojiListModule (copy)
		local AutocompleteResult = p3:autocomplete(Text:lower())
		table.sort(AutocompleteResult, function(Text1: string, Text: string): boolean
			-- upvalues: EmojiListModule (upval)
			local IsSegmentMatch = string.sub(Text, 1, 1) == ":"
			
			if string.sub(Text1, 1, 1) == ":" and IsSegmentMatch then
				local Popularity = EmojiListModule[string.sub(Text1, 2)].popularity
				local Popularity1 = EmojiListModule[string.sub(Text, 2)].popularity
				
				return if Popularity == Popularity1 then Text1 < Text else Popularity < Popularity1
			else
				return Text1 < Text
			end
		end)
		
		return AutocompleteResult
	end,
	searchSortedArray = searchSortedArray,
	searchStructures = function(p3, Text: string)
		-- upvalues: searchSortedArray (copy), compareEmojiPopularity (copy), EmojiListModule (copy)
		if string.sub(Text, 1, 1) == ":" then
			return if p3.emoji then searchSortedArray(p3.emoji, Text, compareEmojiPopularity) else {}
		elseif p3.command then
			local AutocompleteResult = p3.command:autocomplete(Text:lower())
			table.sort(AutocompleteResult, function(Text1: string, Text: string): boolean
				-- upvalues: EmojiListModule (upval)
				local IsSegmentMatch = string.sub(Text, 1, 1) == ":"
				
				if string.sub(Text1, 1, 1) == ":" and IsSegmentMatch then
					local Popularity = EmojiListModule[string.sub(Text1, 2)].popularity
					local Popularity1 = EmojiListModule[string.sub(Text, 2)].popularity
					
					return if Popularity == Popularity1 then Text1 < Text else Popularity < Popularity1
				else
					return Text1 < Text
				end
			end)
			
			return AutocompleteResult
		else
			return {}
		end
	end,
	formatReplacement = function(Text: string)
		-- upvalues: EmojiListModule (copy)
		return if string.sub(Text, 1, 1) == ":" then EmojiListModule[string.sub(Text, 2)].base else Text
	end,
	renderEntry = function(Text: string, _)
		-- upvalues: EmojiListModule (copy), ReactModule (copy), FoundationModule (copy)
		if string.sub(Text, 1, 1) == ":" then
			local Segment = string.sub(Text, 2)
			local EmojiListModuleEntry = EmojiListModule[Segment]
			
			return ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center gap-large",
				Size = UDim2.fromScale(1, 1)
			}, {
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
		else
			return ReactModule.createElement(FoundationModule.Text, {
				tag = "text-body-medium text-align-x-left content-emphasis",
				Text = Text,
				Size = UDim2.fromScale(1, 1)
			})
		end
	end
}