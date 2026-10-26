local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Stores.GetBuildPromptChipsStore)
local PROMPTCHIPSSTATUS = require(BuildExperience.Stores.GetBuildPromptChipsStore.promptChipsStatus).PROMPT_CHIPS_STATUS
local FIntBuildPromptChipEditDebounceMsModuleRatio = require(BuildExperience.Flags.FIntBuildPromptChipEditDebounceMs) / 1000

return function(p1, p2)
	-- upvalues: ReactModule (copy), PROMPTCHIPSSTATUS (copy), FIntBuildPromptChipEditDebounceMsModuleRatio (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(p2)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			task.cancel(Current)
			UseRefResult.current = nil
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseRefResult2 (copy), UseResult (copy), UseRefResult1 (copy), p1 (copy)
		if p2 then
			UseRefResult2.current = true
			
			return
		end
		UseResult()
		UseRefResult1.current = nil
		
		if UseRefResult2.current then
			UseRefResult2.current = false
			p1.reset()
		end
	end, { p1, p2, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), p1 (copy)
		return function()
			-- upvalues: UseResult (upval), p1 (upval)
			UseResult()
			p1.reset()
		end
	end, { p1, UseResult })
	
	return (ReactModule.useCallback(function(Text: string)
		-- upvalues: p2 (copy), UseResult (copy), UseRefResult1 (copy), p1 (copy), PROMPTCHIPSSTATUS (upval), UseRefResult (copy), FIntBuildPromptChipEditDebounceMsModuleRatio (upval)
		if not p2 then return end
		UseResult()
		local Match: string = string.match(Text, "^%s*(.-)%s*$") or ""
		
		if Match == UseRefResult1.current then
			local Status = p1.getStatus()
			
			if Status ~= PROMPTCHIPSSTATUS.Idle and Status ~= PROMPTCHIPSSTATUS.Failed then return end
		end
		UseRefResult.current = task.delay(FIntBuildPromptChipEditDebounceMsModuleRatio, function()
			-- upvalues: UseRefResult (upval), UseRefResult1 (upval), Match (copy), p1 (upval)
			UseRefResult.current = nil
			UseRefResult1.current = Match
			p1.requestChips({ prompt = Match })
		end)
	end, { p1, p2, UseResult }))
end