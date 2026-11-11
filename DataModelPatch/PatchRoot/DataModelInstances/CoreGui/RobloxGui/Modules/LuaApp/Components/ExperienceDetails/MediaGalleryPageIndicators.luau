local CorePackages = game:GetService("CorePackages")
local OtterModule = require(CorePackages.Packages.Otter)
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.ReactOtter)
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount = game:DefineFastInt("LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount", 5)

local function _(p1: number, p2: number): number
	-- upvalues: LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount (copy)
	return if LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount < p1 then math.max(1, math.min(p2, p1 - 2) - LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount + 2 + 1) else 1
end

local _ = function(p1, p2: number): number
	-- upvalues: LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount (copy)
	return if LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount < p1 then math.min(p1 - LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount + 1, math.max(p2, 3) - 2) else 1
end

local function getDotAnchorPointAtIndex(LayoutOrder, p1, LayoutOrder1): Vector2
	if LayoutOrder1 < p1 then
		if LayoutOrder == p1 then
			return Vector2.new(1, 0.5)
		elseif LayoutOrder == LayoutOrder1 then
			return Vector2.new(0, 0.5)
		end
	elseif p1 < LayoutOrder1 then
		if LayoutOrder == p1 then
			return Vector2.new(0, 0.5)
		elseif LayoutOrder == LayoutOrder1 then
			return Vector2.new(1, 0.5)
		end
	end
	return Vector2.new(0.5, 0.5)
end

