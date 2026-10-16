local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

local function _(p1, p2) --[[ Line: 36 | Named "truncatePath" ]]
	local t = {}
	
	for i = 1, p2 do
		if p1[i] then
			t[i] = p1[i]
		end
	end
	return t
end

local _ = function(p3, Key: number, p4) --[[ Line: 46 | Named "buildPath" ]]
	local t = {}
	
	for i = 1, Key - 1 do
		if p3[i] then
			t[i] = p3[i]
		end
	end
	t[Key] = p4
	
	return t
end

return function() --[[ Line: 52 | Named "useSubmenuHover" ]]
	-- upvalues: UseTokensModule (copy), ReactModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Time100 = UseTokensModuleResult.Time.Time_100
	local Time300 = UseTokensModuleResult.Time.Time_300
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	UseRefResult.current = UseStateResult
	local UseResult = ReactModule.useCallback(function() --[[ Line: 64 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy)
		if UseRefResult1.current then
			task.cancel(UseRefResult1.current)
			UseRefResult1.current = nil
		end
		if UseRefResult2.current then
			task.cancel(UseRefResult2.current)
			UseRefResult2.current = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p5, CurrentEntry, p6) --[[ Line: 75 ]]
		-- upvalues: UseResult (copy), UseRefResult (copy), UseStateResult2 (copy), UseRefResult1 (copy), Time100 (copy)
		UseResult()
		
		if UseRefResult.current[p5] == CurrentEntry then return end
		if p6 then
			UseStateResult2(function(p7) --[[ Line: 83 ]]
				-- upvalues: p5 (copy), CurrentEntry (copy)
				local CurrentEntries = {}
				
				for i = 1, p5 - 1 do
					if p7[i] then
						CurrentEntries[i] = p7[i]
					end
				end
				CurrentEntries[p5] = CurrentEntry
				
				return CurrentEntries
			end)
			
			return
		else
			UseRefResult1.current = task.delay(Time100, function() --[[ Line: 89 ]]
				-- upvalues: UseStateResult2 (upval), p5 (copy), CurrentEntry (copy), UseRefResult1 (upval)
				UseStateResult2(function(p8) --[[ Line: 90 ]]
					-- upvalues: p5 (upval), CurrentEntry (upval)
					local CurrentEntries = {}
					
					for i = 1, p5 - 1 do
						if p8[i] then
							CurrentEntries[i] = p8[i]
						end
					end
					CurrentEntries[p5] = CurrentEntry
					
					return CurrentEntries
				end)
				UseRefResult1.current = nil
			end)
		end
	end, { UseResult, Time100 })
	local UseResult2 = ReactModule.useCallback(function(p7) --[[ Line: 97 ]]
		-- upvalues: UseResult (copy), UseRefResult (copy), UseRefResult2 (copy), Time300 (copy), UseStateResult2 (copy)
		UseResult()
		
		if #UseRefResult.current >= p7 then
			UseRefResult2.current = task.delay(Time300, function() --[[ Line: 104 ]]
				-- upvalues: UseStateResult2 (upval), p7 (copy), UseRefResult2 (upval)
				UseStateResult2(function(p8) --[[ Line: 105 ]]
					-- upvalues: p7 (upval)
					if #p8 < p7 then
						return p8
					end
					local t = {}
					
					for i = 1, p7 - 1 do
						if p8[i] then
							t[i] = p8[i]
						end
					end
					return t
				end)
				UseRefResult2.current = nil
			end)
			
			return
		end
	end, { UseResult, Time300 })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 117 ]]
		-- upvalues: UseResult (copy), UseStateResult2 (copy)
		UseResult()
		UseStateResult2({})
	end, { UseResult })
	ReactModule.useEffect(function() --[[ Line: 123 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy)
		return function() --[[ Line: 124 ]]
			-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval)
			if UseRefResult1.current then
				task.cancel(UseRefResult1.current)
			end
			if UseRefResult2.current then
				task.cancel(UseRefResult2.current)
			end
		end
	end, {})
	
	return {
		openPath = UseStateResult,
		openAtDepth = UseResult1,
		closeAtDepth = UseResult2,
		reset = UseResult3
	}
end