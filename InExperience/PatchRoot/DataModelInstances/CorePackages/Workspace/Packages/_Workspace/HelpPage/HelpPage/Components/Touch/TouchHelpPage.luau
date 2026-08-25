local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local useKeybindsModule = require(parent.Hooks.useKeybinds)
local touchControlsEnumModule = require(parent.Enums.TouchControlsEnum)
local touchActionModule = require(parent.Components.Touch.TouchAction)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local robloxAppEnumsModule = require(parent_1.RobloxAppEnums)
local displayModule = require(parent_1.Display)
local constantsModule = require(parent.Constants)
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation
local deviceOrientationMode = robloxAppEnumsModule.DeviceOrientationMode
local touchHelpPageResponsiveUnits = game:DefineFastFlag("TouchHelpPageResponsiveUnits", false)

local function _(p0, p1, p2)
	assert(not (p2[p0] and p2[p1]), "Cannot assign a position to both tap and rotate simultaneously.")
	
	return if p2[p0] then p0 elseif p2[p1] then p1 else nil
end

local var11 = reactModule.memo(function(p3)
	-- upvalues: useTokens (ref), deviceOrientationMode (ref), reactModule (ref), view (ref)
	local var12 = useTokens()
	local components = p3.components
	local var13 = p3.orientation == deviceOrientationMode.Portrait
	
	local function createSideColumn(p4, p5, p6, p7)
		-- upvalues: reactModule (copy), view (copy)
		return reactModule.createElement(view, {
			tag = `align-x-{p4} auto-x col flex-y-between size-0-full`,
			LayoutOrder = p5
		}, { topComponent = p6, bottomComponent = p7 })
	end
	
	local var15 = createSideColumn(if var13 then "center" else "left", 1, components.topLeftComponent, components.bottomLeftComponent)
	local var16 = createSideColumn(if var13 then "center" else "right", 3, components.topRightComponent, components.bottomRightComponent)
	
	return if var13 then reactModule.createElement(view, { tag = "auto-y flex-x-between row size-full-0" }, {
		Inner = reactModule.createElement(view, {
			tag = "col flex-y-fill padding-y-large padding-x-xxlarge size-full",
			LayoutOrder = 1
		}, {
			TopRow = reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = 1 }, {
				Columns = reactModule.createElement(view, { tag = "auto-y flex-x-between row size-full-0" }, { LeftColumn = var15, RightColumn = var16 }),
				Center = reactModule.createElement(view, {
					tag = "auto-xy",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				}, { TopMid = components.topMidComponent })
			}),
			BottomRow = reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = 2 }, {
				BottomMid = reactModule.createElement(view, {
					tag = "align-x-center align-y-bottom auto-y padding-top-xxlarge row size-full-0",
					LayoutOrder = 4
				}, { bottomMid = components.bottomMidComponent })
			})
		})
	}) else reactModule.createElement(view, {
		tag = "auto-y flex-x-between row size-full-0",
		LayoutOrder = 1,
		padding = UDim2.fromOffset(var12.Margin.Large, var12.Margin.Small)
	}, {
		leftColumn = var15,
		middleColumn = reactModule.createElement(view, {
			tag = "align-x-center auto-x col flex-y-fill size-0-full",
			LayoutOrder = 2
		}, {
			topMidContainer = reactModule.createElement(view, {
				tag = "align-y-center auto-x col size-0-full",
				LayoutOrder = 1
			}, { topMid = components.topMidComponent }),
			bottomMidContainer = reactModule.createElement(view, { tag = "align-y-bottom auto-xy col", LayoutOrder = 2 }, { bottomMid = components.bottomMidComponent })
		}),
		rightColumn = var16
	})
end)

