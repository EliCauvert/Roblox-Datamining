function enc(p1)
	return (p1:gsub(".", function(p2)
		local var1 = ""
		local var2 = p2:byte()
		
		for i = 8, 1, -1 do
			var1 ..= if var2 % 2 ^ i - var2 % 2 ^ (i - 1) > 0 then "1" else "0"
		end
		return var1
	end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(p3)
		if #p3 < 6 then
			return ""
		end
		local var3 = 0
		
		for i = 1, 6 do
			var3 += if p3:sub(i, i) == "1" then 2 ^ (6 - i) else 0
		end
		return ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(var3 + 1, var3 + 1)
	end) .. ({ "", "==", "=" })[#p1 % 3 + 1]
end

function dec(p3)
	return string.gsub(p3, "[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]", ""):gsub(".", function(p4)
		if p4 == "=" then
			return ""
		end
		local var3 = ""
		local var4 = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):find(p4) - 1
		
		for i = 6, 1, -1 do
			var3 ..= if var4 % 2 ^ i - var4 % 2 ^ (i - 1) > 0 then "1" else "0"
		end
		return var3
	end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(p5)
		if #p5 ~= 8 then
			return ""
		end
		local var5 = 0
		
		for i = 1, 8 do
			var5 += if p5:sub(i, i) == "1" then 2 ^ (7 - i) else 0
		end
		return string.char(var5)
	end)
end

function safe_enc(p5, p6)
	if p6 == nil then
		p6 = true
	end
	local var5 = ""
	local t = {}
	while #p5 > 0 do
		table.insert(t, p5:sub(1, 204798))
		p5 = p5:sub(204799)
	end
	for i, v in ipairs(t) do
		if p6 then
			print(("[http] Encoding B64 chunk %s/%s"):format(i, #t))
		end
		var5 ..= enc(v)
		wait()
	end
	return var5
end

return { encode = safe_enc, decode = dec }