local LanguageModule = require(script.Language)
local Keyword = LanguageModule.keyword
local Builtin = LanguageModule.builtin
local Libraries = LanguageModule.libraries
local LexerModule = { language = LanguageModule }
local Patterns = {}
local t = {}

for i, value in {
	{ "^[%c%s]*[%a_][%w_]*[%c%s]*", "var" },
	{ "^[%c%s]*0[xX][%da-fA-F_]+[%c%s]*", "number" },
	{ "^[%c%s]*0[bB][01_]+[%c%s]*", "number" },
	{ "^[%c%s]*%d+%.?%d*[eE][%+%-]?%d+[%c%s]*", "number" },
	{ "^[%c%s]*%d+[%._]?[%d_eE]*[%c%s]*", "number" },
	{ "^[%c%s]*(['\"])%1[%c%s]*", "string" },
	{ "^[%c%s]*(['\"])[^\n]-([^\\]%1)[%c%s]*", "string" },
	{ "^[%c%s]*(['\"]).-\n[%c%s]*", "string" },
	{ "^[%c%s]*(['\"])[^\n]*[%c%s]*", "string" },
	{ "^[%c%s]*%[(=*)%[.-%]%1%][%c%s]*", "string" },
	{ "^[%c%s]*%[=*%[.-.*[%c%s]*", "string" },
	{ "^[%c%s]*`[^\n]-`[%c%s]*", "string_inter" },
	{ "^[%c%s]*%-%-%[(=*)%[.-%]%1%][%c%s]*", "comment" },
	{ "^[%c%s]*%-%-%[=*%[.-.*[%c%s]*", "comment" },
	{ "^[%c%s]*%-%-.-\n[%c%s]*", "comment" },
	{ "^[%c%s]*%-%-.*[%c%s]*", "comment" },
	{
		"^[%c%s]*[:;<>/~%*%(%)%-={},%.#%^%+%%]+[%c%s]*",
		"operator"
	},
	{ "^[%c%s]*[%[%]]+[%c%s]*", "operator" },
	{
		"^[%c%s]*[%z\1-\127\194-\244][\128-\191]+[%c%s]*",
		"iden"
	},
	{ "^.", "iden" }
} do
	Patterns[i] = value[1]
	t[i] = value[2]
end
function LexerModule.scan(Text) --[[ Line: 105 ]]
	-- upvalues: Patterns (copy), t (copy), Keyword (copy), Builtin (copy), Libraries (copy), LexerModule (copy)
	local Init = 1
	local CountText = #Text
	local Text1 = ""
	local Text2 = ""
	local Text3 = ""
	local v1 = ""
	local Thread = coroutine.create(function() --[[ Line: 110 ]]
		-- upvalues: Init (ref), CountText (copy), Patterns (upval), Text (copy), t (upval), Keyword (upval), Builtin (upval), Text1 (ref), v1 (ref), Text2 (ref), Libraries (upval), Text3 (ref), LexerModule (upval)
		local Init1 = nil
		local Builtin1 = nil
		local Segment = nil
		while Init <= CountText do
			local Flag = false
			local StartIndex = nil
			local EndIndex = nil
			
			for i, pattern in ipairs(Patterns) do
				StartIndex, EndIndex = string.find(Text, pattern, Init)
				
				if StartIndex ~= nil then
					Init = EndIndex + 1
					Flag = true
					Segment = string.sub(Text, StartIndex, EndIndex)
					local Entry = t[i]
					Builtin1 = Entry
					
					if Entry == "var" then
						local Replaced = string.gsub(Segment, "[%c%s]+", "")
						
						if Keyword[Replaced] then
							Builtin1 = "keyword"
						elseif Builtin[Replaced] then
							Builtin1 = "builtin"
						elseif string.find(Text1, "%.[%s%c]*$") and v1 ~= "comment" then
							local Library = Libraries[string.gsub(Text2, "[%c%s]+", "")]
							Builtin1 = if Library and Library[Replaced] and not string.find(Text3, "%.[%s%c]*$") then "builtin" else "iden"
						else
							Builtin1 = "iden"
						end
					elseif Entry == "string_inter" then
						if string.find(Segment, "[^\\]{") then
							Builtin1 = nil
							local Flag1 = true
							Init1 = 1
							local CountSegment = #Segment
							while Init1 <= CountSegment do
								local StartIndex1, EndIndex1 = string.find(Segment, "^.-[^\\][{}]", Init1)
								
								if StartIndex1 == nil then
									coroutine.yield("string", (string.sub(Segment, Init1)))
									break
								end
								if Flag1 then
									Init1 = EndIndex1 + 1
									coroutine.yield("string", (string.sub(Segment, StartIndex1, EndIndex1)))
									Flag1 = false
								else
									Init1 = EndIndex1
									
									for i1, value in LexerModule.scan((string.sub(Segment, StartIndex1, EndIndex1 - 1))) do
										coroutine.yield(i1, value)
									end
									Flag1 = true
								end
							end
						else
							Builtin1 = "string"
						end
					end
					Text3 = Text2
					Text2 = Text1
					Text1 = Segment
					v1 = Builtin1 or Entry
					
					if not Builtin1 then break end
					coroutine.yield(Builtin1, Segment)
					break
				else
					continue
				end
			end
			if not Flag then break end
		end
	end)
	
	return function() --[[ Line: 218 ]]
		-- upvalues: Thread (copy)
		if coroutine.status(Thread) == "dead" then return end
		local Success, Result, Resumed3 = coroutine.resume(Thread)
		
		if not Success or not Result then return end
		return Result, Resumed3
	end
