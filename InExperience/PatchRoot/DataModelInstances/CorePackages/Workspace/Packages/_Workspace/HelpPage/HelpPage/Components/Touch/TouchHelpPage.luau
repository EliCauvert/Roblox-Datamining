local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local UseKeybindsModule = require(Parent.Hooks.useKeybinds)
local TouchControlsEnumModule = require(Parent.Enums.TouchControlsEnum)
local TouchActionModule = require(Parent.Components.Touch.TouchAction)
local DisplayModule = require(Parent1.Display)
local ConstantsModule = require(Parent.Constants)
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDeviceOrientationFunction = require(Parent1.RobloxAppHooks).useDeviceOrientation
local DeviceOrientationMode = require(Parent1.RobloxAppEnums).DeviceOrientationMode
local TouchHelpPageResponsiveUnits = game:DefineFastFlag("TouchHelpPageResponsiveUnits", false)

local function _(p1, p2, p3) --[[ Line: 26 | Named "getTapOrRotate" ]]
	assert(not (p3[p1] and p3[p2]), "Cannot assign a position to both tap and rotate simultaneously.")
	
	return if p3[p1] then p1 elseif p3[p2] then p2 else nil
end

local MemoResult = ReactModule.memo(function(p1) --[[ Line: 62 ]]
	-- upvalues: UseTokensFunction (copy), DeviceOrientationMode (copy), ReactModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local Components = p1.components
	local IsOrientationMatch = p1.orientation == DeviceOrientationMode.Portrait
	
	local function createSideColumn(Center, LayoutOrder, TopComponent, BottomComponent) --[[ Line: 68 ]]
		-- upvalues: ReactModule (upval), View (upval)
		return ReactModule.createElement(View, {
			tag = `align-x-{Center} auto-x col flex-y-between size-0-full`,
			LayoutOrder = LayoutOrder
		}, {
			topComponent = TopComponent,
			bottomComponent = BottomComponent
		})
	end
	
	local SideColumn = createSideColumn(if IsOrientationMatch then "center" else "left", 1, Components.topLeftComponent, Components.bottomLeftComponent)
	local SideColumn1 = createSideColumn(if IsOrientationMatch then "center" else "right", 3, Components.topRightComponent, Components.bottomRightComponent)
	
	return if IsOrientationMatch then ReactModule.createElement(View, { tag = "auto-y flex-x-between row size-full-0" }, {
		Inner = ReactModule.createElement(View, {
			tag = "col flex-y-fill padding-y-large padding-x-xxlarge size-full",
			LayoutOrder = 1
		}, {
			TopRow = ReactModule.createElement(View, { tag = "auto-y size-full-0", LayoutOrder = 1 }, {
				Columns = ReactModule.createElement(View, { tag = "auto-y flex-x-between row size-full-0" }, { LeftColumn = SideColumn, RightColumn = SideColumn1 }),
				Center = ReactModule.createElement(View, {
					tag = "auto-xy",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				}, { TopMid = Components.topMidComponent })
			}),
			BottomRow = ReactModule.createElement(View, { tag = "auto-y size-full-0", LayoutOrder = 2 }, {
				BottomMid = ReactModule.createElement(View, {
					tag = "align-x-center align-y-bottom auto-y padding-top-xxlarge row size-full-0",
					LayoutOrder = 4
				}, { bottomMid = Components.bottomMidComponent })
			})
		})
	}) else ReactModule.createElement(View, {
		tag = "auto-y flex-x-between row size-full-0",
		LayoutOrder = 1,
		padding = UDim2.fromOffset(UseTokensResult.Margin.Large, UseTokensResult.Margin.Small)
	}, {
		leftColumn = SideColumn,
		middleColumn = ReactModule.createElement(View, {
			tag = "align-x-center auto-x col flex-y-fill size-0-full",
			LayoutOrder = 2
		}, {
			topMidContainer = ReactModule.createElement(View, {
				tag = "align-y-center auto-x col size-0-full",
				LayoutOrder = 1
			}, { topMid = Components.topMidComponent }),
			bottomMidContainer = ReactModule.createElement(View, { tag = "align-y-bottom auto-xy col", LayoutOrder = 2 }, { bottomMid = Components.bottomMidComponent })
		}),
		rightColumn = SideColumn1
	})
end)

