local ReactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)

local function _(p1)
	return if p1 == nil or p1 == "" then " " else p1
end

local _ = function(p1: number): number
	return if p1 == nil then 0.05 else math.max(p1, 0)
end

local _ = function(p1): boolean
	return not p1
end

local _ = function(Text: string, p1): string
	return string.match(Text, if p1 then "^<%s*/%s*([%w]+)" else "^<%s*([%w]+)")
end

local _ = function(Text: string, p1): boolean
	return p1 == "br" or string.match(Text, "/%s*>$") ~= nil
end

local function removeLastMatchingTag(List, Match)
	for i = #List, 1, -1 do
		if List[i] == Match then
			table.remove(List, i)
			break
		end
	end
end

local _ = function(List, p1): string
	local Joined = table.concat(List)
	
	for i = #p1, 1, -1 do
		Joined ..= `</{p1[i]}>`
	end
	return Joined
end

local _ = function(List1, List, p2)
	local Joined = table.concat(List)
	
	for i = #p2, 1, -1 do
		Joined ..= `</{p2[i]}>`
	end
	local Joined1: string = Joined
	
	if Joined1 ~= List1[#List1] then
		table.insert(List1, Joined1)
	end
end

local function buildRevealTextFrames(Text: string, Delimiter, RichText, RemoveDelimiter)
	-- upvalues: removeLastMatchingTag (copy)
	if Text == nil or Text == "" then
		return { Text or "" }
	end
	local Delimiter1 = if Delimiter == nil or Delimiter == "" then " " else Delimiter
	local List = {}
	local List1 = {}
	local List2 = {}
	local Flag = false
	local StartIndex = 1
	local CountText = #Text
	local CountDelimiter1 = #Delimiter1
	while StartIndex <= CountText do
		local Flag1 = false
		
		if CountDelimiter1 > 0 and string.sub(Text, StartIndex, StartIndex + CountDelimiter1 - 1) == Delimiter1 then
			if Flag then
				local Joined1 = table.concat(List1)
				
				for i1 = #List2, 1, -1 do
					Joined1 ..= `</{List2[i1]}>`
				end
				local Joined2: string = Joined1
				
				if Joined2 ~= List[#List] then
					table.insert(List, Joined2)
				end
				Flag = false
			end
			if not RemoveDelimiter then
				table.insert(List1, Delimiter1)
			end
			StartIndex += CountDelimiter1
			Flag1 = true
		elseif RichText and string.sub(Text, StartIndex, StartIndex) == "<" then
			local FoundAt: number? = string.find(Text, ">", StartIndex, true)
			
			if FoundAt then
				local Segment = string.sub(Text, StartIndex, FoundAt)
				table.insert(List1, Segment)
				local IsSegmentMatch = string.sub(Segment, 1, 2) == "</"
				local Match: string? = string.match(Segment, if IsSegmentMatch then "^<%s*/%s*([%w]+)" else "^<%s*([%w]+)")
				
				if Match then
					if IsSegmentMatch then
						removeLastMatchingTag(List2, Match)
					elseif Match ~= "br" and string.match(Segment, "/%s*>$") == nil then
						table.insert(List2, Match)
					end
				end
				StartIndex = FoundAt + 1
				Flag1 = true
			end
		end
		if Flag1 then continue end
		table.insert(List1, (string.sub(Text, StartIndex, StartIndex)))
		Flag = true
		StartIndex += 1
	end
	local Joined = table.concat(List1)
	
	for i = #List2, 1, -1 do
		Joined ..= `</{List2[i]}>`
	end
	local Joined3: string = Joined
	
	if Joined3 ~= List[#List] then
		table.insert(List, Joined3)
	end
	return List
end

return function(p3)
	-- upvalues: ReactModule (copy), buildRevealTextFrames (copy)
	local Text = p3.text
	local Delimiter = p3.delimiter
	local RemoveDelimiter = p3.removeDelimiter
	local RichText = p3.richText
	local RevealInterval: number = p3.revealInterval
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: buildRevealTextFrames (upval), Text (copy), Delimiter (copy), RichText (copy), RemoveDelimiter (copy)
		return (buildRevealTextFrames(Text, Delimiter, RichText, RemoveDelimiter))
	end, { Text, Delimiter, RichText, RemoveDelimiter })
	local Largest: number = if RevealInterval == nil then 0.05 else math.max(RevealInterval, 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if Largest == 0 then UseMemoResult[#UseMemoResult] else UseMemoResult[1])
	ReactModule.useEffect(function()
		-- upvalues: Largest (copy), UseStateResult2 (copy), UseMemoResult (copy)
		local SpawnedThread = task.spawn(function()
			-- upvalues: Largest (upval), UseStateResult2 (upval), UseMemoResult (upval)
			if Largest == 0 then
				UseStateResult2(UseMemoResult[#UseMemoResult])
				
				return
			end
			UseStateResult2(UseMemoResult[1])
			
			for i = 2, #UseMemoResult do
				task.wait(Largest)
				UseStateResult2(UseMemoResult[i])
			end
		end)
		
		return function()
			-- upvalues: SpawnedThread (copy)
			task.cancel(SpawnedThread)
		end
	end, { UseMemoResult, Largest })
	
	return UseStateResult
end