local function getDotPositionAtIndex(LayoutOrder, p1, LayoutOrder1): UDim2
	if LayoutOrder1 < p1 then
		if LayoutOrder == p1 then
			return UDim2.fromScale(1, 0.5)
		elseif LayoutOrder == LayoutOrder1 then
			return UDim2.fromScale(0, 0.5)
		end
	elseif p1 < LayoutOrder1 then
		if LayoutOrder == p1 then
			return UDim2.fromScale(0, 0.5)
		elseif LayoutOrder == LayoutOrder1 then
			return UDim2.fromScale(1, 0.5)
		end
	end
	return UDim2.fromScale(0.5, 0.5)
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), ReactModule (copy), LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount (copy), OtterModule (copy), getDotAnchorPointAtIndex (copy), getDotPositionAtIndex (copy)
	local UseTokensResult = UseTokensFunction()
	local Size100 = UseTokensResult.Size.Size_100
	local Size150 = UseTokensResult.Size.Size_150
	local Size200 = UseTokensResult.Size.Size_200
	local Size800 = UseTokensResult.Size.Size_800
	local Small = UseTokensResult.Padding.Small
	local Muted = UseTokensResult.DarkMode.Content.Muted
	local Emphasis = if FFlagLuaAppEdpMediaGalleryAutoAdvance then UseTokensResult.DarkMode.Content.Emphasis else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(Frame.mediaGalleryStartIndex)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Frame.mediaGalleryStartIndex)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(1)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseRefResult = ReactModule.useRef({})
	local Smallest = math.min(Frame.numberOfItems, LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Smallest (copy), Size200 (copy), Small (copy), Size800 (copy)
		return (Smallest - 1) * (Size200 + Small) + Size800
	end, { Smallest, Size200, Small, Size800 })
	local UseResult = ReactModule.useCallback(function(p1: number): Vector2
		-- upvalues: Size200 (copy), Small (copy)
		return Vector2.new((p1 - 1) * (Size200 + Small), 0)
	end, { Size200, Small })
	local UseResult1 = ReactModule.useCallback(function(Smallest1): UDim2
		-- upvalues: UseStateResult3 (copy), Smallest (copy), Frame (copy), UseStateResult (copy), Size800 (copy), Size200 (copy), Size100 (copy), Size150 (copy)
		local Smallest2 = math.min(UseStateResult3 + Smallest - 1, Frame.numberOfItems)
		local IsUseStateResultAbove = UseStateResult3 > 1
		local IsSmallestBelow = Smallest2 < Frame.numberOfItems
		
		if Smallest1 == UseStateResult then
			return UDim2.fromOffset(Size800, Size200)
		elseif IsUseStateResultAbove then
			if Smallest1 < UseStateResult3 then
				return UDim2.fromOffset(0, 0)
			elseif Smallest1 == UseStateResult3 then
				return UDim2.fromOffset(Size100, Size100)
			elseif Smallest1 == UseStateResult3 + 1 then
				return UDim2.fromOffset(Size150, Size150)
			end
		end
		if IsSmallestBelow then
			if Smallest2 < Smallest1 then
				return UDim2.fromOffset(0, 0)
			elseif Smallest1 == Smallest2 then
				return UDim2.fromOffset(Size100, Size100)
			elseif Smallest1 == Smallest2 - 1 then
				return UDim2.fromOffset(Size150, Size150)
			end
		end
		return UDim2.fromOffset(Size200, Size200)
	end, {
		Frame.numberOfItems, Smallest, UseStateResult3, UseStateResult, Size100,
		Size150, Size200, Size800
	})
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount (upval), UseBindingResult2 (copy), UseResult (copy), UseStateResult2_2 (copy), UseBindingResult2_1 (copy), UseStateResult2 (copy)
		local NumberOfItems: number = Frame.numberOfItems
		local MediaGalleryStartIndex: number = Frame.mediaGalleryStartIndex
		local Largest: number = if LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount < NumberOfItems then math.max(1, math.min(MediaGalleryStartIndex, NumberOfItems - 2) - LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount + 2 + 1) else 1
		UseBindingResult2(UseResult(Largest))
		UseStateResult2_2(Largest)
		UseBindingResult2_1(1)
		UseStateResult2(Frame.mediaGalleryStartIndex)
	end, {
		Frame.numberOfItems,
		Frame.mediaGalleryStartIndex,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), Frame (copy), LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount (upval), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		local function _(p1)
			-- upvalues: UseStateResult2 (upval), Frame (upval), LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval)
			UseStateResult2(function(p2): number
				-- upvalues: p1 (copy), Frame (upval), LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval)
				local Largest = nil
				if p2 < p1 then
					local NumberOfItems: number = Frame.numberOfItems
					Largest = if LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount < NumberOfItems then math.max(1, math.min(p1, NumberOfItems - 2) - LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount + 2 + 1) else 1
				else
					local NumberOfItems = Frame.numberOfItems
					Largest = if LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount < NumberOfItems then math.min(NumberOfItems - LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount + 1, math.max(p1, 3) - 2) else 1
				end
				UseStateResult2_1(p2)
				UseStateResult2_2(Largest)
				UseStateResult2_3(true)
				
				return p1
			end)
		end
		
		local MediaGalleryScrolledSignalConnection = Frame.mediaGalleryScrolledSignal:connect(function(p1)
			-- upvalues: UseStateResult2 (upval), Frame (upval), LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval)
			UseStateResult2(function(p2): number
				-- upvalues: p1 (copy), Frame (upval), LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval)
				local Largest = nil
				if p2 < p1 then
					local NumberOfItems: number = Frame.numberOfItems
					Largest = if LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount < NumberOfItems then math.max(1, math.min(p1, NumberOfItems - 2) - LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount + 2 + 1) else 1
				else
					local NumberOfItems = Frame.numberOfItems
					Largest = if LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount < NumberOfItems then math.min(NumberOfItems - LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount + 1, math.max(p1, 3) - 2) else 1
				end
				UseStateResult2_1(p2)
				UseStateResult2_2(Largest)
				UseStateResult2_3(true)
				
				return p1
			end)
		end)
		
		return function()
			-- upvalues: MediaGalleryScrolledSignalConnection (ref)
			if MediaGalleryScrolledSignalConnection ~= nil then
				MediaGalleryScrolledSignalConnection:disconnect()
				MediaGalleryScrolledSignalConnection = nil
			end
		end
	end, { Frame.numberOfItems, Frame.mediaGalleryScrolledSignal })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult4 (copy), OtterModule (upval), Frame (copy), UseBindingResult (copy), UseResult (copy), UseStateResult3 (copy), UseBindingResult2_1 (copy), UseBindingResult2 (copy), UseStateResult2_3 (copy)
		if not UseStateResult4 then return end
		local SingleMotor = OtterModule.createSingleMotor(0)
		SingleMotor:setGoal(if Frame.useSpring then OtterModule.spring(1, Frame.springConfig) else OtterModule.instant(1))
		local Value = UseBindingResult:getValue()
		local UseResultResult = UseResult(UseStateResult3)
		SingleMotor:onStep(function(Alpha)
			-- upvalues: UseBindingResult2_1 (upval), UseBindingResult2 (upval), Value (copy), UseResultResult (copy)
			UseBindingResult2_1(Alpha)
			UseBindingResult2(Value:Lerp(UseResultResult, Alpha))
		end)
		SingleMotor:onComplete(function()
			-- upvalues: UseStateResult2_3 (upval)
			UseStateResult2_3(false)
		end)
		
		return function()
			-- upvalues: SingleMotor (copy)
			SingleMotor:destroy()
		end
	end, {
		Frame.useSpring, Frame.springConfig, UseStateResult4, UseStateResult3,
		UseBindingResult, UseResult
	})
	
	return ReactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ScrollingEnabled = false,
		ScrollBarThickness = 0,
		Selectable = false,
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		Size = UDim2.fromOffset(UseMemoResult, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ZIndex = Frame.ZIndex,
		ScrollingDirection = Enum.ScrollingDirection.X,
		CanvasSize = UDim2.fromOffset(0, Size200),
		AutomaticCanvasSize = Enum.AutomaticSize.X,
		CanvasPosition = UseBindingResult
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, Small),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Items = ReactModule.createElement(ReactModule.Fragment, {}, (ReactModule.useMemo(function()
			-- upvalues: Frame (copy), UseRefResult (copy), UseResult1 (copy), ReactModule (upval), UseStateResult (copy), Size800 (copy), Size200 (copy), getDotAnchorPointAtIndex (upval), UseStateResult1 (copy), getDotPositionAtIndex (upval), UseBindingResult1 (copy), Muted (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), Emphasis (copy)
			local Frames = {}
			
			for i = 1, Frame.numberOfItems do
				local CurrentEntry = UseRefResult.current[i]
				local UseResultResult = UseResult1(i)
				Frames["Indicator" .. i] = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(if i == UseStateResult then Size800 else Size200, Size200),
					LayoutOrder = i
				}, {
					Dot = ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						AnchorPoint = getDotAnchorPointAtIndex(i, UseStateResult1, UseStateResult),
						Position = getDotPositionAtIndex(i, UseStateResult1, UseStateResult),
						Size = UseBindingResult1:map(function(Alpha)
							-- upvalues: CurrentEntry (copy), UseResultResult (copy)
							return if CurrentEntry == nil then UseResultResult else CurrentEntry:Lerp(UseResultResult, Alpha)
						end),
						BackgroundColor3 = Muted.Color3,
						BackgroundTransparency = Muted.Transparency
					}, {
						UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
						ProgressBar = if FFlagLuaAppEdpMediaGalleryAutoAdvance and i == UseStateResult and Frame.currentItemProgressBinding then ReactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = Frame.currentItemProgressBinding:map(function(p1): UDim2
								-- upvalues: Size200 (upval), Size800 (upval)
								return UDim2.fromOffset(Size200 + p1 * (Size800 - Size200), Size200)
							end),
							BackgroundColor3 = Emphasis.Color3,
							BackgroundTransparency = Emphasis.Transparency
						}, {
							UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
						}) else nil
					})
				})
				UseRefResult.current[i] = UseResultResult
			end
			return Frames
		end, {
			Frame.numberOfItems,
			if FFlagLuaAppEdpMediaGalleryAutoAdvance then Frame.currentItemProgressBinding else nil,
			UseStateResult1, UseStateResult, UseResult1, Size200, Size800, Muted,
			if FFlagLuaAppEdpMediaGalleryAutoAdvance then Emphasis else nil,
			UseBindingResult1
		})))
	})
end