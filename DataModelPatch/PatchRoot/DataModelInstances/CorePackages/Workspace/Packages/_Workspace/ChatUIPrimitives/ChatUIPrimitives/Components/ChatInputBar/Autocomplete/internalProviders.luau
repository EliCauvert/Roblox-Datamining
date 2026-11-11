local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CryoModule = require(Parent.Cryo)
local EmojiListModule = require(Parent.EmojiList)
local TrieModule = require(script.Parent.Trie)

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
		
		if Segment == "/" then
			if StartIndex ~= 1 then
				return nil
			end
		elseif Segment ~= ":" then
			return nil
		elseif p2 - StartIndex < 3 then
			return nil
		end
		return {
			query = string.sub(Text, StartIndex, p2 - 1),
			replaceStart = StartIndex,
			replaceFinish = p2 - 1
		}
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