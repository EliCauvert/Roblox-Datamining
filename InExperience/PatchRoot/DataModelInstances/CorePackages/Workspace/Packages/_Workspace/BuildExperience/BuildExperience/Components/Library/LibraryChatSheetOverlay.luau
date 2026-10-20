local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local GuiService = game:GetService("GuiService")
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(List, p1): boolean
	if #List ~= #p1 then
		return false
	end
	for i, value in List do
		if p1[i] ~= value then
			return false
		end
	end
	return true
end

local function useSheetBounds(p2, Frame: Frame, Frame1: Frame, Frame2: Frame, p3, Callback)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	local OnBoundsChangedFunction = p2.onBoundsChanged
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), Frame1 (copy), Frame2 (copy), Frame (copy), OnBoundsChangedFunction (copy), Callback (copy), UseTokensResult (copy), p3 (copy)
		if not p2.isOpen or Frame1 == nil or Frame2 == nil or Frame == nil then
			OnBoundsChangedFunction(nil, nil)
			Callback(nil)
			
			return nil
		end
		local function updateBounds()
			-- upvalues: Frame (upval), Frame1 (upval), OnBoundsChangedFunction (upval), Callback (upval), Frame2 (upval), UseTokensResult (upval), p3 (upval)
			local AbsolutePosition = Frame.AbsolutePosition
			
			if Frame1.AbsoluteSize.X < Frame.AbsoluteSize.X - 1 then
				OnBoundsChangedFunction(nil, if Frame1.AbsoluteSize.X > 0 then Frame1.AbsolutePosition.X else nil)
				local AbsolutePositionDelta = Frame1.AbsolutePosition - AbsolutePosition
				Callback({
					rect = Rect.new(AbsolutePositionDelta, AbsolutePositionDelta + Frame1.AbsoluteSize),
					areaSize = Frame.AbsoluteSize
				})
				
				return
			else
				local IsYAbove = Frame2.AbsoluteSize.Y > 0
				OnBoundsChangedFunction(if IsYAbove then Frame2.AbsolutePosition.Y - UseTokensResult.Padding.Medium else nil, nil)
				local YDelta = Frame.AbsoluteSize.Y - p3
				Callback(if IsYAbove then {
					rect = Rect.new(Vector2.new(0, (math.max(0, YDelta - UseTokensResult.Size.Size_800))), Frame.AbsoluteSize),
					areaSize = Frame.AbsoluteSize
				} else nil)
			end
		end
		
		updateBounds()
		local List = {}
		
		for _, Object in { Frame1, Frame2, Frame } do
			table.insert(List, Object:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateBounds))
			table.insert(List, Object:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateBounds))
		end
		return function()
			-- upvalues: List (copy), OnBoundsChangedFunction (upval), Callback (upval)
			for _, Connection in List do
				Connection:Disconnect()
			end
			OnBoundsChangedFunction(nil, nil)
			Callback(nil)
		end
	end, {
		p2.isOpen, Frame1, Frame2, Frame, p3, UseTokensResult, OnBoundsChangedFunction,
		Callback
	})
end

