local _ = require("./types")
local _ = require("../vendor/compose/core")
local self = setmetatable({}, { __mode = "k" })
local self1 = setmetatable({}, { __mode = "k" })
local t = {}
local t1 = {}
local Count = 0
local self2 = setmetatable({}, { __mode = "k" })

local function prepare(p1)
	-- upvalues: self2 (copy)
	local SelfEntry = self2[p1.lifetime]
	
	if SelfEntry == nil then
		SelfEntry = p1.Compose.createSharedResource(function()
			-- upvalues: p1 (copy), self2 (upval)
			local config = {
				alive = true,
				available = {},
				owner = assert(p1.Compose.currentOwner())
			}
			p1.Compose.cleanup(function()
				-- upvalues: config (copy), self2 (upval), p1 (upval)
				config.alive = false
				self2[p1.lifetime] = nil
			end)
			
			return config, nil
		end)
		self2[p1.lifetime] = SelfEntry
	end
	local v1 = assert(SelfEntry)()
	local Available = v1.available
	
	return function(Text, p2, p3, Size, Width)
		-- upvalues: Available (copy), p1 (copy), v1 (copy)
		local Text1: string = `{p3.Family}|{p3.Weight.Name}|{p3.Style.Name}|{Size}|{p2}`
		local AvailableEntry = Available[Text1]
		Available[Text1] = nil
		
		if AvailableEntry == nil then
			AvailableEntry = p1.Compose.withOwner(v1.owner, function()
				-- upvalues: p1 (upval), Text (copy), p2 (copy), p3 (copy), Size (copy), Width (copy)
				return p1.Host.GetTextBoundsParams({
					Text = Text,
					RichText = if p2 then true else nil,
					Font = p3,
					Size = Size,
					Width = if Width == 0 then nil else Width
				})
			end)
		else
			if AvailableEntry.Text ~= Text then
				AvailableEntry.Text = Text
			end
			if AvailableEntry.Width ~= Width then
				AvailableEntry.Width = Width
			end
		end
		local Flag = false
		
		return AvailableEntry, function()
			-- upvalues: Flag (ref), Available (upval), Text1 (copy), v1 (upval), AvailableEntry (copy)
			if Flag then return end
			Flag = true
			
			if Available[Text1] == nil and v1.alive then
				Available[Text1] = AvailableEntry
				
				return
			else
				AvailableEntry:Destroy()
			end
		end
	end
end

local function remember(Key, Key1, p1)
	-- upvalues: Count (ref), t1 (ref), t (ref)
	if Count >= 4096 then
		t1 = t
		t = {}
		Count = 0
	end
	local Entry = t[Key]
	
	if Entry == nil then
		Entry = {}
		t[Key] = Entry
	end
	Entry[Key1] = p1
	Count += 1
end

local function _(p1, p2)
	-- upvalues: t (ref), t1 (ref), remember (copy)
	local Entry = t[p1]
	local Entry1 = if Entry then Entry[p2] else nil
	
	if Entry1 == nil then
		local Entry2 = t1[p1]
		Entry1 = if Entry2 then Entry2[p2] else nil
		
		if Entry1 then
			remember(p1, p2, Entry1)
		end
	end
	return Entry1
end

