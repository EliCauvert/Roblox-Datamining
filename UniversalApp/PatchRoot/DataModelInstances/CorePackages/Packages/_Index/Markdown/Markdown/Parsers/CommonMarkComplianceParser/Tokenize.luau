local _ = require(script:FindFirstAncestor("Markdown").Types)
local constantsModule = require(script.Parent.Parent.Constants)
local postProcessTokensModule = require(script.Parent.PostProcessTokens)
local utilsModule = require(script.Parent.Utils)
local insert = table.insert
local list = { { "BREAK", "^\\\n" }, { "ESCAPE", "^\\(%p)" } }
local list_1 = { { "IMAGE", "^!%[([^%]]+)%]%(([^%)]+)%)" } }
local list_2 = {
	{ "OPEN_CLOSE", "^<([%w-]+)%s?([^>]*)/>" },
	{ "CLOSE", "^</([%w-]+)%s?([^>]*)>" },
	{ "OPEN", "^<([%w-]+)%s?([^>]*)>" }
}
local list_3 = { { "BOLD_2", "^%*%*" }, { "BOLD", "^%*" } }
local list_4 = { { "ITALIC_2", "^__" }, { "ITALIC", "^_" } }
local list_5 = { { "STRIKE", "^~" } }
local list_6 = { { "INLINE_CODE", "^`" } }
local t = {
	["\\"] = list,
	["!"] = list_1,
	["<"] = list_2,
	["*"] = list_3,
	_ = list_4,
	["~"] = list_5,
	["`"] = list_6
}
local t_1 = {
	["\n"] = {
		{ "LINE_BREAK", "^\n", 1 },
		{ "HEADING", "^ ? ? ?(##?#?#?#?#?)[ \t]+", 1 },
		{ "HEADING", "^ ? ? ?(##?#?#?#?#?)\n", 1 },
		{
			"DIVIDER",
			"^ ? ? ?%-[ \t]*%-[ \t]*%-[ \t]*[%- \t]*\n",
			1
		},
		{
			"DIVIDER",
			"^ ? ? ?%*[ \t]*%*[ \t]*%*[ \t]*[%* \t]*\n",
			1
		},
		{ "DIVIDER", "^ ? ? ?_[ \t]*_[ \t]*_[ \t]*[_ \t]*\n", 1 },
		{ "BULLET_LIST_ITEM", "^(%s*)(%* )" },
		{ "BULLET_LIST_ITEM_2", "^(%s*)(- )" },
		{ "CODE_BLOCK", "^```[ \t]*([^\n]*)[ \t]*\n(.-)```" },
		{ "CODE_BLOCK", "^```[ \t]*([^\n]*)[ \t]*\n(.+)$" },
		{ "CODE_BLOCK", "^~~~[ \t]*([^\n]*)[ \t]*\n(.-)~~~" },
		{ "CODE_BLOCK", "^~~~[ \t]*([^\n]*)[ \t]*\n(.+)$" },
		{ "QUOTE", "^%s*>" },
		{ "ORDERED_LIST_ITEM", "^(%s*)([0-9]+)%.[ \t]+" },
		{ "ORDERED_LIST_ITEM", "^(%s*)([A-Za-z])%.[ \t]+" },
		{ "TABLE_ROW", "^|" }
	},
	["\\"] = list,
	["-"] = { { "TABLE_HEADER", "^[-]+" } },
	["="] = { { "TABLE_HEADER_2", "^[=]+" } },
	["!"] = list_1,
	["|"] = { { "TABLE_DIVIDER", "^|" } },
	["<"] = list_2,
	["*"] = list_3,
	_ = list_4,
	["~"] = list_5,
	["["] = {
		{
			"LINK",
			"^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]\"([^\n]+)\"[ \t]*%)"
		},
		{
			"LINK",
			"^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]'([^\n]+)'[ \t]*%)"
		},
		{
			"LINK",
			"^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]%(([^\n]+)%)[ \t]*%)"
		},
		{ "LINK", "^%[([^%]]*)%]%([ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*<>[ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*<([^\n\t]+)>[ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]*%)" },
		{ "ACTION", "^%[%[([^%]]+)%]%]" }
	},
	["`"] = list_6
}
local t_2 = {
	LINK = {
		startToken = "LINK_START",
		endToken = "LINK_END",
		textStartOffset = 1,
		mapToText = function(p1)
			return if p1.capture then p1.capture[1] else ""
		end
	}
}
local list_7 = { { "HEADING", "^  ? ?(#+)%s*\n", 1 } }