return function(p4)
	-- upvalues: FoundationModule (copy), ReactModule (copy), GuiService (copy), useSheetBounds (copy), ReactRobloxModule (copy)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseOverlayResult (copy), UseStateResult2 (copy), GuiService (upval)
		if UseOverlayResult == nil then
			return nil
		else
			local ScreenGui = UseOverlayResult:FindFirstAncestorWhichIsA("ScreenGui") or UseOverlayResult
			
			local function updateLayout()
				-- upvalues: UseStateResult2 (upval), UseOverlayResult (upval), ScreenGui (copy), GuiService (upval)
				UseStateResult2({
					originY = UseOverlayResult.AbsolutePosition.Y,
					screenHeight = ScreenGui.AbsoluteSize.Y,
					availableHeight = UseOverlayResult.AbsoluteSize.Y,
					isBottomSheet = GuiService.ViewportDisplaySize == Enum.DisplaySize.Small and ScreenGui.AbsoluteSize.X <= ScreenGui.AbsoluteSize.Y
				})
			end
			
			updateLayout()
			local Connections = {
				UseOverlayResult:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateLayout),
				UseOverlayResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateLayout),
				ScreenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateLayout),
				GuiService:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(updateLayout)
			}
			
			return function()
				-- upvalues: Connections (copy)
				for _, connection in Connections do
					connection:Disconnect()
				end
			end
		end
	end, { UseOverlayResult })
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(nil)
	local UseResult = ReactModule.useCallback(function(Sheet, Content)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2({ sheet = Sheet, content = Content })
	end, {})
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local Largest: number = if p4.top == nil or UseStateResult == nil then 0 else math.max(0, p4.top - UseStateResult.originY)
	local ScreenHeight = if UseStateResult == nil then 0 else UseStateResult.screenHeight
	local AvailableHeight = if UseStateResult == nil then 0 else UseStateResult.availableHeight
	local SnapPoints = p4.snapPoints
	
	if ScreenHeight > 0 then
		SnapPoints = {}
		
		for _, snapPoint in p4.snapPoints do
			table.insert(SnapPoints, (math.max(2, (math.min(snapPoint * ScreenHeight, AvailableHeight - Largest)))))
		end
	end
	local UseRefResult = ReactModule.useRef(SnapPoints)
	local Current = UseRefResult.current
	local SnapPoints1 = SnapPoints
	local Flag = nil
	
	if #Current == #SnapPoints1 then
		Flag = true
		
		for i, value in Current do
			if SnapPoints1[i] ~= value then
				Flag = false
				break
			end
		end
	else
		Flag = false
	end
	if not Flag then
		UseRefResult.current = SnapPoints
	end
	local Current1 = UseRefResult.current
	useSheetBounds(p4, UseStateResult4, UseStateResult3.sheet, UseStateResult3.content, UseStateResult5 or Current1[1], UseBindingResult2)
	local IsBottomSheet = UseStateResult ~= nil and UseStateResult.isBottomSheet
	local RenderSheetResult = p4.renderSheet(Current1, UseResult, UseStateResult2_4)
	local YOffset: number = if IsBottomSheet then 0 else Largest
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Inset = if UseOverlayResult == nil then nil else ReactRobloxModule.createPortal(ReactModule.createElement(FoundationModule.View, {
			ref = UseStateResult2_3,
			Position = UDim2.fromOffset(0, YOffset),
			Size = UDim2.new(1, 0, 1, -YOffset),
			backgroundStyle = { Transparency = 1 }
		}, {
			Window = ReactModule.createElement(FoundationModule.View, {
				tag = "clip",
				Position = UseBindingResult:map(function(p5): UDim2
					return if p5 then UDim2.fromOffset(p5.rect.Min.X, p5.rect.Min.Y) else UDim2.new()
				end),
				Size = UseBindingResult:map(function(p5): UDim2
					return if p5 then UDim2.fromOffset(p5.rect.Width, p5.rect.Height) else UDim2.fromScale(1, 1)
				end),
				backgroundStyle = { Transparency = 1 }
			}, {
				Host = ReactModule.createElement(FoundationModule.View, {
					testId = "Library.ChatOverlay",
					ref = UseStateResult2_1,
					Position = UseBindingResult:map(function(p5): UDim2
						return if p5 then UDim2.fromOffset(-p5.rect.Min.X, -p5.rect.Min.Y) else UDim2.new()
					end),
					Size = UseBindingResult:map(function(p5): UDim2
						return if p5 then UDim2.fromOffset(p5.areaSize.X, p5.areaSize.Y) else UDim2.fromScale(1, 1)
					end),
					backgroundStyle = { Transparency = 1 }
				})
			})
		}), UseOverlayResult),
		Sheet = if UseStateResult1 == nil then nil else ReactModule.createElement(FoundationModule.OverlayProvider, { gui = UseStateResult1 }, RenderSheetResult)
	})
end