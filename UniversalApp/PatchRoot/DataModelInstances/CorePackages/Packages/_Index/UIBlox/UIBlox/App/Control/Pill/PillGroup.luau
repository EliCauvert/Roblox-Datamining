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

local function PillGroup(p1)
	-- upvalues: useIsGamepadModule (ref), reactModule (ref), useStyleModule (ref), roactGamepadModule (ref), cryoModule (ref), iconButtonModule (ref), iconSizeModule (ref), imagesModule (ref), focusable (ref), pillv2Module (ref), fitFrameHorizontal (ref), fitFrameModule (ref), scrollingListWithArrowsAndGradientModule (ref)
	local var1 = p1.isRoactGamepadEnabled ~= nil or p1.isRoactGamepadEnabled
	local var2 = useIsGamepadModule() and var1
	local var3 = reactModule.useRef(nil)
	
	local function _()
		-- upvalues: var3 (ref)
		local current = var3.current
		
		if current then
			current:ScrollToTop()
		end
	end
	
	local leftPadding = p1.leftPadding or 15
	local rightPadding = p1.rightPadding or 15
	local selectedPills = p1.selectedPills or {}
	local theme = useStyleModule().Theme
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		if var3.current then
			var3.current.CanvasSize = UDim2.new(0, p2.AbsoluteSize.X, 1, 0)
		end
	end)
	local var5 = var1 and roactGamepadModule.useRefCache() or reactModule.useRef({}).current
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onSelectionChanged then
			p1.onSelectionChanged({})
		end
	end)
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), cryoModule (copy), selectedPills (ref)
		local t = {}
		
		for i, v in p1.pills do
			if not cryoModule.List.find(selectedPills, v) then
				table.insert(t, v)
			end
		end
		return cryoModule.List.join(selectedPills, t)
	end, { p1.pills, selectedPills })
	local var8 = #selectedPills > 1
	local t = {
		ClearButton = var8 and reactModule.createElement(iconButtonModule, {
			layoutOrder = 1,
			key = "0",
			size = UDim2.fromOffset(24, 24),
			iconSize = iconSizeModule.Medium,
			icon = imagesModule["icons/actions/reject"],
			onActivated = var6,
			buttonRef = var5[0],
			NextSelectionRight = var5[1]
		}) or nil
	}
	local isLoading = p1.isLoading
	
	for i, v in var7 do
		local function onActivated()
			-- upvalues: cryoModule (copy), selectedPills (ref), v (ref), var3 (ref), p1 (ref)
			local var9 = cryoModule.List.find(selectedPills, v) ~= nil
			local var10 = if var9 then cryoModule.List.removeValue(selectedPills, v) else cryoModule.List.join(selectedPills, { v })
			
			if not var9 then
				local current = var3.current
				
				if current then
					current:ScrollToTop()
				end
			end
			if p1.onSelectionChanged then
				p1.onSelectionChanged(var10)
			end
		end
		
		local var9 = i <= #selectedPills
		
		if var9 then
			isLoading = false
		end
		if not var1 then
			var5[i] = var5[i] or reactModule.createRef()
		end
		t[i] = reactModule.createElement(if var1 then focusable[pillv2Module] else pillv2Module, {
			layoutOrder = i + 1,
			key = tostring(i),
			text = v,
			isSelected = var9,
			isLoading = p1.isLoading and not var9,
			onActivated = onActivated,
			ref = var5[i],
			NextSelectionLeft = if i > 1 or var8 then var5[i - 1] else nil,
			NextSelectionRight = if i < #var7 then var5[i + 1] else nil
		})
	end
	if isLoading and var2 and var1 then
		t[1] = reactModule.createElement(focusable[pillv2Module], { layoutOrder = 2, key = "1", text = "", ref = var5[1] })
	end
	local function getScrollingListChildren()
		-- upvalues: reactModule (copy), fitFrameHorizontal (copy), fitFrameModule (copy), rightPadding (ref), leftPadding (ref), var4 (ref), t (ref)
		return {
			SubNavFrame = reactModule.createElement(fitFrameHorizontal, {
				height = UDim.new(1, 0),
				contentPadding = UDim.new(0, 8),
				margin = fitFrameModule.Rect.quad(0, rightPadding, 0, leftPadding),
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				BackgroundTransparency = 1,
				[reactModule.Change.AbsoluteSize] = var4
			}, t)
		}
	end
	
	local t_1 = {}
	
	for i_1 = 1, #var7 do
		t_1[i_1] = var5[i_1]
	end
	return reactModule.createElement(if var1 then focusable.Frame else "Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 52),
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = theme.BackgroundDefault.Transparency,
		LayoutOrder = p1.layoutOrder,
		ref = p1.forwardRef,
		NextSelectionUp = p1.NextSelectionUp,
		NextSelectionDown = p1.NextSelectionDown,
		defaultChild = if var1 then var5[1] else nil
	}, {
		ScrollingList = reactModule.createElement(scrollingListWithArrowsAndGradientModule, {
			listHeight = 52,
			buttonPadding = 8,
			padOutsideEdges = false,
			hideGradient = true,
			getScollingListContent = getScrollingListChildren,
			scrollingFrameRef = var3,
			buttonRefs = t_1
		})
	})
end

return reactModule.forwardRef(function(p2, p3)
	-- upvalues: reactModule (ref), PillGroup (ref), cryoModule (ref)
	return reactModule.createElement(PillGroup, cryoModule.Dictionary.join(p2, { forwardRef = p3 }))
end)