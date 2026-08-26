local _ = require(script:FindFirstAncestor("Markdown").Types)
local insert = table.insert

return function(p1)
	-- upvalues: insert (ref)
	local var1, var2, var3, var4, var5
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
				"^%s*[0-9]+%.[ \t]+",
				"^(%s*)([0-9]+)%.[ \t]+"
			},
			{
				"ORDERED_LIST_ITEM",
				"^%s*[A-Za-z]%.[ \t]+",
				"^(%s*)([A-Za-z])%.[ \t]+"
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
	local var6 = 0
	local var7 = 0
	local t_1 = {}
	while var6 <= #p1 do
		var1 = if var6 == 0 then "\n" else p1:sub(var6, var6)
		local var8 = t[var1]
		var2 = false
		
		if var8 then
			var3 = if var1 == "\n" then 1 else 0
			var4 = p1:sub(var6 + var3)
			
			for i, v in var8 do
				var5 = var4:match(v[2])
				
				if var5 then
					local var9 = v[1]
					local var10 = v[3]
					local var11 = #var5 - (v[4] or 0)
					
					if var6 ~= var7 then
						insert(t_1, {
							name = "TEXT",
							text = p1:sub(var7, var6 - 1),
							offset = var7
						})
					end
					insert(t_1, {
						name = var9,
						text = var5,
						capture = if var10 then { var4:match(var10) } else nil,
						isBlock = var1 == "\n",
						offset = var6
					})
					var6 += var3 + var11
					var7 = var6
					var2 = true
					break
				end
			end
		end
		if not var2 then
			var6 += 1
		end
	end
	if var6 ~= var7 then
		insert(t_1, {
			name = "TEXT",
			text = p1:sub(var7, var6 - 1),
			offset = var7
		})
	end
	return t_1
end