local function inline(p1, p2, p3, Callback, Callback3)
	-- upvalues: prepare (copy), t (ref), t1 (ref), remember (copy), self (copy)
	local Compose = p1.Compose
	local v1 = assert(p1.config.services.TextService)
	local PrepareResult = prepare(p1)
	local NewResult = p1.types.Vector2.new(1e999, 0)
	local Count = 0
	local Flag = true
	local Text = nil
	local Key = ""
	local Key1 = ""
	local Largest = 0
	local Largest1 = 0
	local Length = -1
	local Key2 = ""
	local Text1 = ""
	local SpawnedThread = nil
	local Callback1: (() -> ())? = nil
	local Callback2: (() -> ())? = nil
	
	local function cancel()
		-- upvalues: Callback1 (ref), SpawnedThread (ref), Callback2 (ref)
		if Callback1 then
			Callback1()
			Callback1 = nil
		end
		if SpawnedThread and coroutine.status(SpawnedThread) == "suspended" and task and pcall(task.cancel, SpawnedThread) and Callback2 then
			Callback2()
		end
		SpawnedThread = nil
		Callback2 = nil
	end
	
	Compose.cleanup(function()
		-- upvalues: Flag (ref), cancel (copy)
		Flag = false
		cancel()
	end)
	
	local function publish(Text, Vector)
		-- upvalues: p3 (copy), Key2 (ref), Key1 (ref), Length (ref), Largest (ref), Largest1 (ref), NewResult (ref), p1 (copy)
		if p3 then
			local Length1: number = utf8.len(Text) or #Text
			
			if Key2 ~= Key1 or Length1 ~= Length then
				Key1 = Key2
				Largest = 0
				Largest1 = 0
				Length = Length1
			end
			Largest = math.max(Largest, Vector.X)
			Largest1 = math.max(Largest1, Vector.Y)
			Vector = if NewResult.X == Largest and NewResult.Y == Largest1 then NewResult else p1.types.Vector2.new(Largest, Largest1)
		end
		NewResult = Vector
	end
	
	return function(Text2)
		-- upvalues: Callback (copy), Key2 (ref), Text (ref), Key (ref), NewResult (ref), p3 (copy), Callback1 (ref), Text1 (ref), Count (ref), cancel (copy), t (upval), t1 (upval), remember (upval), publish (copy), p2 (copy), self (upval), PrepareResult (copy), Callback2 (ref), v1 (copy), Flag (ref), Callback3 (copy), SpawnedThread (ref)
		local CallbackResult = Callback()
		Key2 = CallbackResult.key
		
		if Text2 == Text and Key2 == Key then
			return NewResult
		end
		if p3 and Callback1 and Key2 == Key and Text and (utf8.len(Text2) or #Text2) == (utf8.len(Text) or #Text) then
			return NewResult
		end
		if Key2 ~= Key then
			local Face = CallbackResult.face
			Text1 = `{Face.Family}|{Face.Weight.Name}|{Face.Style.Name}|{CallbackResult.size}|{CallbackResult.rich}`
		end
		Text = Text2
		Key = Key2
		Count += 1
		local Count1: number = Count
		cancel()
		local Text3: string = Text1
		local Entry = t[Text3]
		local Entry1 = if Entry then Entry[Text2] else nil
		
		if Entry1 == nil then
			local Entry2 = t1[Text3]
			Entry1 = if Entry2 then Entry2[Text2] else nil
			
			if Entry1 then
				remember(Text3, Text2, Entry1)
			end
		end
		if Entry1 then
			publish(Text2, Entry1)
			
			return NewResult
		end
		self[p2] = (self[p2] or 0) + 1
		local v2 = true
		
		local function v51()
			-- upvalues: v2 (ref), self (upval), p2 (copy)
			if v2 then
				v2 = false
				local v3 = (self[p2] or 1) - 1
				
				if v3 > 0 then
					self[p2] = v3
					
					return
				end
				self[p2] = nil
			end
		end
		
		Callback1 = v51
		local PrepareResultResult, PrepareResultResult2 = PrepareResult(Text2, CallbackResult.rich, CallbackResult.face, CallbackResult.size, 0)
		Callback2 = PrepareResultResult2
		local Text4: string = Text1
		local Flag1 = false
		
		local function measure()
			-- upvalues: v1 (upval), PrepareResultResult (copy), PrepareResultResult2 (copy), remember (upval), Text4 (copy), Text2 (copy), Flag (upval), Count1 (copy), Count (upval), Callback2 (upval), publish (upval), v51 (copy), Callback1 (upval), Flag1 (ref), Callback3 (upval)
			local Success, Result = pcall(v1.GetTextBoundsAsync, v1, PrepareResultResult)
			PrepareResultResult2()
			
			if Success then
				remember(Text4, Text2, Result)
			end
			if Flag and Count1 == Count then
				Callback2 = nil
				
				if Success then
					publish(Text2, Result)
				end
				v51()
				Callback1 = nil
				
				if Flag1 then
					Callback3()
				end
			end
		end
		
		if task and task.spawn then
			SpawnedThread = task.spawn(measure)
		else
			measure()
		end
		Flag1 = true
		
		return NewResult
	end
end

local function createNatural(p1, Key)
	-- upvalues: inline (copy)
	local Compose = p1.Compose
	local CellResult = Compose.cell(p1.types.Vector2.new(1e999, 0))
	local TextResult = p1.observe.Text(Key)
	local RichTextResult = p1.observe.RichText(Key)
	local FontFaceResult = p1.observeStyled.FontFace(Key)
	local TextSizeResult = p1.observeStyled.TextSize(Key)
	local v1 = ""
	local Config = nil
	local Callback = nil
	Callback = inline(p1, Key, false, function()
		-- upvalues: Config (ref)
		return assert(Config)
	end, function()
		-- upvalues: CellResult (copy), Callback (ref), v1 (ref)
		CellResult:set(Callback(v1))
	end)
	Compose.watch(function(Callback1)
		-- upvalues: RichTextResult (copy), FontFaceResult (copy), TextSizeResult (copy), v1 (ref), TextResult (copy), Config (ref), CellResult (copy), Callback (ref)
		local CallbackResult = Callback1(RichTextResult)
		local CallbackResult1 = Callback1(FontFaceResult)
		local CallbackResult2 = Callback1(TextSizeResult)
		v1 = Callback1(TextResult)
		Config = {
			face = CallbackResult1,
			size = CallbackResult2,
			rich = CallbackResult,
			key = `{CallbackResult1.Family}|{CallbackResult1.Weight.Name}|{CallbackResult1.Style.Name}|{CallbackResult2}|{CallbackResult}`
		}
		CellResult:set(Callback(v1))
	end)
	
	return CellResult
end

return {
	hold = function(Key)
		-- upvalues: self (copy)
		self[Key] = (self[Key] or 0) + 1
		local v1 = true
		
		return function()
			-- upvalues: v1 (ref), self (upval), Key (copy)
			if v1 then
				v1 = false
				local v2 = (self[Key] or 1) - 1
				
				if v2 > 0 then
					self[Key] = v2
					
					return
				end
				self[Key] = nil
			end
		end
	end,
	prepare = prepare,
	inline = inline,
	pending = function(p1): boolean
		-- upvalues: self (copy)
		return self[p1] ~= nil
	end,
	natural = function(p1, Key, Callback)
		-- upvalues: self1 (copy), createNatural (copy)
		if p1.config.services.TextService == nil then
			return if Callback then Callback() else p1.Compose.cell(p1.types.Vector2.new(1e999, 0))
		end
		local SelfEntry = self1[Key]
		
		if not SelfEntry then
			SelfEntry = p1.Compose.createSharedResource(function()
				-- upvalues: p1 (copy), self1 (upval), Key (copy), createNatural (upval)
				p1.Compose.cleanup(function()
					-- upvalues: self1 (upval), Key (upval)
					self1[Key] = nil
				end)
				
				return createNatural(p1, Key), nil
			end)
			self1[Key] = SelfEntry
		end
		return assert(SelfEntry)()
	end
}