return reactModule.memo(function()
	-- upvalues: useDeviceOrientation (ref), useKeybindsModule (ref), reactModule (ref), userGameSettingsService (ref), displayModule (ref), touchControlsEnumModule (ref), touchActionModule (ref), view (ref), var11 (ref), constantsModule (ref), touchHelpPageResponsiveUnits (ref)
	local var17 = useDeviceOrientation()
	local controls = useKeybindsModule().controls
	local var18, var19 = reactModule.useState(userGameSettingsService.TouchMovementMode)
	local viewportSize = displayModule.GetDisplayStore(false).getViewportSize(false)
	reactModule.useEffect(function()
		-- upvalues: userGameSettingsService (copy), var19 (ref)
		local var26 = userGameSettingsService:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
			-- upvalues: var19 (copy), userGameSettingsService (copy)
			var19(userGameSettingsService.TouchMovementMode)
		end)
		
		return function()
			-- upvalues: var26 (ref)
			var26:Disconnect()
		end
	end, {})
	local var21 = var18 == Enum.TouchMovementMode.ClickToMove
	local var22 = reactModule.useMemo(function()
		-- upvalues: controls (ref), var21 (ref)
		local t = {}
		
		if controls == nil then
			return t
		end
		for i, v in controls do
			if v.touchInput ~= nil then
				for i_1, v_1 in ipairs(if var21 then v.touchInput.tapToMoveInput else v.touchInput.thumbstickInput) do
					assert(t[v_1] == nil, "A touch input position cannot have multiple actions.")
					t[v_1] = v.label
				end
			end
		end
		return t
	end, { controls, var18 })
	
	if controls == nil then
		return nil
	end
	local topMidTap = touchControlsEnumModule.TopMidTap
	local topMidRotate = touchControlsEnumModule.TopMidRotate
	assert(not (var22[topMidTap] and var22[topMidRotate]), "Cannot assign a position to both tap and rotate simultaneously.")
	local var23 = if var22[topMidTap] then topMidTap elseif var22[topMidRotate] then topMidRotate else nil
	local topRightTap = touchControlsEnumModule.TopRightTap
	local topRightRotate = touchControlsEnumModule.TopRightRotate
	assert(not (var22[topRightTap] and var22[topRightRotate]), "Cannot assign a position to both tap and rotate simultaneously.")
	local var24 = if var22[topRightTap] then topRightTap elseif var22[topRightRotate] then topRightRotate else nil
	local bottomLeftTap = touchControlsEnumModule.BottomLeftTap
	local bottomLeftRotate = touchControlsEnumModule.BottomLeftRotate
	assert(not (var22[bottomLeftTap] and var22[bottomLeftRotate]), "Cannot assign a position to both tap and rotate simultaneously.")
	local var25 = if var22[bottomLeftTap] then bottomLeftTap elseif var22[bottomLeftRotate] then bottomLeftRotate else nil
	
	return reactModule.createElement(view, {
		ClipsDescendants = true,
		Size = if touchHelpPageResponsiveUnits then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, viewportSize.Y - (if viewportSize.X < constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X or viewportSize.Y < constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y then constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_OFFSET else constantsModule.HELP_PAGE.TOUCH_OFFSETS.BIG_SCREEN_OFFSET))
	}, {
		pageComponent = reactModule.createElement(var11, {
			components = {
				topLeftComponent = var22[touchControlsEnumModule.TopLeft] and reactModule.createElement(touchActionModule, {
					layoutOrder = 0,
					action = var22[touchControlsEnumModule.TopLeft],
					touchInput = touchControlsEnumModule.TopLeft
				}) or reactModule.createElement(view),
				bottomLeftComponent = var25 and reactModule.createElement(touchActionModule, {
					layoutOrder = 1,
					action = var25 and var22[var25],
					touchInput = var25
				}) or reactModule.createElement(view),
				topMidComponent = var23 and reactModule.createElement(touchActionModule, {
					layoutOrder = 1,
					action = var23 and var22[var23],
					touchInput = var23
				}) or reactModule.createElement(view),
				bottomMidComponent = var22[touchControlsEnumModule.BottomMid] and reactModule.createElement(touchActionModule, {
					layoutOrder = 1,
					action = var22[touchControlsEnumModule.BottomMid],
					touchInput = touchControlsEnumModule.BottomMid
				}) or reactModule.createElement(view),
				topRightComponent = var24 and reactModule.createElement(touchActionModule, {
					layoutOrder = 1,
					action = var24 and var22[var24],
					touchInput = var24
				}) or reactModule.createElement(view),
				bottomRightComponent = var22[touchControlsEnumModule.BottomRight] and reactModule.createElement(touchActionModule, {
					layoutOrder = 2,
					action = var22[touchControlsEnumModule.BottomRight],
					touchInput = touchControlsEnumModule.BottomRight
				}) or reactModule.createElement(view)
			},
			orientation = var17
		})
	})
end)