end

function LexerModule.navigator() --[[ Line: 232 ]]
	-- upvalues: LexerModule (copy)
	local config = {
		Source = "",
		_RealIndex = 0,
		_UserIndex = 0,
		_ScanThread = nil,
		TokenCache = table.create(50),
		Destroy = function(p1) --[[ Line: 242 ]]
			p1.Source = nil
			p1._RealIndex = nil
			p1._UserIndex = nil
			p1.TokenCache = nil
			p1._ScanThread = nil
		end,
		SetSource = function(p1, Source) --[[ Line: 250 ]]
			-- upvalues: LexerModule (upval)
			p1.Source = Source
			p1._RealIndex = 0
			p1._UserIndex = 0
			table.clear(p1.TokenCache)
			p1._ScanThread = coroutine.create(function() --[[ Line: 257 ]]
				-- upvalues: LexerModule (upval), p1 (copy)
				for i, value in LexerModule.scan(p1.Source) do
					p1._RealIndex += 1
					p1.TokenCache[p1._RealIndex] = { i, value }
					coroutine.yield(i, value)
				end
			end)
		end
	}
	
	function config.Next() --[[ Line: 266 ]]
		-- upvalues: config (copy)
		config._UserIndex += 1
		
		if config._UserIndex <= config._RealIndex then
			return table.unpack(config.TokenCache[config._UserIndex])
		elseif coroutine.status(config._ScanThread) == "dead" then return end
		local Success, Result, Resumed3 = coroutine.resume(config._ScanThread)
		
		if not Success or not Result then return end
		return Result, Resumed3
	end
	
	function config.Peek(p2) --[[ Line: 289 ]]
		-- upvalues: config (copy)
		local NewUserIndex = config._UserIndex + p2
		
		if NewUserIndex > config._RealIndex then
			if coroutine.status(config._ScanThread) == "dead" then return end
			local v2 = nil
			local v3 = nil
			
			for _ = 1, NewUserIndex - config._RealIndex do
				local Success
				Success, v2, v30 = coroutine.resume(config._ScanThread)
				
				if not Success and not v2 then break end
			end
			return v2, v3
		elseif NewUserIndex <= 0 then return end
		return table.unpack(config.TokenCache[NewUserIndex])
	end
	
	return config
end

return LexerModule