return ReactModule.memo(function() --[[ Line: 165 | Named "TouchHelpPage" ]]
	-- upvalues: UseDeviceOrientationFunction (copy), UseKeybindsModule (copy), ReactModule (copy), UserGameSettings (copy), DisplayModule (copy), TouchControlsEnumModule (copy), TouchActionModule (copy), View (copy), MemoResult (copy), ConstantsModule (copy), TouchHelpPageResponsiveUnits (copy)
	local UseDeviceOrientationResult = UseDeviceOrientationFunction()
	local Controls = UseKeybindsModule().controls
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserGameSettings.TouchMovementMode)
	local ViewportSize = DisplayModule.GetDisplayStore(false).getViewportSize(false)
	ReactModule.useEffect(function() --[[ Line: 172 ]]
		-- upvalues: UserGameSettings (upval), UseStateResult2 (copy)
		local Connection = UserGameSettings:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 173 ]]
			-- upvalues: UseStateResult2 (upval), UserGameSettings (upval)
			UseStateResult2(UserGameSettings.TouchMovementMode)
		end)
		
		return function() --[[ Line: 177 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	local IsUseStateResultMatch = UseStateResult == Enum.TouchMovementMode.ClickToMove
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 185 ]]
		-- upvalues: Controls (copy), IsUseStateResultMatch (copy)
		local Labels = {}
		
		if Controls == nil then
			return Labels
		end
		for _, control in Controls do
			if control.touchInput ~= nil then
				local TapToMoveInput = if IsUseStateResultMatch then control.touchInput.tapToMoveInput else control.touchInput.thumbstickInput
				for _, value in ipairs(TapToMoveInput) do
					assert(Labels[value] == nil, "A touch input position cannot have multiple actions.")
					Labels[value] = control.label
				end
			end
		end
		return Labels
	end, { Controls, UseStateResult })
	
	if Controls == nil then
		return nil
	else
		local TopMidTap = TouchControlsEnumModule.TopMidTap
		local TopMidRotate = TouchControlsEnumModule.TopMidRotate
		assert(not (UseMemoResult[TopMidTap] and UseMemoResult[TopMidRotate]), "Cannot assign a position to both tap and rotate simultaneously.")
		local TopMidTap1 = if UseMemoResult[TopMidTap] then TopMidTap elseif UseMemoResult[TopMidRotate] then TopMidRotate else nil
		local TopRightTap = TouchControlsEnumModule.TopRightTap
		local TopRightRotate = TouchControlsEnumModule.TopRightRotate
		assert(not (UseMemoResult[TopRightTap] and UseMemoResult[TopRightRotate]), "Cannot assign a position to both tap and rotate simultaneously.")
		local TopRightTap1 = if UseMemoResult[TopRightTap] then TopRightTap elseif UseMemoResult[TopRightRotate] then TopRightRotate else nil
		local BottomLeftTap = TouchControlsEnumModule.BottomLeftTap
		local BottomLeftRotate = TouchControlsEnumModule.BottomLeftRotate
		assert(not (UseMemoResult[BottomLeftTap] and UseMemoResult[BottomLeftRotate]), "Cannot assign a position to both tap and rotate simultaneously.")
		local BottomLeftTap1 = if UseMemoResult[BottomLeftTap] then BottomLeftTap elseif UseMemoResult[BottomLeftRotate] then BottomLeftRotate else nil
		local SMALLSCREENOFFSET = if ViewportSize.X < ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X or ViewportSize.Y < ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y then ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_OFFSET else ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.BIG_SCREEN_OFFSET
		
		return ReactModule.createElement(View, {
			ClipsDescendants = true,
			Size = if TouchHelpPageResponsiveUnits then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, ViewportSize.Y - SMALLSCREENOFFSET)
		}, {
			pageComponent = ReactModule.createElement(MemoResult, {
				components = {
					topLeftComponent = UseMemoResult[TouchControlsEnumModule.TopLeft] and ReactModule.createElement(TouchActionModule, {
						layoutOrder = 0,
						action = UseMemoResult[TouchControlsEnumModule.TopLeft],
						touchInput = TouchControlsEnumModule.TopLeft
					}) or ReactModule.createElement(View),
					bottomLeftComponent = BottomLeftTap1 and ReactModule.createElement(TouchActionModule, {
						layoutOrder = 1,
						action = BottomLeftTap1 and UseMemoResult[BottomLeftTap1],
						touchInput = BottomLeftTap1
					}) or ReactModule.createElement(View),
					topMidComponent = TopMidTap1 and ReactModule.createElement(TouchActionModule, {
						layoutOrder = 1,
						action = TopMidTap1 and UseMemoResult[TopMidTap1],
						touchInput = TopMidTap1
					}) or ReactModule.createElement(View),
					bottomMidComponent = UseMemoResult[TouchControlsEnumModule.BottomMid] and ReactModule.createElement(TouchActionModule, {
						layoutOrder = 1,
						action = UseMemoResult[TouchControlsEnumModule.BottomMid],
						touchInput = TouchControlsEnumModule.BottomMid
					}) or ReactModule.createElement(View),
					topRightComponent = TopRightTap1 and ReactModule.createElement(TouchActionModule, {
						layoutOrder = 1,
						action = TopRightTap1 and UseMemoResult[TopRightTap1],
						touchInput = TopRightTap1
					}) or ReactModule.createElement(View),
					bottomRightComponent = UseMemoResult[TouchControlsEnumModule.BottomRight] and ReactModule.createElement(TouchActionModule, {
						layoutOrder = 2,
						action = UseMemoResult[TouchControlsEnumModule.BottomRight],
						touchInput = TouchControlsEnumModule.BottomRight
					}) or ReactModule.createElement(View)
				},
				orientation = UseDeviceOrientationResult
			})
		})
	end
end)