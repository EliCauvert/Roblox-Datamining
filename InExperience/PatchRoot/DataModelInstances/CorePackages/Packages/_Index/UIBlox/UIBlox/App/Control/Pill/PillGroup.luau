local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local Parent4 = Parent3.Parent
local CryoModule = require(Parent4.Cryo)
local ReactModule = require(Parent4.React)
local RoactGamepadModule = require(Parent4.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local FitFrameModule = require(Parent4.FitFrame)
local FitFrameHorizontal = FitFrameModule.FitFrameHorizontal
local IconSizeModule = require(Parent2.ImageSet.Enum.IconSize)
local ImagesModule = require(Parent2.ImageSet.Images)
local UseStyleModule = require(Parent3.Core.Style.useStyle)
local IconButtonModule = require(Parent3.App.Button.IconButton)
local UseIsGamepadModule = require(Parent3.Utility.useIsGamepad)
local ScrollingListWithArrowsAndGradientModule = require(Parent1.HorizontalNav.ScrollingListWithArrowsAndGradient)
local Pillv2Module = require(Parent.Pillv2)

local function PillGroup(Gui) --[[ Line: 60 ]]
	-- upvalues: UseIsGamepadModule (copy), ReactModule (copy), UseStyleModule (copy), RoactGamepadModule (copy), CryoModule (copy), IconButtonModule (copy), IconSizeModule (copy), ImagesModule (copy), Focusable (copy), Pillv2Module (copy), FitFrameHorizontal (copy), FitFrameModule (copy), ScrollingListWithArrowsAndGradientModule (copy)
	local NoIsRoactGamepadEnabled = Gui.isRoactGamepadEnabled == nil or Gui.isRoactGamepadEnabled
	local NoIsRoactGamepadEnabled1 = UseIsGamepadModule() and NoIsRoactGamepadEnabled
	local UseRefResult = ReactModule.useRef(nil)
	
	local function _() --[[ Line: 66 | Named "scrollToStart" ]]
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current:ScrollToTop()
		end
	end
	
	local LeftPadding = Gui.leftPadding or 15
	local RightPadding = Gui.rightPadding or 15
	local SelectedPills = Gui.selectedPills or {}
	local Theme = UseStyleModule().Theme
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 81 ]]
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current.CanvasSize = UDim2.new(0, Frame.AbsoluteSize.X, 1, 0)
		end
	end)
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefCacheResult = NoIsRoactGamepadEnabled and RoactGamepadModule.useRefCache() or UseRefResult1.current
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 90 ]]
		-- upvalues: Gui (copy)
		if Gui.onSelectionChanged then
			Gui.onSelectionChanged({})
		end
	end)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 96 ]]
		-- upvalues: Gui (copy), CryoModule (upval), SelectedPills (copy)
		local List = {}
		
		for _, pill in Gui.pills do
			if not CryoModule.List.find(SelectedPills, pill) then
				table.insert(List, pill)
			end
		end
		return CryoModule.List.join(SelectedPills, List)
	end, { Gui.pills, SelectedPills })
	local v1 = #SelectedPills > 1
	local Elements = {
		ClearButton = v1 and ReactModule.createElement(IconButtonModule, {
			layoutOrder = 1,
			key = "0",
			size = UDim2.fromOffset(24, 24),
			iconSize = IconSizeModule.Medium,
			icon = ImagesModule["icons/actions/reject"],
			onActivated = UseResult1,
			buttonRef = UseRefCacheResult[0],
			NextSelectionRight = UseRefCacheResult[1]
		}) or nil
	}
	local IsLoading = Gui.isLoading
	
	for i, Text in UseMemoResult do
		local function onActivated() --[[ Line: 124 ]]
			-- upvalues: CryoModule (upval), SelectedPills (copy), Text (copy), UseRefResult (copy), Gui (copy)
			local HasFindResult = CryoModule.List.find(SelectedPills, Text) ~= nil
			local RemoveValueResult = if HasFindResult then CryoModule.List.removeValue(SelectedPills, Text) else CryoModule.List.join(SelectedPills, { Text })
			
			if not HasFindResult then
				local Current = UseRefResult.current
				
				if Current then
					Current:ScrollToTop()
				end
			end
			if Gui.onSelectionChanged then
				Gui.onSelectionChanged(RemoveValueResult)
			end
		end
		
		local IsSelected = i <= #SelectedPills
		
		if IsSelected then
			IsLoading = false
		end
		if not NoIsRoactGamepadEnabled then
			UseRefCacheResult[i] = UseRefCacheResult[i] or ReactModule.createRef()
		end
		Elements[i] = ReactModule.createElement(if NoIsRoactGamepadEnabled then Focusable[Pillv2Module] else Pillv2Module, {
			layoutOrder = i + 1,
			key = tostring(i),
			text = Text,
			isSelected = IsSelected,
			isLoading = Gui.isLoading and not IsSelected,
			onActivated = onActivated,
			ref = UseRefCacheResult[i],
			NextSelectionLeft = if i > 1 or v1 then UseRefCacheResult[i - 1] else nil,
			NextSelectionRight = if i < #UseMemoResult then UseRefCacheResult[i + 1] else nil
		})
	end
	if IsLoading and NoIsRoactGamepadEnabled1 and NoIsRoactGamepadEnabled then
		Elements[1] = ReactModule.createElement(Focusable[Pillv2Module], {
			layoutOrder = 2,
			key = "1",
			text = "",
			ref = UseRefCacheResult[1]
		})
	end
	local function getScrollingListChildren() --[[ Line: 176 ]]
		-- upvalues: ReactModule (upval), FitFrameHorizontal (upval), FitFrameModule (upval), RightPadding (copy), LeftPadding (copy), UseResult (copy), Elements (copy)
		return {
			SubNavFrame = ReactModule.createElement(FitFrameHorizontal, {
				height = UDim.new(1, 0),
				contentPadding = UDim.new(0, 8),
				margin = FitFrameModule.Rect.quad(0, RightPadding, 0, LeftPadding),
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				BackgroundTransparency = 1,
				[ReactModule.Change.AbsoluteSize] = UseResult
			}, Elements)
		}
	end
	
	local ButtonRefs = {}
	
	for i1 = 1, #UseMemoResult do
		ButtonRefs[i1] = UseRefCacheResult[i1]
	end
	return ReactModule.createElement(if NoIsRoactGamepadEnabled then Focusable.Frame else "Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 52),
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency,
		LayoutOrder = Gui.layoutOrder,
		ref = Gui.forwardRef,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown,
		defaultChild = if NoIsRoactGamepadEnabled then UseRefCacheResult[1] else nil
	}, {
		ScrollingList = ReactModule.createElement(ScrollingListWithArrowsAndGradientModule, {
			listHeight = 52,
			buttonPadding = 8,
			padOutsideEdges = false,
			hideGradient = true,
			getScollingListContent = getScrollingListChildren,
			scrollingFrameRef = UseRefResult,
			buttonRefs = ButtonRefs
		})
	})
end

return ReactModule.forwardRef(function(p1, ForwardRef) --[[ Line: 221 ]]
	-- upvalues: ReactModule (copy), PillGroup (copy), CryoModule (copy)
	return ReactModule.createElement(PillGroup, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)