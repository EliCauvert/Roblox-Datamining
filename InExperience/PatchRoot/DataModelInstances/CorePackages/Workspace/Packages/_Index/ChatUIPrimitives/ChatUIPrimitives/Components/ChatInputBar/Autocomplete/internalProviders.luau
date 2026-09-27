local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local emojiListModule = require(parent.EmojiList)
local fFlagExpChatEmojiInputParity = require(parent.SharedFlags).FFlagExpChatEmojiInputParity
local trieModule = require(script.Parent.Trie)

local function buildUnifiedTrie(p1, p2)
	-- upvalues: trieModule (ref), cryoModule (ref), emojiListModule (ref)
	local var1 = trieModule.new()
	
	if p1 then
		for i, v in p1 do
			var1:insert(v:lower())
		end
	end
	if p2 then
		for i, v in cryoModule.Dictionary.keys(emojiListModule) do
			var1:insert(":" .. v)
		end
	end
	return var1
end

local function buildEmojiArray()
	-- upvalues: cryoModule (ref), emojiListModule (ref)
	local t = {}
	
	for i, v in cryoModule.Dictionary.keys(emojiListModule) do
		table.insert(t, ":" .. v)
	end
	table.sort(t)
	
	return t
end

local function buildCommandTrie(p3)
	-- upvalues: trieModule (ref)
	local var2 = trieModule.new()
	
	for i, v in p3 do
		var2:insert(v:lower())
	end
	return var2
end

local var3 = nil

local function getEmojiStructure()
	-- upvalues: var3 (write), buildEmojiArray (ref)
	if not var3 then
		var3 = buildEmojiArray()
	end
	return var3
end

local function matchTrigger(p4, p5)
	-- upvalues: fFlagExpChatEmojiInputParity (ref)
	if p5 < 2 then
		return nil
	end
	local var4 = 1
	
	for i = p5 - 1, 1, -1 do
		local substring = string.sub(p4, i, i)
		
		if substring ~= " " and substring ~= "\n" then
			continue
		end
		var4 = i + 1
		break
	end
	local substring_1 = string.sub(p4, var4, var4)
	
	if substring_1 == "/" then
		if var4 == 1 then
		else
			return nil
		end
	elseif substring_1 == ":" then
		return if p5 - var4 < 3 then nil else {
			query = string.sub(p4, var4, p5 - 1),
			replaceStart = var4,
			replaceFinish = p5 - 1
		}
	elseif not fFlagExpChatEmojiInputParity then
		return nil
	end
	local var5 = nil
	
	for i_1 = p5 - 1, var4, -1 do
		if string.sub(p4, i_1, i_1) ~= ":" then
			continue
		end
		var5 = i_1
		break
	end
	if not var5 or p5 - var5 < 3 then
		return nil
	end
	var4 = var5
end

local function matchColonCompletion(p6, p7)
	-- upvalues: fFlagExpChatEmojiInputParity (ref), emojiListModule (ref)
	if not fFlagExpChatEmojiInputParity then
		return nil
	elseif p7 - 1 < 3 then
		return nil
	elseif string.sub(p6, p7 - 1, p7 - 1) ~= ":" then
		return nil
	end
	local matchIndex, _, matchIndex_1 = string.find(string.sub(p6, 1, p7 - 1), ":([^:%s]+):$")
	
	if not matchIndex_1 then
		return nil
	end
	local var6 = emojiListModule[string.lower(matchIndex_1)]
	
	return if var6 then {
		replacement = var6.base,
		replaceStart = matchIndex,
		replaceFinish = p7 - 1
	} else nil
end

local function search(p6, p7)
	-- upvalues: emojiListModule (ref)
	local var6 = p6:autocomplete(p7:lower())
	table.sort(var6, function(p8, p9)
		-- upvalues: emojiListModule (copy)
		if string.sub(p8, 1, 1) ~= ":" or not (string.sub(p9, 1, 1) == ":") then
			return p8 < p9
		end
		local popularity = emojiListModule[string.sub(p8, 2)].popularity
		local popularity_1 = emojiListModule[string.sub(p9, 2)].popularity
		
		return if popularity == popularity_1 then p8 < p9 else popularity < popularity_1
	end)
	
	return var6
end

local function searchSortedArray(p6, p7, p8)
	local var6 = p7:lower()
	local var26Count = #var6
	local var7 = 1
	local var8 = #p6 + 1
	while var7 < var8 do
		local var9 = (var7 + var8) // 2
		
		if p6[var9] < var6 then
			var7 = var9 + 1
		else
			var8 = var9
		end
	end
	local t = {}
	
	for i = var7, #p6 do
		local var10 = p6[i]
		
		if string.sub(var10, 1, var26Count) ~= var6 then break end
		table.insert(t, var10)
	end
	if p8 then
		table.sort(t, p8)
	end
	return t
end

local function compareEmojiPopularity(p9, p10)
	-- upvalues: emojiListModule (ref)
	local popularity = emojiListModule[string.sub(p9, 2)].popularity
	local popularity_1 = emojiListModule[string.sub(p10, 2)].popularity
	
	return if popularity == popularity_1 then p9 < p10 else popularity < popularity_1
end

return {
	buildTrie = buildUnifiedTrie,
	buildEmojiArray = buildEmojiArray,
	buildCommandTrie = buildCommandTrie,
	getEmojiStructure = getEmojiStructure,
	matchTrigger = matchTrigger,
	matchColonCompletion = matchColonCompletion,
	search = search,
	searchSortedArray = searchSortedArray,
	searchStructures = function(p9, p10)
		-- upvalues: searchSortedArray (ref), compareEmojiPopularity (ref), emojiListModule (ref)
		if string.sub(p10, 1, 1) == ":" then
			return if p9.emoji then searchSortedArray(p9.emoji, p10, compareEmojiPopularity) else {}
		elseif p9.command then
			local var11 = p9.command:autocomplete(p10:lower())
			table.sort(var11, function(p11, p12)
				-- upvalues: emojiListModule (copy)
				if string.sub(p11, 1, 1) == ":" and string.sub(p12, 1, 1) == ":" then
					local popularity = emojiListModule[string.sub(p11, 2)].popularity
					local popularity_1 = emojiListModule[string.sub(p12, 2)].popularity
					
					return if popularity == popularity_1 then p11 < p12 else popularity < popularity_1
				end
				return p11 < p12
			end)
			
			return var11
		end
		return {}
	end,
	formatReplacement = function(p9)
		-- upvalues: emojiListModule (ref)
		return if string.sub(p9, 1, 1) == ":" then emojiListModule[string.sub(p9, 2)].base else p9
	end,
	renderEntry = function(p9, _)
		-- upvalues: emojiListModule (ref), reactModule (ref), foundationModule (ref)
		if string.sub(p9, 1, 1) == ":" then
			local substring = string.sub(p9, 2)
			local var11 = emojiListModule[substring]
			
			return reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-large",
				Size = UDim2.fromScale(1, 1)
			}, {
				glyph = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-medium content-emphasis",
					LayoutOrder = 1,
					Text = if var11 then var11.base else ""
				}),
				name = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-medium content-emphasis",
					LayoutOrder = 2,
					Text = substring
				})
			})
		end
		return reactModule.createElement(foundationModule.Text, {
			tag = "text-body-medium text-align-x-left content-emphasis",
			Text = p9,
			Size = UDim2.fromScale(1, 1)
		})
	end
}