local function tokenizeTextSpan(p1, p2, p3, p4)
	-- upvalues: t (ref), t_1 (ref), list_7 (ref), utilsModule (ref), constantsModule (ref), insert (ref), postProcessTokensModule (ref)
	local var1, var2, var3, substring, var4, var5, characterContext, matchIndex_2
	local var6 = 0
	local var7 = 0
	local var8 = 0
	local t_2 = {}
	while var6 <= #p1 do
		var1 = if var6 == 0 and not p3 then "\n" else string.sub(p1, var6, var6)
		local var9 = if p3 then t[var1] or {} else t_1[var1] or list_7
		var2 = false
		var3 = 0
		
		if var1 == "\n" and not p3 then
			var3 = 1
			var8 = var6
		end
		for i, v in var9 do
			local var10 = v[2]
			local matchIndex, matchIndex_1 = string.find(p1, var10, var6 + var3)
			
			if matchIndex and matchIndex_1 then
				substring = string.sub(p1, matchIndex, matchIndex_1)
				var4 = v[1]
				var5 = #substring - (v[3] or 0)
				characterContext = nil
				
				if not p3 then
					matchIndex_2, matchIndex_3 = string.find(substring, "\n[^\n]*$")
					
					if matchIndex_3 then
						var8 = matchIndex_3 + matchIndex
					end
				end
				if var4 ~= "ESCAPE" or not utilsModule.isInsideInlineCode(t_2, var8) then
					if constantsModule.STYLED_TEXT[var4] then
						characterContext = utilsModule.getCharacterContext(p1, var6, var3 + var5)
					end
					matchIndex_2 = { string.match(p1, var10, var6 + var3) }
					
					if not p3 or var1 ~= "<" or (#matchIndex_2 <= 0 or p4.inlineTags[matchIndex_2[1]]) then
						if var6 ~= var7 then
							insert(t_2, {
								name = "TEXT",
								text = string.sub(p1, var7, var6 - 1),
								offset = var7 + p2
							})
						end
						insert(t_2, {
							name = var4,
							text = substring,
							capture = if #matchIndex_2 > 0 then matchIndex_2 else nil,
							isBlock = not p3 and var1 == "\n",
							offset = var6 + p2,
							context = characterContext
						})
						var6 += var3 + var5
						var7 = var6
						var2 = true
						break
					end
				end
			end
		end
		if not var2 then
			var6 += 1
		end
	end
	if var6 ~= var7 then
		insert(t_2, {
			name = "TEXT",
			text = string.sub(p1, var7, var6 - 1),
			offset = var7 + p2
		})
	end
	return postProcessTokensModule(t_2)
end

return function(p5, p6)
	-- upvalues: tokenizeTextSpan (ref), t_2 (ref), insert (ref)
	local t = {}
	
	for i, v in tokenizeTextSpan(p5, 0, false, p6) do
		local name = t_2[v.name]
		
		if name then
			local list = {
				{
					name = name.startToken,
					offset = v.offset,
					text = string.sub(p5, v.offset, v.offset + name.textStartOffset - 1),
					capture = v.capture
				}
			}
			local var11 = name.mapToText(v)
			local var12 = tokenizeTextSpan(var11, v.offset + name.textStartOffset, true, p6)
			table.move(var12, 1, #var12, 2, list)
			local var13 = v.offset + name.textStartOffset + #var11
			insert(list, {
				name = name.endToken,
				offset = var13,
				text = string.sub(p5, var13, v.offset + #v.text - 1)
			})
			table.move(list, 1, #list, #t + 1, t)
		else
			insert(t, v)
		end
	end
	return t
end