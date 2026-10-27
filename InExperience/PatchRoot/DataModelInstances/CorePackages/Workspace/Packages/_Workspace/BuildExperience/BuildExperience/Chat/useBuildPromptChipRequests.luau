local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local _ = require(BuildExperience.Stores.GetBuildPromptChipsStore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local PROMPTCHIPSSTATUS = require(BuildExperience.Stores.GetBuildPromptChipsStore.promptChipsStatus).PROMPT_CHIPS_STATUS
local FIntBuildPromptChipEditDebounceMsModuleRatio = require(BuildExperience.Flags.FIntBuildPromptChipEditDebounceMs) / 1000

return function(p1, p2)
	-- upvalues: ReactModule (copy), SendBuildExperienceEventModule (copy), PROMPTCHIPSSTATUS (copy), FIntBuildPromptChipEditDebounceMsModuleRatio (copy)
	local IsActive = p2.isActive
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(IsActive)
	local TelemetryGranularity = p2.telemetryGranularity
	local UseResult = ReactModule.useCallback(function(p3, p4)
		-- upvalues: p1 (copy), SendBuildExperienceEventModule (upval), TelemetryGranularity (copy)
		local ClockTime = os.clock()
		p1.requestChips(p3, p4, function(p5)
			-- upvalues: ClockTime (copy), SendBuildExperienceEventModule (upval), TelemetryGranularity (upval)
			SendBuildExperienceEventModule("CHIP_LOAD", TelemetryGranularity, {
				elapsedMs = tostring((math.max(0, (math.round((os.clock() - ClockTime) * 1000))))),
				succeeded = tostring(p5)
			})
		end)
	end, { p1, TelemetryGranularity })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			task.cancel(Current)
			UseRefResult.current = nil
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: IsActive (copy), UseRefResult4 (copy), UseResult1 (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), p1 (copy)
		if IsActive then
			UseRefResult4.current = true
			
			return
		end
		UseResult1()
		UseRefResult1.current = nil
		UseRefResult2.current = nil
		UseRefResult3.current = nil
		
		if UseRefResult4.current then
			UseRefResult4.current = false
			p1.reset()
		end
	end, { p1, IsActive, UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: IsActive (copy), UseRefResult3 (copy), p2 (copy), UseResult1 (copy), UseRefResult1 (copy), UseRefResult2 (copy), p1 (copy), UseResult (copy)
		if not IsActive then return end
		if UseRefResult3.current ~= nil and UseRefResult3.current ~= p2.sessionKey then
			UseResult1()
			UseRefResult1.current = nil
			UseRefResult2.current = nil
			p1.reset()
		end
		UseRefResult3.current = p2.sessionKey
		
		if not p2.shouldRequestInitialChips then return end
		if UseRefResult2.current ~= p2.sessionKey then
			UseResult1()
			UseRefResult2.current = p2.sessionKey
			UseRefResult1.current = ""
			UseResult({ prompt = "" })
			
			return
		end
	end, {
		p1, IsActive, p2.sessionKey, p2.shouldRequestInitialChips, UseResult1,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy), p1 (copy)
		return function()
			-- upvalues: UseResult1 (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult3 (upval), UseRefResult4 (upval), p1 (upval)
			UseResult1()
			UseRefResult1.current = nil
			UseRefResult2.current = nil
			UseRefResult3.current = nil
			UseRefResult4.current = false
			p1.reset()
		end
	end, { p1, UseResult1 })
	
	return {
		requestChipsForEdit = ReactModule.useCallback(function(Text: string)
			-- upvalues: IsActive (copy), UseResult1 (copy), UseRefResult1 (copy), p1 (copy), PROMPTCHIPSSTATUS (upval), UseRefResult (copy), FIntBuildPromptChipEditDebounceMsModuleRatio (upval), SendBuildExperienceEventModule (upval), TelemetryGranularity (copy), UseResult (copy)
			if not IsActive then return end
			UseResult1()
			local Match: string = string.match(Text, "^%s*(.-)%s*$") or ""
			
			if Match == UseRefResult1.current then
				local Status = p1.getStatus()
				
				if Status ~= PROMPTCHIPSSTATUS.Idle and Status ~= PROMPTCHIPSSTATUS.Failed then return end
			end
			UseRefResult.current = task.delay(FIntBuildPromptChipEditDebounceMsModuleRatio, function()
				-- upvalues: UseRefResult (upval), UseRefResult1 (upval), Match (copy), SendBuildExperienceEventModule (upval), TelemetryGranularity (upval), UseResult (upval)
				UseRefResult.current = nil
				UseRefResult1.current = Match
				SendBuildExperienceEventModule("CHIP_PROMPT_EDIT", TelemetryGranularity)
				UseResult({ prompt = Match })
			end)
		end, {
			p1,
			IsActive,
			UseResult1,
			UseResult,
			TelemetryGranularity
		}),
		requestChipsForSelection = ReactModule.useCallback(function(Prompt, SelectedChip, p3)
			-- upvalues: IsActive (copy), UseResult1 (copy), UseRefResult1 (copy), SendBuildExperienceEventModule (upval), TelemetryGranularity (copy), UseResult (copy)
			if IsActive then
				UseResult1()
				UseRefResult1.current = nil
				SendBuildExperienceEventModule("CHIP_CLICK", TelemetryGranularity)
				UseResult({ prompt = Prompt, selectedChip = SelectedChip }, p3)
				
				return
			end
		end, { IsActive, UseResult1, UseResult, TelemetryGranularity })
	}
end