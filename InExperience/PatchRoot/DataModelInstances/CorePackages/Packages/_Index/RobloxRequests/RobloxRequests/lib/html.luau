local function _(p1) --[[ Line: 3 | Named "rine" ]]
	return p1 and (#p1 > 0 and p1)
end

local _ = function(p1) --[[ Line: 6 | Named "rit" ]]
	return type(p1) == "table" and p1
end

local _ = function(): boolean --[[ Line: 10 | Named "dont_crash" ]]
	if math.random() <= 0.004 then
		wait()
	end
	return true
end

local function v3() --[[ Line: 18 ]] end

local _ = function(Text: string): string --[[ Line: 19 ]]
	return string.gsub(Text, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
end

local Callback1 = tostring
local CharFunction = string.char
local t = {}
local Callback = t.silent and v3 or function(Text: string, p1: string, ...) --[[ Line: 26 ]]
	-- upvalues: t (copy)
	print("[HTMLParser]" .. (" [%s] "):format(Text:upper()) .. p1:format(...) .. (t.nonl or "\n"))
end
local Callback3 = t.noerr and v3 or function(p1, ...) --[[ Line: 32 ]]
	-- upvalues: Callback (copy)
	Callback("e", p1, ...)
end

if not t.noout or not v3 then
	local _ = function(p1, ...) --[[ Line: 36 ]]
		-- upvalues: Callback (copy)
		Callback("i", p1, ...)
	end
end
local Callback2 = t.debug and function(Text: string, ...) --[[ Line: 41 ]]
	-- upvalues: Callback (copy), v3 (copy), Callback1 (copy)
	Callback("d", Text:gsub("#LINE#", (Callback1(v3(3)))), ...)
end or v3
local ElementNodeModule = require(script.ElementNode)
local VoidelementsModule = require(script.voidelements)

return {
	parse = function(p1, p2, Page_url) --[[ Line: 53 ]]
		-- upvalues: t (copy), Callback1 (copy), CharFunction (copy), Callback2 (copy), Callback3 (copy), ElementNodeModule (copy), VoidelementsModule (copy)
		local T = (if t then #t > 0 and t else t) or ({} or {})
		T.looplimit = T.looplimit or 100000000
		local CallbackResult = Callback1(p1)
		local P8 = p2 or (T.looplimit or 100000000)
		local Flag = false
		
		if not T.keep_comments then
			CallbackResult = CallbackResult:gsub("<!%-%-.-%-%->", "")
		end
		local t1 = {}
		
		if not T.keep_danger_placeholders then
			local t2 = {}
			local Total = 0
			repeat
				local CharResult: string = CharFunction(Total)
				if CallbackResult:match(CharResult) then
					Callback2("[FindPH]:#LINE# Text contains this byte! || i=%d", Total)
				else
					if t1["<"] and t1[">"] then
						Callback2("[FindPH]:#LINE# Done!", Total)
						break
					end
					if t2[Total] then
						Callback2("[FindPH]:#LINE# Busy! || i=%d", Total)
					else
						if t1["<"] then
							if not t1[">"] then
								t1[">"] = CharResult
							end
						else
							t1["<"] = CharResult
						end
						t2[Total] = true
						Callback2("c:{%s}||cc:{%d}||tpr[c]:{%s}", Callback1(c), CharResult:byte(), (Callback1(t1[c])))
						Callback2("busy[i]:{%s},i:{%d}", Callback1(t2[Total]), Total)
						Callback2("[FindPH]:#LINE# Success! || i=%d", Total)
					end
					Callback2("c:{%s}||cc:{%d}||tpr[c]:{%s}", c, CharResult:byte(), (Callback1(t1[c])))
					Callback2("%s", (Callback1(t2[Total])))
				end
				Total += if Total == 31 then 96 else 1
			until Total == 255
			if t1["<"] and t1[">"] then
				Callback2("[FindPH]:#LINE# Found! || '<'=%d, '>'=%d", t1["<"]:byte(), t1[">"]:byte())
			else
				Callback3("Impossible to find at least two unused byte codes in this HTML-code. We need it to escape bracket-contained placeholders inside tags.")
				Callback3("Consider enabling 'keep_danger_placeholders' option (to silence this error, if parser wasn't failed with current HTML-code) or manually replace few random bytes, to free up the codes.")
			end
			local function g(Key, ...): string --[[ Line: 124 ]]
				-- upvalues: t1 (copy), Flag (ref), Callback2 (upval), Callback1 (upval)
				local List = { ... }
				local Entry = List[Key]
				List[Key] = List[Key]:gsub("(.)", t1)
				
				if List[Key] ~= Entry then
					Flag = true
					Callback2("[g]:#LINE# orig: %s", (Callback1(Entry)))
					Callback2("[g]:#LINE# replaced: %s", (Callback1(List[Key])))
				end
				Callback2("[g]:#LINE# called, id: %s, arg[id]: %s, args { " .. ("{%s}, "):rep(#List):gsub(", $", "") .. " }", Key, List[Key], ...)
				Callback2("[g]:#LINE# concat(arg): %s", table.concat(List))
				
				return table.concat(List)
			end
			
			CallbackResult = CallbackResult:gsub("(=[%s]-)(%b'')", function(...) --[[ Line: 144 ]]
				-- upvalues: g (copy)
				return g(2, ...)
			end):gsub("(=[%s]-)(%b\"\")", function(...) --[[ Line: 146 ]]
				-- upvalues: g (copy)
				return g(2, ...)
			end):gsub("(<" .. (T.tpl_skip_pattern or "[^!]") .. ")([^>]+)" .. "(>)", function(...) --[[ Line: 150 ]]
				-- upvalues: g (copy)
				return g(2, ...)
			end):gsub("(" .. (t1["<"] or "__FAILED__") .. ")(" .. (T.tpl_marker_pattern or "[^%w%s]") .. ")([%g%s]-)" .. "(%2)(>)" .. "([^>]*>)", function(...) --[[ Line: 156 ]]
				-- upvalues: g (copy)
				return g(5, ...)
			end)
		end
		local Count = 0
		local NewResult = ElementNodeModule:new(Count, (Callback1(CallbackResult)))
		NewResult.page_url = Page_url
		local Parent = NewResult
		local Flag1 = true
		local v1 = 1
		local t3 = {}
		while true do
			if math.random() <= 0.004 then
				wait()
			end
			if Count == P8 then
				Callback3("Main loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", P8)
				break
			end
			local StartIndex, W3
			StartIndex, v1, W3 = NewResult._text:find("<([%w-]+)[^>]*>", v1)
			Callback2("[MainLoop]:#LINE# openstart=%s || tpos=%s || name=%s", Callback1(StartIndex), Callback1(v1), (Callback1(W3)))
			
			if not W3 then break end
			Count += 1
			local NewResult1 = ElementNodeModule:new(Count, Callback1(W3), Parent or {}, Flag1, StartIndex, v1)
			NewResult1.page_url = Page_url
			Parent = NewResult1
			local Count1: number? = nil
			local Text: string = NewResult1:gettext()
			local v2 = 1
			while true do
				if math.random() <= 0.004 then
					wait()
				end
				if Count1 == P8 then
					Callback3("Tag parsing loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", P8)
					break
				end
				local v3 = nil
				local StartIndex1, SS3, _, SS5, SS6, SS7
				StartIndex1, v2, SS3, _, SS5, SS6, SS7 = Text:find("%s+([^%s=/>]+)([%s]-)(=?)([%s]-)(['\"]?)", v2)
				Callback2("[TagLoop]:#LINE# start=%s || apos=%s || k=%s || zsp='%s' || eq='%s', quote=[%s]", Callback1(StartIndex1), Callback1(v2), Callback1(SS3), Callback1(SS6), Callback1(SS5), (Callback1(SS7)))
				
				if not SS3 or SS3 == "/>" or SS3 == ">" then break end
				if SS5 == "=" then
					local S: string = if SS7 == "" then "=([^%s>]*)" else SS7 .. "([^" .. SS7 .. "]*)" .. SS7
					local StartIndex2
					StartIndex2, v2, v30 = Text:find(S, v2)
					Callback2("[TagLoop]:#LINE# start=%s || apos=%s || v=%s || pattern=%s", Callback1(StartIndex2), Callback1(v2), Callback1(v3), (Callback1(S)))
				end
				local V30 = v3 or ""
				
				if Flag then
					for i1, value1 in pairs(t1) do
						V30 = V30:gsub(value1, i1)
						Callback2("[TagLoop]:#LINE# rv=%s || rk=%s", Callback1(value1), (Callback1(i1)))
					end
				end
				Callback2("[TagLoop]:#LINE# k=%s || v=%s", Callback1(SS3), (Callback1(V30)))
				NewResult1:addattribute(SS3, V30)
				Count1 = (Count1 or 0) + 1
			end
			if VoidelementsModule[NewResult1.name:lower()] then
				Flag1 = false
				NewResult1:close()
			else
				t3[NewResult1.name] = t3[NewResult1.name] or {}
				table.insert(t3[NewResult1.name], NewResult1)
			end
			local v4: number = v1
			local Count2: number? = nil
			while true do
				if math.random() <= 0.004 then
					wait()
				end
				if Count2 == P8 then
					Callback3("Tag closing loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", P8)
					break
				end
				local StartIndex3, W3_1, W4
				StartIndex3, v4, W3_1, W4 = NewResult._text:find("[^<]*<(/?)([%w-]+)", v4)
				Callback2("[TagCloseLoop]:#LINE# closestart=%s || closeend=%s || closing=%s || closename=%s", Callback1(StartIndex3), Callback1(v4), Callback1(W3_1), (Callback1(W4)))
				
				if not W3_1 or W3_1 == "" then break end
				NewResult1 = table.remove(t3[W4] or {}) or NewResult1
				local v5 = NewResult._text:find("<", StartIndex3)
				Callback2("[TagCloseLoop]:#LINE# closestart=%s", (Callback1(v5)))
				NewResult1:close(v5, v4 + 1)
				Parent = NewResult1.parent
				Flag1 = true
				Count2 = (Count2 or 0) + 1
			end
		end
		if Flag then
			Callback2("tpl")
			
			for i, value in pairs(t1) do
				NewResult._text = NewResult._text:gsub(value, i)
			end
		end
		return NewResult
	end
}