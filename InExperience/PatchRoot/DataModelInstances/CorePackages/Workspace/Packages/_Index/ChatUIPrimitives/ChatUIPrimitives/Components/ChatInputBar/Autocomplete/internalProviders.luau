local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local emojiListModule = require(parent.EmojiList)
local trieModule = require(script.Parent.Trie)

return {
	buildTrie = function(p0, p1) --[[ line: 20 ]]
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
	matchTrigger = function(p2, p3) --[[ line: 41 ]]
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
		else
			return if substring_1 == ":" then if p3 - var6 < 3 then nil else {
				query = string.sub(p2, var6, p3 - 1),
				replaceStart = var6,
				replaceFinish = p3 - 1
			} else nil
		end
	end,
	search = function(p4, p5) --[[ line: 75 ]]
		-- upvalues: emojiListModule (ref)
		local var9 = p4:autocomplete(p5:lower())
		table.sort(var9, function(p6, p7) --[[ line: 77 ]]
			-- upvalues: emojiListModule (copy)
			if string.sub(p6, 1, 1) ~= ":" or not (string.sub(p7, 1, 1) == ":") then
				return p6 < p7
			end
			local popularity = emojiListModule[string.sub(p6, 2)].popularity
			local popularity_1 = emojiListModule[string.sub(p7, 2)].popularity
			
			return if popularity == popularity_1 then p6 < p7 else popularity < popularity_1
		end)
		
		return var9
	end,
	formatReplacement = function(p8) --[[ line: 94 ]]
		-- upvalues: emojiListModule (ref)
		return if string.sub(p8, 1, 1) == ":" then emojiListModule[string.sub(p8, 2)].base else p8
	end,
	renderEntry = function(p9, _) --[[ line: 101 ]]
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