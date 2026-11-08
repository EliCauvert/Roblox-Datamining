local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceFTUXChipExhaustedTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceFTUXChipExhaustedTelemetry)
local FIntBuildExperienceFTUXChipExhaustedThresholdPxModule = require(BuildExperience.Flags.FIntBuildExperienceFTUXChipExhaustedThresholdPx)
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
	-- upvalues: ReactModule (copy), FIntBuildExperienceFTUXChipExhaustedThresholdPxModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = false
	end, { Frame.promptChips })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseRefResult (copy), FIntBuildExperienceFTUXChipExhaustedThresholdPxModule (upval), UseRefResult1 (copy)
		if Frame.onExhausted == nil then return end
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local ScrollingFrame = Current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if ScrollingFrame == nil then return end
		local Connection = ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			-- upvalues: ScrollingFrame (copy), FIntBuildExperienceFTUXChipExhaustedThresholdPxModule (upval), UseRefResult1 (upval), Frame (upval)
			local XDelta = ScrollingFrame.AbsoluteCanvasSize.X - ScrollingFrame.AbsoluteWindowSize.X
			
			if XDelta > 0 and XDelta - FIntBuildExperienceFTUXChipExhaustedThresholdPxModule <= ScrollingFrame.CanvasPosition.X and not UseRefResult1.current then
				UseRefResult1.current = true
				Frame.onExhausted()
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { Frame.onExhausted, Frame.promptChips, Frame.isLoading })
	
	return UseRefResult
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), FFlagBuildExperienceFTUXChipExhaustedTelemetryModule (copy), useChipExhaustionListener (copy), IconName (copy), ReactModule (copy), Skeleton (copy), Radius (copy), View (copy), ChipGroup (copy), ChipSize (copy), ChipGroupVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseChipExhaustionListenerResult = if FFlagBuildExperienceFTUXChipExhaustedTelemetryModule then useChipExhaustionListener(Frame) else nil
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
	
	for i1 = 1, 3 do
		Elements[`Skeleton{i1}`] = ReactModule.createElement(Skeleton, {
			LayoutOrder = i1,
			radius = Radius.Circle,
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_800),
			testId = `PromptChipGroup.Skeleton{i1}`
		})
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y padding-bottom-large padding-top-small clip",
		testId = "PromptChipGroup",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Content = if Frame.isLoading then ReactModule.createElement(View, {
			tag = "row gap-small size-full-0 auto-y",
			testId = "PromptChipGroup.Skeletons"
		}, Elements) else ReactModule.createElement(ChipGroup, {
			testId = "PromptChipGroup.Chips",
			chips = Chips,
			size = ChipSize.Medium,
			variant = ChipGroupVariant.Row,
			ref = if FFlagBuildExperienceFTUXChipExhaustedTelemetryModule then UseChipExhaustionListenerResult else nil
		})
	})
end