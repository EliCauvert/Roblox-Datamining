function enc(Text: string): string
	return (Text:gsub(".", function(Text: string): string
		local Text1 = ""
		local ByteValue: number = Text:byte()
		
		for i = 8, 1, -1 do
			Text1 ..= if ByteValue % 2 ^ i - ByteValue % 2 ^ (i - 1) > 0 then "1" else "0"
		end
		return Text1
	end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(Text: string): string
		if #Text < 6 then
			return ""
		end
		local Total = 0
		
		for i = 1, 6 do
			Total += Text:sub(i, i) == "1" and 2 ^ (6 - i) or 0
		end
		return ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(Total + 1, Total + 1)
	end) .. ({ "", "==", "=" })[#Text % 3 + 1]
end

function dec(Text: string)
	return (string.gsub(Text, "[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]", ""):gsub(".", function(p1): string
		if p1 == "=" then
			return ""
		end
		local Text = ""
		local StartIndexDelta = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):find(p1) - 1
		
		for i = 6, 1, -1 do
			Text ..= if StartIndexDelta % 2 ^ i - StartIndexDelta % 2 ^ (i - 1) > 0 then "1" else "0"
		end
		return Text
	end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(Text: string): string
		if #Text ~= 8 then
			return ""
		end
		local Total = 0
		
		for i = 1, 8 do
			Total += Text:sub(i, i) == "1" and 2 ^ (7 - i) or 0
		end
		return (string.char(Total))
	end))
end

function safe_enc(Text: string, p2: boolean): string
	if p2 == nil then
		p2 = true
	end
	local Text1 = ""
	local List = {}
	while #Text > 0 do
		table.insert(List, Text:sub(1, 204798))
		Text = Text:sub(204799)
	end
	for i, value in ipairs(List) do
		if p2 then
			print(("[http] Encoding B64 chunk %s/%s"):format(i, #List))
		end
		Text1 ..= enc(value)
		wait()
	end
	return Text1
end

return { encode = safe_enc, decode = dec }