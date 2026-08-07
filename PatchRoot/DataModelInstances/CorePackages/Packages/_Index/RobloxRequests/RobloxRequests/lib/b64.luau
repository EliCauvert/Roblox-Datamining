-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

function enc(p0) --[[ line: 6 ]]
	return (p0:gsub(".", function(p2) --[[ line: 7 ]]
		local var1 = ""
		local var2 = p2:byte()
		
		for i = 8, 1, -1 do
			var1 ..= if var2 % 2 ^ i - var2 % 2 ^ (i - 1) > 0 then "1" else "0"
		end
		return var1
	end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(p1) --[[ line: 11 ]]
		if #p1 < 6 then
			return ""
		end
		local var0 = 0
		
		for i = 1, 6 do
			var0 += if p1:sub(i, i) == "1" then 2 ^ (6 - i) else 0
		end
		return ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(var0 + 1, var0 + 1)
	end) .. ({ "", "==", "=" })[#p0 % 3 + 1]
end

function dec(p3) --[[ line: 20 ]]
	return string.gsub(p3, "[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]", ""):gsub(".", function(p5) --[[ line: 22 ]]
		if p5 == "=" then
			return ""
		end
		local var4 = ""
		local var5 = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):find(p5) - 1
		
		for i = 6, 1, -1 do
			var4 ..= if var5 % 2 ^ i - var5 % 2 ^ (i - 1) > 0 then "1" else "0"
		end
		return var4
	end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(p4) --[[ line: 27 ]]
		if #p4 ~= 8 then
			return ""
		end
		local var3 = 0
		
		for i = 1, 8 do
			var3 += if p4:sub(i, i) == "1" then 2 ^ (7 - i) else 0
		end
		return string.char(var3)
	end)
end

function safe_enc(p6, p7) --[[ line: 35 ]]
	if p7 == nil then
		p7 = true
	end
	local var6 = ""
	local t = {}
	while #p6 > 0 do
		table.insert(t, p6:sub(1, 204798))
		p6 = p6:sub(204799)
	end
	for i, v in ipairs(t) do
		if p7 then
			print(("[http] Encoding B64 chunk %s/%s"):format(i, #t))
		end
		var6 ..= enc(v)
		wait()
	end
	return var6
end

return { encode = safe_enc, decode = dec }