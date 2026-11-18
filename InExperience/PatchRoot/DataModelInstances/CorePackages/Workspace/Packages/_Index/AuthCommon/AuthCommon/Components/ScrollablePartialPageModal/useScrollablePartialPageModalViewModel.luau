local Parent = script:FindFirstAncestor("AuthCommon").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UserInputService = game:GetService("UserInputService")
local _ = require(script.Parent.ScrollablePartialPageModalView)
local GetMaxMiddleHeightFunction = require(script.Parent.getMaxMiddleHeight).getMaxMiddleHeight

return function(Tbl)
	-- upvalues: ReactModule (copy), FoundationModule (copy), GetMaxMiddleHeightFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.Y)
	end, {})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseResult1 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(if Frame.AbsoluteSize.Y > 0 then Frame.AbsoluteSize.Y else nil)
	end, {})
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local config = {
		screenSize = Tbl.screenSize,
		buttonStackProps = Tbl.buttonStackProps
	}
	local MaxMiddleHeight = GetMaxMiddleHeightFunction(config, UseStateResult1)
	local Position = Tbl.position
	local IsYMatch: boolean = Position ~= nil and (Tbl.anchorPoint ~= nil and Tbl.anchorPoint.Y == 1)
	local NewScale = if Position and IsYMatch then Position.Y.Scale * (UseStateResult1 or Tbl.screenSize.Y) + Position.Y.Offset else UseStateResult1
	local Smallest = if UseStateResult == nil then nil else math.min(UseStateResult, GetMaxMiddleHeightFunction(config, NewScale))
	local IsSmallestBelow: boolean = Smallest ~= nil and (UseStateResult ~= nil and Smallest < UseStateResult)
	local OnMaxMiddleHeightChangedFunction = Tbl.onMaxMiddleHeightChanged
	ReactModule.useEffect(function()
		-- upvalues: OnMaxMiddleHeightChangedFunction (copy), MaxMiddleHeight (copy)
		if OnMaxMiddleHeightChangedFunction then
			OnMaxMiddleHeightChangedFunction(MaxMiddleHeight)
		end
	end, { MaxMiddleHeight, OnMaxMiddleHeightChangedFunction })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UserInputService (upval), IsYMatch (copy), IsSmallestBelow (copy), Smallest (copy), UseStateResult (copy)
		local Current = UseRefResult.current
		local Current1 = UseRefResult1.current
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		
		if not IsYMatch or not IsSmallestBelow or not Smallest or not UseStateResult then return end
		if not Current or not Current1 or not FocusedTextBox or not FocusedTextBox:IsDescendantOf(Current1) then return end
		local Frame = FocusedTextBox
		while Frame.Parent and (Frame.Parent ~= Current1 and Frame.Parent.Parent ~= Current1 and Frame.Parent:IsA("GuiObject")) do
			Frame = Frame.Parent
		end
		local YDelta = FocusedTextBox.AbsolutePosition.Y - Current1.AbsolutePosition.Y
		local NewYDelta = YDelta + FocusedTextBox.AbsoluteSize.Y
		local YDelta1 = Frame.AbsolutePosition.Y - Current1.AbsolutePosition.Y
		local NewYDelta1 = YDelta1 + Frame.AbsoluteSize.Y
		local Y = Current.CanvasPosition.Y
		
		if Y + Smallest < NewYDelta1 then
			Y = math.min(NewYDelta1 - Smallest, YDelta)
		elseif YDelta1 < Y then
			Y = math.max(YDelta1, NewYDelta - Smallest)
		end
		Current.CanvasPosition = Vector2.new(0, (math.clamp(Y, 0, UseStateResult - Smallest)))
	end, { IsYMatch, IsSmallestBelow, Smallest, UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.CanvasPosition = Vector2.zero
		end
	end, { Tbl.scrollResetKey or Tbl.title })
	local Copy = table.clone(Tbl)
	Copy.children = nil
	Copy.onMaxMiddleHeightChanged = nil
	Copy.scrollResetKey = nil
	
	return {
		modalProps = Copy,
		children = Tbl.children,
		visibleHeight = Smallest,
		contentHeight = UseStateResult,
		isCapped = IsSmallestBelow,
		scrollBarThickness = UseTokensResult.Size.Size_150,
		scrollBarColor = UseTokensResult.Color.Shift.Shift_400.Color3,
		scrollBarTransparency = UseTokensResult.Color.Shift.Shift_400.Transparency,
		scrollingFrameRef = UseRefResult,
		contentRef = UseRefResult1,
		onHostSizeChanged = UseResult1,
		onContentSizeChanged = UseResult
	}
end