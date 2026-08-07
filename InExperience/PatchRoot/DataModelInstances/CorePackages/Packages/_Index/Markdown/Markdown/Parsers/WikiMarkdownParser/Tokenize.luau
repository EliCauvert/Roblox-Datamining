local _ = require(script:FindFirstAncestor("Markdown").Types)
local insert = table.insert

return function(p0) --[[ line: 11 | named "tokenize" ]]
	-- upvalues: insert (ref)
	local var4, var6, var7, var8, var9
	local t = {
		["\n"] = {
			{ "LINE_BREAK", "^\n", "^\n", 1 },
			{ "HEADING", "^[#]+", "^([#]+)" },
			{ "DIVIDER", "^[-]+[ \t]*\n", "^([-]+)[ \t]*\n", 1 },
			{ "DIVIDER", "^[=]+[ \t]*\n", "^([=]+)[ \t]*\n", 1 },
			{ "BULLET_LIST_ITEM", "^%s*%*", "^(%s*)(%*)" },
			{ "BULLET_LIST_ITEM_2", "^%s*-", "^(%s*)(-)" },
			{ "CODE_BLOCK", "^```[%w]*\n.-```", "^```([%w]*)\n(.-)```" },
			{ "CODE_BLOCK", "^```[%w]*\n.+$", "^```([%w]*)\n(.+)$" },
			{ "QUOTE", "^%s*>" },
			{
				"ORDERED_LIST_ITEM",
				"^%s*[0-9A-Za-z]+%.",
				"^(%s*)([0-9A-Za-z]+)%."
			},
			{ "TABLE_ROW", "^|" }
		},
		["\\"] = { { "ESCAPE", "^\\.", "^\\(.)" } },
		["-"] = { { "TABLE_HEADER", "^[-]+" } },
		["="] = { { "TABLE_HEADER_2", "^[=]+" } },
		["!"] = {
			{
				"IMAGE",
				"^!%[[^%]]+%]%([^%)]+%)",
				"^!%[([^%]]+)%]%(([^%)]+)%)"
			}
		},
		["|"] = { { "TABLE_DIVIDER", "^|" } },
		["<"] = {
			{ "OPEN_CLOSE", "^<[^>]*/>", "^<([%w-]+)%s?([^>]*)/>" },
			{ "CLOSE", "^</[^>]*>", "^</([%w-]+)%s?([^>]*)>" },
			{ "OPEN", "^<[^>]*>", "^<([%w-]+)%s?([^>]*)>" }
		},
		["*"] = { { "BOLD_2", "^%*%*" }, { "BOLD", "^%*" } },
		_ = { { "ITALIC_2", "^__" }, { "ITALIC", "^_" } },
		["~"] = { { "STRIKE", "^~" } },
		["["] = {
			{
				"LINK",
				"^%[[^%]]+%]%([^%)]+%)",
				"^%[([^%]]+)%]%(([^%)]+)%)"
			},
			{ "ACTION", "^%[%[[^%]]+%]%]", "^%[%[([^%]]+)%]%]" }
		},
		["`"] = {
			{ "INLINE_CODE", "^`[^\n`]*`", "^`([^\n`]*)`" },
			{ "INLINE_CODE", "^`[^\n`]+$", "^`([^\n`]+)$" }
		}
	}
	local var1 = 0
	local var2 = 0
	local t_1 = {}
	while var1 <= #p0 do
		var4 = if var1 == 0 then "\n" else p0:sub(var1, var1)
		local var5 = t[var4]
		var6 = false
		
		if var5 then
			var7 = if var4 == "\n" then 1 else 0
			var8 = p0:sub(var1 + var7)
			
			for i, v in var5 do
				var9 = var8:match(v[2])
				
				if var9 then
					local var10 = v[1]
					local var11 = v[3]
					local var12 = #var9 - (v[4] or 0)
					
					if var1 ~= var2 then
						insert(t_1, {
							name = "TEXT",
							text = p0:sub(var2, var1 - 1),
							offset = var2
						})
					end
					insert(t_1, {
						name = var10,
						text = var9,
						capture = if var11 then { var8:match(var11) } else nil,
						isBlock = var4 == "\n",
						offset = var1
					})
					var1 += var7 + var12
					var2 = var1
					var6 = true
					break
				end
			end
		end
		if not var6 then
			var1 += 1
		end
	end
	if var1 ~= var2 then
		insert(t_1, {
			name = "TEXT",
			text = p0:sub(var2, var1 - 1),
			offset = var2
		})
	end
	return t_1
end