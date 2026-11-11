local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local GetTextBoundsAsyncModule = require(Foundation.Utility.getTextBoundsAsync)
local NormalizeFontFaceModule = require(Foundation.Utility.normalizeFontFace)
local RunService = require(Foundation.Utility.Wrappers.Services).RunService
local t = {}

return function(Key, p1: number, p2)
	-- upvalues: ReactModule (copy), t (copy), NormalizeFontFaceModule (copy), GetTextBoundsAsyncModule (copy), RunService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({ level = 0, key = Key })
	local Level = if UseStateResult.key == Key then UseStateResult.level else 0
	local Largest = math.max(p1 - 1, 0)
	local Text: string = `{p2.Font}|{p2.FontSize}`
	local Entry = t[Text] or 0
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef({})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult (upval), UseRefResult1 (upval)
			for _, Connection in UseRefResult.current do
				Connection:Disconnect()
			end
			table.clear(UseRefResult.current)
			table.clear(UseRefResult1.current)
		end
	end, { Key })
	local UseResult = ReactModule.useCallback(function(Level1, p3, p4)
		-- upvalues: Entry (copy), Level (copy), Largest (copy), t (upval), Text (copy), NormalizeFontFaceModule (upval), p2 (copy), GetTextBoundsAsyncModule (upval), UseStateResult2 (copy), Key (copy)
		local Level2: number = Level
		
		if Level1 == Level and Level < Largest and (not p4 and p3 <= Entry + 1) then
			Level2 = Level + 1
		elseif Level1 == Level - 1 and Entry + 4 < p3 then
			Level2 = Level - 1
		end
		if Level < Level2 and t[Text] == nil then
			local NormalizeFontFaceModuleResult = NormalizeFontFaceModule(p2.Font)
			local Vector = if typeof(NormalizeFontFaceModuleResult) == "Font" then GetTextBoundsAsyncModule("…", NormalizeFontFaceModuleResult, p2.FontSize or 0) else nil
			
			if Vector and Vector.X > 0 then
				t[Text] = math.ceil(Vector.X)
			end
		end
		if Level2 ~= Level then
			UseStateResult2({ key = Key, level = Level2 })
		end
	end, {
		Key, Level, Largest, Entry, Text, p2
	})
	local UseRefResult2 = ReactModule.useRef(UseResult)
	UseRefResult2.current = UseResult
	local UseResult1 = ReactModule.useCallback(function(p3, Frame)
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), RunService (upval), UseRefResult2 (copy)
		UseRefResult1.current[p3] = Frame
		
		if not UseRefResult.current[p3] then
			local Count = 0
			
			local function check()
				-- upvalues: Count (ref), Frame (copy), UseRefResult (upval), p3 (copy), RunService (upval), check (copy), UseRefResult2 (upval)
				Count += 1
				local X: number = Frame.AbsoluteSize.X
				
				if X + 1 < Frame.TextBounds.X and Count < 10 then
					UseRefResult.current[p3] = RunService.Heartbeat:Once(check)
					
					return
				else
					UseRefResult.current[p3] = nil
					UseRefResult2.current(p3, X, Frame.TextFits)
				end
			end
			
			UseRefResult.current[p3] = RunService.Heartbeat:Once(check)
			
			return
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: Level (copy), UseRefResult1 (copy), UseResult1 (copy)
		for _, value in { Level - 1, Level } do
			local CurrentEntry = UseRefResult1.current[value]
			
			if CurrentEntry and CurrentEntry.Parent then
				UseResult1(value, CurrentEntry)
			end
		end
	end, { Level, Key, Entry, UseResult1 })
	
	return {
		minWidth = Entry,
		getShrinkRatio = ReactModule.useCallback(function(p3)
			-- upvalues: Level (copy)
			return if p3 <= Level then 1000 ^ (Level - p3) else nil
		end, { Level }),
		isPinned = ReactModule.useCallback(function(p3): boolean
			-- upvalues: Level (copy)
			return p3 < Level
		end, { Level }),
		isDeciding = ReactModule.useCallback(function(Level1): boolean
			-- upvalues: Level (copy)
			return Level1 == Level or Level1 == Level - 1
		end, { Level }),
		onSizeChanged = UseResult1
	}
end