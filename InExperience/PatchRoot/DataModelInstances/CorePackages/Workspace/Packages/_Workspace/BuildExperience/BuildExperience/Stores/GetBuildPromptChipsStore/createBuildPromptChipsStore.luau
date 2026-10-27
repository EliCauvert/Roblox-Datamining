local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local SignalsModule = require(Parent.Signals)
local _ = require(BuildExperience.Chat.chatTypes)
local PROMPTCHIPSSTATUS = require(script.Parent.promptChipsStatus).PROMPT_CHIPS_STATUS

return function(p1)
	-- upvalues: CreatorAgentChatModule (copy), SignalsModule (copy), PROMPTCHIPSSTATUS (copy)
	local RequestBuildSuggestions = if p1 == nil or p1.requestSuggestions == nil then CreatorAgentChatModule.requestBuildSuggestions else p1.requestSuggestions
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal(PROMPTCHIPSSTATUS.Idle)
	local Callback: (() -> ())? = nil
	local Count = 0
	
	local function _()
		-- upvalues: Count (ref), Callback (ref)
		Count += 1
		
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
	end
	
	return {
		getChips = Signal,
		getStatus = Signal1,
		requestChips = function(p2, Callback1, Callback2)
			-- upvalues: Count (ref), Callback (ref), Signal2_1 (copy), PROMPTCHIPSSTATUS (upval), RequestBuildSuggestions (copy), SignalsModule (upval), Signal2 (copy)
			Count += 1
			
			if Callback ~= nil then
				Callback()
				Callback = nil
			end
			local Count1: number = Count
			Signal2_1(PROMPTCHIPSSTATUS.Loading)
			local RequestBuildSuggestionsResult = RequestBuildSuggestions({
				prompt = p2.prompt,
				selectedChip = if p2.selectedChip == nil then nil else p2.selectedChip.value
			})
			local Flag = false
			local Effect: () -> () = SignalsModule.createEffect(function(p3)
				-- upvalues: RequestBuildSuggestionsResult (copy), Flag (ref), Signal2 (upval), Signal2_1 (upval), PROMPTCHIPSSTATUS (upval), Callback1 (copy), Callback2 (copy)
				local StateResult = RequestBuildSuggestionsResult.state(p3)
				
				if Flag or StateResult.status == "pending" then return end
				Flag = true
				local Result = StateResult.result
				
				if StateResult.status == "succeeded" and Result ~= nil then
					Signal2(Result.chips)
					Signal2_1(PROMPTCHIPSSTATUS.Succeeded)
					
					if Result.prompt ~= nil and Callback1 ~= nil then
						Callback1(Result.prompt)
					end
					if Callback2 ~= nil then
						Callback2(true)
						
						return
					end
				else
					Signal2({})
					Signal2_1(PROMPTCHIPSSTATUS.Failed)
					
					if Callback2 ~= nil then
						Callback2(false)
					end
				end
			end)
			
			if Count1 == Count then
				Callback = function()
					-- upvalues: Effect (copy), RequestBuildSuggestionsResult (copy)
					Effect()
					RequestBuildSuggestionsResult.dispose()
				end
				
				return
			else
				Effect()
				RequestBuildSuggestionsResult.dispose()
			end
		end,
		reset = function()
			-- upvalues: Count (ref), Callback (ref), Signal2 (copy), Signal2_1 (copy), PROMPTCHIPSSTATUS (upval)
			Count += 1
			
			if Callback ~= nil then
				Callback()
				Callback = nil
			end
			Signal2({})
			Signal2_1(PROMPTCHIPSSTATUS.Idle)
		end
	}
end