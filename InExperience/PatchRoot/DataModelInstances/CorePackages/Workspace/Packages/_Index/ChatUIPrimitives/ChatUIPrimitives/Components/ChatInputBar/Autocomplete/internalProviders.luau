local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local emojiListModule = require(parent.EmojiList)
local fFlagExpChatEmojiInputParity = require(parent.SharedFlags).FFlagExpChatEmojiInputParity
local trieModule = require(script.Parent.Trie)

return {
	buildTrie = function(p1, p2)
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
	end,
	matchTrigger = function(p3, p4)
		-- upvalues: fFlagExpChatEmojiInputParity (ref)
		if p4 < 2 then
			return nil
		end
		local var2 = 1
		
		for i = p4 - 1, 1, -1 do
			local substring = string.sub(p3, i, i)
			
			if substring ~= " " and substring ~= "\n" then
				continue
			end
			var2 = i + 1
			break
		end
		local substring_1 = string.sub(p3, var2, var2)
		
		if substring_1 == "/" then
			if var2 == 1 then
			else
				return nil
			end
		elseif substring_1 == ":" then
			return if p4 - var2 < 3 then nil else {
				query = string.sub(p3, var2, p4 - 1),
				replaceStart = var2,
				replaceFinish = p4 - 1
			}
		elseif not fFlagExpChatEmojiInputParity then
			return nil
		end
		local var3 = nil
		
		for i_1 = p4 - 1, var2, -1 do
			if string.sub(p3, i_1, i_1) ~= ":" then
				continue
			end
			var3 = i_1
			break
		end
		if not var3 or p4 - var3 < 3 then
			return nil
		end
		var2 = var3
	end,
	matchColonCompletion = function(p5, p6)
		-- upvalues: fFlagExpChatEmojiInputParity (ref), emojiListModule (ref)
		if not fFlagExpChatEmojiInputParity then
			return nil
		elseif p6 - 1 < 3 then
			return nil
		elseif string.sub(p5, p6 - 1, p6 - 1) ~= ":" then
			return nil
		end
		local matchIndex, _, matchIndex_1 = string.find(string.sub(p5, 1, p6 - 1), ":([^:%s]+):$")
		
		if not matchIndex_1 then
			return nil
		end
		local var4 = emojiListModule[string.lower(matchIndex_1)]
		
		return if var4 then {
			replacement = var4.base,
			replaceStart = matchIndex,
			replaceFinish = p6 - 1
		} else nil
	end,
	search = function(p5, p6)
		-- upvalues: emojiListModule (ref)
		local var4 = p5:autocomplete(p6:lower())
		table.sort(var4, function(p7, p8)
			-- upvalues: emojiListModule (copy)
			if string.sub(p7, 1, 1) ~= ":" or not (string.sub(p8, 1, 1) == ":") then
				return p7 < p8
			end
			local popularity = emojiListModule[string.sub(p7, 2)].popularity
			local popularity_1 = emojiListModule[string.sub(p8, 2)].popularity
			
			return if popularity == popularity_1 then p7 < p8 else popularity < popularity_1
		end)
		
		return var4
	end,
	formatReplacement = function(p5)
		-- upvalues: emojiListModule (ref)
		return if string.sub(p5, 1, 1) == ":" then emojiListModule[string.sub(p5, 2)].base else p5
	end,
	renderEntry = function(p5, _)
		-- upvalues: emojiListModule (ref), reactModule (ref), foundationModule (ref)
		if string.sub(p5, 1, 1) == ":" then
			local substring = string.sub(p5, 2)
			local var4 = emojiListModule[substring]
			
			return reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-large",
				Size = UDim2.fromScale(1, 1)
			}, {
				glyph = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-medium content-emphasis",
					LayoutOrder = 1,
					Text = if var4 then var4.base else ""
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
			Text = p5,
			Size = UDim2.fromScale(1, 1)
		})
	end
}