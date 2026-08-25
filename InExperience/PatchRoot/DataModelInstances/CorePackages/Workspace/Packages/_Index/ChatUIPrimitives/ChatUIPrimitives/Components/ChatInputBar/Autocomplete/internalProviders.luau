local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local emojiListModule = require(parent.EmojiList)
local fFlagExpChatEmojiInputParity = require(parent.SharedFlags).FFlagExpChatEmojiInputParity
local trieModule = require(script.Parent.Trie)

return {
	buildTrie = function(p0, p1)
		-- upvalues: trieModule (ref), cryoModule (ref), emojiListModule (ref)
		local var5 = trieModule.new()
		
		if p0 then
			for i, v in p0 do
				var5:insert(v:lower())
			end
		end
		if p1 then
			for i, v in cryoModule.Dictionary.keys(emojiListModule) do
				var5:insert(":" .. v)
			end
		end
		return var5
	end,
	matchTrigger = function(p2, p3)
		-- upvalues: fFlagExpChatEmojiInputParity (ref)
		if p3 < 2 then
			return nil
		end
		local var6 = 1
		
		for i = p3 - 1, 1, -1 do
			local substring = string.sub(p2, i, i)
			
			if substring ~= " " and substring ~= "\n" then
				continue
			end
			var6 = i + 1
			break
		end
		local substring_1 = string.sub(p2, var6, var6)
		
		if substring_1 == "/" then
			if var6 == 1 then
			else
				return nil
			end
		elseif substring_1 == ":" then
			return if p3 - var6 < 3 then nil else {
				query = string.sub(p2, var6, p3 - 1),
				replaceStart = var6,
				replaceFinish = p3 - 1
			}
		elseif not fFlagExpChatEmojiInputParity then
			return nil
		end
		local var9 = nil
		
		for i_1 = p3 - 1, var6, -1 do
			if string.sub(p2, i_1, i_1) ~= ":" then
				continue
			end
			var9 = i_1
			break
		end
		if not var9 or p3 - var9 < 3 then
			return nil
		end
		var6 = var9
	end,
	matchColonCompletion = function(p4, p5)
		-- upvalues: fFlagExpChatEmojiInputParity (ref), emojiListModule (ref)
		if not fFlagExpChatEmojiInputParity then
			return nil
		elseif p5 - 1 < 3 then
			return nil
		elseif string.sub(p4, p5 - 1, p5 - 1) ~= ":" then
			return nil
		end
		local matchIndex, _, matchIndex_1 = string.find(string.sub(p4, 1, p5 - 1), ":([^:%s]+):$")
		
		if not matchIndex_1 then
			return nil
		end
		local var12 = emojiListModule[string.lower(matchIndex_1)]
		
		return if var12 then {
			replacement = var12.base,
			replaceStart = matchIndex,
			replaceFinish = p5 - 1
		} else nil
	end,
	search = function(p6, p7)
		-- upvalues: emojiListModule (ref)
		local var13 = p6:autocomplete(p7:lower())
		table.sort(var13, function(p8, p9)
			-- upvalues: emojiListModule (copy)
			if string.sub(p8, 1, 1) ~= ":" or not (string.sub(p9, 1, 1) == ":") then
				return p8 < p9
			end
			local popularity = emojiListModule[string.sub(p8, 2)].popularity
			local popularity_1 = emojiListModule[string.sub(p9, 2)].popularity
			
			return if popularity == popularity_1 then p8 < p9 else popularity < popularity_1
		end)
		
		return var13
	end,
	formatReplacement = function(p10)
		-- upvalues: emojiListModule (ref)
		return if string.sub(p10, 1, 1) == ":" then emojiListModule[string.sub(p10, 2)].base else p10
	end,
	renderEntry = function(p11, _)
		-- upvalues: emojiListModule (ref), reactModule (ref), foundationModule (ref)
		if string.sub(p11, 1, 1) == ":" then
			local substring = string.sub(p11, 2)
			local var15 = emojiListModule[substring]
			
			return reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-large",
				Size = UDim2.fromScale(1, 1)
			}, {
				glyph = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-medium content-emphasis",
					LayoutOrder = 1,
					Text = if var15 then var15.base else ""
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
			Text = p11,
			Size = UDim2.fromScale(1, 1)
		})
	end
}