local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local parent_4 = parent_3.Parent
local cryoModule = require(parent_4.Cryo)
local reactModule = require(parent_4.React)
local roactGamepadModule = require(parent_4.RoactGamepad)
local focusable = roactGamepadModule.Focusable
local fitFrameModule = require(parent_4.FitFrame)
local fitFrameHorizontal = fitFrameModule.FitFrameHorizontal
local iconSizeModule = require(parent_2.ImageSet.Enum.IconSize)
local imagesModule = require(parent_2.ImageSet.Images)
local useStyleModule = require(parent_3.Core.Style.useStyle)
local iconButtonModule = require(parent_3.App.Button.IconButton)
local useIsGamepadModule = require(parent_3.Utility.useIsGamepad)
local scrollingListWithArrowsAndGradientModule = require(parent_1.HorizontalNav.ScrollingListWithArrowsAndGradient)
local pillv2Module = require(parent.Pillv2)

local function PillGroup(p0)
	-- upvalues: useIsGamepadModule (ref), reactModule (ref), useStyleModule (ref), roactGamepadModule (ref), cryoModule (ref), iconButtonModule (ref), iconSizeModule (ref), imagesModule (ref), focusable (ref), pillv2Module (ref), fitFrameHorizontal (ref), fitFrameModule (ref), scrollingListWithArrowsAndGradientModule (ref)
	local var12 = p0.isRoactGamepadEnabled ~= nil or p0.isRoactGamepadEnabled
	local var12_1 = useIsGamepadModule() and var12
	local var14 = reactModule.useRef(nil)
	
	local function _()
		-- upvalues: var14 (ref)
		local current = var14.current
		
		if current then
			current:ScrollToTop()
		end
	end
	
	local leftPadding = p0.leftPadding or 15
	local rightPadding = p0.rightPadding or 15
	local selectedPills = p0.selectedPills or {}
	local theme = useStyleModule().Theme
	local var18 = reactModule.useCallback(function(p1)
		-- upvalues: var14 (ref)
		if var14.current then
			var14.current.CanvasSize = UDim2.new(0, p1.AbsoluteSize.X, 1, 0)
		end
	end)
	local var19 = var12 and roactGamepadModule.useRefCache() or reactModule.useRef({}).current
	local var20 = reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		if p0.onSelectionChanged then
			p0.onSelectionChanged({})
		end
	end)
	local var21 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), cryoModule (copy), selectedPills (ref)
		local t = {}
		
		for i, v in p0.pills do
			if not cryoModule.List.find(selectedPills, v) then
				table.insert(t, v)
			end
		end
		return cryoModule.List.join(selectedPills, t)
	end, { p0.pills, selectedPills })
	local var22 = #selectedPills > 1
	local t = {
		ClearButton = var22 and reactModule.createElement(iconButtonModule, {
			layoutOrder = 1,
			key = "0",
			size = UDim2.fromOffset(24, 24),
			iconSize = iconSizeModule.Medium,
			icon = imagesModule["icons/actions/reject"],
			onActivated = var20,
			buttonRef = var19[0],
			NextSelectionRight = var19[1]
		}) or nil
	}
	local isLoading = p0.isLoading
	
	for i, v in var21 do
		local function onActivated()
			-- upvalues: cryoModule (copy), selectedPills (ref), v (ref), var14 (ref), p0 (ref)
			local var29 = cryoModule.List.find(selectedPills, v) ~= nil
			local var30 = if var29 then cryoModule.List.removeValue(selectedPills, v) else cryoModule.List.join(selectedPills, { v })
			
			if not var29 then
				local current = var14.current
				
				if current then
					current:ScrollToTop()
				end
			end
			if p0.onSelectionChanged then
				p0.onSelectionChanged(var30)
			end
		end
		
		local var27 = i <= #selectedPills
		
		if var27 then
			isLoading = false
		end
		if not var12 then
			var19[i] = var19[i] or reactModule.createRef()
		end
		t[i] = reactModule.createElement(if var12 then focusable[pillv2Module] else pillv2Module, {
			layoutOrder = i + 1,
			key = tostring(i),
			text = v,
			isSelected = var27,
			isLoading = p0.isLoading and not var27,
			onActivated = onActivated,
			ref = var19[i],
			NextSelectionLeft = if i > 1 or var22 then var19[i - 1] else nil,
			NextSelectionRight = if i < #var21 then var19[i + 1] else nil
		})
	end
	if isLoading and var12_1 and var12 then
		t[1] = reactModule.createElement(focusable[pillv2Module], { layoutOrder = 2, key = "1", text = "", ref = var19[1] })
	end
	local function getScrollingListChildren()
		-- upvalues: reactModule (copy), fitFrameHorizontal (copy), fitFrameModule (copy), rightPadding (ref), leftPadding (ref), var18 (ref), t (ref)
		return {
			SubNavFrame = reactModule.createElement(fitFrameHorizontal, {
				height = UDim.new(1, 0),
				contentPadding = UDim.new(0, 8),
				margin = fitFrameModule.Rect.quad(0, rightPadding, 0, leftPadding),
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				BackgroundTransparency = 1,
				[reactModule.Change.AbsoluteSize] = var18
			}, t)
		}
	end
	
	local t_1 = {}
	
	for i_1 = 1, #var21 do
		t_1[i_1] = var19[i_1]
	end
	return reactModule.createElement(if var12 then focusable.Frame else "Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 52),
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = theme.BackgroundDefault.Transparency,
		LayoutOrder = p0.layoutOrder,
		ref = p0.forwardRef,
		NextSelectionUp = p0.NextSelectionUp,
		NextSelectionDown = p0.NextSelectionDown,
		defaultChild = if var12 then var19[1] else nil
	}, {
		ScrollingList = reactModule.createElement(scrollingListWithArrowsAndGradientModule, {
			listHeight = 52,
			buttonPadding = 8,
			padOutsideEdges = false,
			hideGradient = true,
			getScollingListContent = getScrollingListChildren,
			scrollingFrameRef = var14,
			buttonRefs = t_1
		})
	})
end

return reactModule.forwardRef(function(p2, p3)
	-- upvalues: reactModule (ref), PillGroup (ref), cryoModule (ref)
	return reactModule.createElement(PillGroup, cryoModule.Dictionary.join(p2, { forwardRef = p3 }))
end)