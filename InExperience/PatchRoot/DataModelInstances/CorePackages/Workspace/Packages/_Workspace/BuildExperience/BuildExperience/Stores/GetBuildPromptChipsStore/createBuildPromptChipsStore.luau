local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local SignalsModule = require(Parent.Signals)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildFTUXChipInfiniteScrollModule = require(BuildExperience.Flags.FFlagBuildFTUXChipInfiniteScroll)
local PROMPTCHIPSSTATUS = require(script.Parent.promptChipsStatus).PROMPT_CHIPS_STATUS

return function(p1)
	-- upvalues: CreatorAgentChatModule (copy), SignalsModule (copy), PROMPTCHIPSSTATUS (copy), FFlagBuildFTUXChipInfiniteScrollModule (copy)
	local RequestBuildSuggestions = if p1 == nil or p1.requestSuggestions == nil then CreatorAgentChatModule.requestBuildSuggestions else p1.requestSuggestions
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal(PROMPTCHIPSSTATUS.Idle)
	local Callback: (() -> ())? = nil
	local Count = 0
	local Config = nil
	
	local function _()
		-- upvalues: Count (ref), Callback (ref)
		Count += 1
		
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
	end
	
	local function cacheContinuation(p2, Prompt)
		-- upvalues: Config (ref)
		if p2.cursor == nil then
			Config = nil
			
			return
		end
		if p2.seed == nil then
			warn("Build suggestions response has a cursor without a seed")
			Config = nil
			
			return
		else
			Config = {
				prompt = p2.prompt or Prompt,
				seed = p2.seed,
				cursor = p2.cursor
			}
		end
	end
	
	local function startRequest(p2, Callback1: () -> (), Callback2): boolean
		-- upvalues: Count (ref), Callback (ref), Signal2_1 (copy), PROMPTCHIPSSTATUS (upval), RequestBuildSuggestions (copy), SignalsModule (upval)
		Count += 1
		
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
		local Count1: number = Count
		
		if Callback1 ~= nil then
			Callback1()
		end
		Signal2_1(PROMPTCHIPSSTATUS.Loading)
		local RequestBuildSuggestionsResult = RequestBuildSuggestions(p2)
		local Flag = false
		local Effect: () -> () = SignalsModule.createEffect(function(p3)
			-- upvalues: RequestBuildSuggestionsResult (copy), Flag (ref), Callback2 (copy)
			local StateResult = RequestBuildSuggestionsResult.state(p3)
			
			if not Flag and StateResult.status ~= "pending" then
				Flag = true
				Callback2(StateResult.status == "succeeded", StateResult.result)
				
				return
			end
		end)
		
		if Count1 == Count then
			Callback = function()
				-- upvalues: Effect (copy), RequestBuildSuggestionsResult (copy)
				Effect()
				RequestBuildSuggestionsResult.dispose()
			end
			
			return true
		else
			Effect()
			RequestBuildSuggestionsResult.dispose()
			
			return false
		end
	end
	
	return {
		getChips = Signal,
		getStatus = Signal1,
		requestChips = function(p2, Callback1, Callback2)
			-- upvalues: FFlagBuildFTUXChipInfiniteScrollModule (upval), startRequest (copy), Config (ref), Signal2 (copy), cacheContinuation (copy), Signal2_1 (copy), PROMPTCHIPSSTATUS (upval), Count (ref), Callback (ref), RequestBuildSuggestions (copy), SignalsModule (upval)
			if FFlagBuildFTUXChipInfiniteScrollModule then
				startRequest({
					prompt = p2.prompt,
					selectedChip = if p2.selectedChip == nil then nil else p2.selectedChip.value
				}, function()
					-- upvalues: Config (upval), Signal2 (upval)
					Config = nil
					Signal2({})
				end, function(p3, p4)
					-- upvalues: cacheContinuation (upval), p2 (copy), Signal2 (upval), Signal2_1 (upval), PROMPTCHIPSSTATUS (upval), Callback1 (copy), Callback2 (copy)
					if p3 and p4 ~= nil then
						cacheContinuation(p4, p2.prompt)
						Signal2(p4.chips)
						Signal2_1(PROMPTCHIPSSTATUS.Succeeded)
						
						if p4.prompt ~= nil and Callback1 ~= nil then
							Callback1(p4.prompt)
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
				
				return
			end
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
		requestNextPage = function(Callback)
			-- upvalues: Config (ref), Signal1 (copy), PROMPTCHIPSSTATUS (upval), startRequest (copy), Signal (copy), cacheContinuation (copy), Signal2 (copy), Signal2_1 (copy)
			if Config == nil or Signal1() == PROMPTCHIPSSTATUS.Loading then
				return false
			else
				local Config1 = Config
				
				return (startRequest({
					prompt = Config1.prompt,
					seed = Config1.seed,
					cursor = Config1.cursor
				}, nil, function(p2, p3)
					-- upvalues: Signal (upval), cacheContinuation (upval), Config1 (copy), Signal2 (upval), Signal2_1 (upval), PROMPTCHIPSSTATUS (upval), Callback (copy)
					if p2 and p3 ~= nil then
						local Copy = table.clone(Signal())
						
						for _, chip in p3.chips do
							table.insert(Copy, chip)
						end
						cacheContinuation(p3, Config1.prompt)
						Signal2(Copy)
					end
					Signal2_1(PROMPTCHIPSSTATUS.Succeeded)
					
					if Callback ~= nil then
						Callback(p2 and p3 ~= nil)
					end
				end))
			end
		end,
		reset = function()
			-- upvalues: Count (ref), Callback (ref), FFlagBuildFTUXChipInfiniteScrollModule (upval), Config (ref), Signal2 (copy), Signal2_1 (copy), PROMPTCHIPSSTATUS (upval)
			Count += 1
			
			if Callback ~= nil then
				Callback()
				Callback = nil
			end
			if FFlagBuildFTUXChipInfiniteScrollModule then
				Config = nil
			end
			Signal2({})
			Signal2_1(PROMPTCHIPSSTATUS.Idle)
		end
	}
end