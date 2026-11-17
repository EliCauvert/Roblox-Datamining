local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AnimatedChipGroupContainerModule = require(script.Parent.AnimatedChipGroup.AnimatedChipGroupContainer)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceFTUXChipExhaustedTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceFTUXChipExhaustedTelemetry)
local FIntBuildExperienceFTUXChipExhaustedThresholdPxModule = require(BuildExperience.Flags.FIntBuildExperienceFTUXChipExhaustedThresholdPx)
local FFlagBuildExperienceFTUXChipLoadInAnimationModule = require(BuildExperience.Flags.FFlagBuildExperienceFTUXChipLoadInAnimation)
local FFlagBuildFTUXChipInfiniteScrollModule = require(BuildExperience.Flags.FFlagBuildFTUXChipInfiniteScroll)
local ChipGroup = FoundationModule.ChipGroup
local ChipGroupVariant = FoundationModule.Enums.ChipGroupVariant
local ChipSize = FoundationModule.Enums.ChipSize
local IconName = FoundationModule.Enums.IconName
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(p1)
	-- upvalues: IconName (copy)
	return if p1.value == "2D" then IconName.SquareCheck elseif p1.value == "3D" then IconName.CubeVertexes else IconName.PlusLarge
end

local function useChipExhaustionListener(Frame)
	-- upvalues: ReactModule (copy), FFlagBuildFTUXChipInfiniteScrollModule (copy), FIntBuildExperienceFTUXChipExhaustedThresholdPxModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(Frame.promptChips)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), Frame (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		if UseRefResult3.current ~= Frame.promptChips then
			UseRefResult1.current = false
			UseRefResult2.current = false
		end
		UseRefResult3.current = Frame.promptChips
	end, { Frame.promptChips })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseRefResult (copy), FFlagBuildFTUXChipInfiniteScrollModule (upval), UseRefResult2 (copy), FIntBuildExperienceFTUXChipExhaustedThresholdPxModule (upval), UseRefResult1 (copy), UseRefResult3 (copy)
		local OnExhaustedFunction = Frame.onExhausted
		
		if OnExhaustedFunction == nil then return end
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local ScrollingFrame = Current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if ScrollingFrame == nil then return end
		local function checkExhaustion()
			-- upvalues: FFlagBuildFTUXChipInfiniteScrollModule (upval), Frame (upval), UseRefResult2 (upval), ScrollingFrame (copy), FIntBuildExperienceFTUXChipExhaustedThresholdPxModule (upval), UseRefResult1 (upval), OnExhaustedFunction (copy), UseRefResult3 (upval)
			if FFlagBuildFTUXChipInfiniteScrollModule and (Frame.isLoading or #Frame.promptChips == 0 or UseRefResult2.current) then return end
			local XDelta = ScrollingFrame.AbsoluteCanvasSize.X - ScrollingFrame.AbsoluteWindowSize.X
			
			if (XDelta > 0 and XDelta - FIntBuildExperienceFTUXChipExhaustedThresholdPxModule <= ScrollingFrame.CanvasPosition.X or FFlagBuildFTUXChipInfiniteScrollModule and ScrollingFrame.AbsoluteWindowSize.X > 0 and XDelta <= 0) and not UseRefResult1.current then
				UseRefResult1.current = true
				local PromptChips = Frame.promptChips
				OnExhaustedFunction(function(p1)
					-- upvalues: FFlagBuildFTUXChipInfiniteScrollModule (upval), UseRefResult3 (upval), PromptChips (copy), UseRefResult1 (upval), UseRefResult2 (upval)
					if FFlagBuildFTUXChipInfiniteScrollModule and not p1 and UseRefResult3.current == PromptChips then
						UseRefResult1.current = false
						UseRefResult2.current = true
					end
				end)
			end
		end
		
		local Connection = ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			-- upvalues: UseRefResult2 (upval), ScrollingFrame (copy), FIntBuildExperienceFTUXChipExhaustedThresholdPxModule (upval), checkExhaustion (copy)
			if not UseRefResult2.current then
				checkExhaustion()
				
				return
			end
			local XDelta = ScrollingFrame.AbsoluteCanvasSize.X - ScrollingFrame.AbsoluteWindowSize.X
			
			if XDelta > 0 and ScrollingFrame.CanvasPosition.X < XDelta - FIntBuildExperienceFTUXChipExhaustedThresholdPxModule then
				UseRefResult2.current = false
			end
		end)
		local Connection1 = if FFlagBuildFTUXChipInfiniteScrollModule then ScrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkExhaustion) else nil
		local Connection2 = if FFlagBuildFTUXChipInfiniteScrollModule then ScrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkExhaustion) else nil
		
		if FFlagBuildFTUXChipInfiniteScrollModule then
			checkExhaustion()
		end
		return function()
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			
			if Connection1 then
				Connection1:Disconnect()
			end
			if Connection2 then
				Connection2:Disconnect()
			end
		end
	end, { Frame.onExhausted, Frame.promptChips, Frame.isLoading })
	
	return UseRefResult
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), FFlagBuildExperienceFTUXChipExhaustedTelemetryModule (copy), FFlagBuildFTUXChipInfiniteScrollModule (copy), useChipExhaustionListener (copy), IconName (copy), ReactModule (copy), Skeleton (copy), Radius (copy), View (copy), FFlagBuildExperienceFTUXChipLoadInAnimationModule (copy), AnimatedChipGroupContainerModule (copy), ChipGroup (copy), ChipSize (copy), ChipGroupVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseChipExhaustionListenerResult = if FFlagBuildExperienceFTUXChipExhaustedTelemetryModule or FFlagBuildFTUXChipInfiniteScrollModule then useChipExhaustionListener(Frame) else nil
	local Chips = {}
	
	for i, promptChip in Frame.promptChips do
		local OnActivatedFunction = Frame.onActivated
		Chips[i] = {
			text = promptChip.value,
			leading = if promptChip.value == "2D" then IconName.SquareCheck elseif promptChip.value == "3D" then IconName.CubeVertexes else IconName.PlusLarge,
			onActivated = if OnActivatedFunction == nil then nil else function()
				-- upvalues: OnActivatedFunction (copy), promptChip (copy)
				OnActivatedFunction(promptChip)
			end
		}
	end
	local Elements = {}
	
	if Frame.isLoading and not FFlagBuildFTUXChipInfiniteScrollModule then
		for i1 = 1, 3 do
			Elements[`Skeleton{i1}`] = ReactModule.createElement(Skeleton, {
				LayoutOrder = i1,
				radius = Radius.Circle,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_800),
				testId = `PromptChipGroup.Skeleton{i1}`
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y padding-bottom-large padding-top-small clip",
		testId = "PromptChipGroup",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Content = if Frame.isLoading and not FFlagBuildFTUXChipInfiniteScrollModule then ReactModule.createElement(View, {
			tag = "row gap-small size-full-0 auto-y",
			testId = "PromptChipGroup.Skeletons"
		}, Elements) elseif (FFlagBuildExperienceFTUXChipLoadInAnimationModule or FFlagBuildFTUXChipInfiniteScrollModule) and (#Chips > 0 or Frame.isLoading) then ReactModule.createElement(AnimatedChipGroupContainerModule, {
			chips = Chips,
			chipGroupRef = UseChipExhaustionListenerResult,
			animateChips = FFlagBuildExperienceFTUXChipLoadInAnimationModule,
			skeletonCount = if Frame.isLoading then if FFlagBuildFTUXChipInfiniteScrollModule and #Chips > 0 then 1 else 3 else 0
		}) else ReactModule.createElement(ChipGroup, {
			testId = "PromptChipGroup.Chips",
			chips = Chips,
			size = ChipSize.Medium,
			variant = ChipGroupVariant.Row,
			ref = if FFlagBuildExperienceFTUXChipExhaustedTelemetryModule or FFlagBuildFTUXChipInfiniteScrollModule then UseChipExhaustionListenerResult else nil
		})
	})
end