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

local function _(p1, p2, p3)
	assert(not (p3[p1] and p3[p2]), "Cannot assign a position to both tap and rotate simultaneously.")
	
	return if p3[p1] then p1 elseif p3[p2] then p2 else nil
end

local var1 = reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), deviceOrientationMode (ref), reactModule (ref), view (ref)
	local var2 = useTokens()
	local components = p1.components
	local var3 = p1.orientation == deviceOrientationMode.Portrait
	
	local function createSideColumn(p2, p3, p4, p5)
		-- upvalues: reactModule (copy), view (copy)
		return reactModule.createElement(view, {
			tag = `align-x-{p2} auto-x col flex-y-between size-0-full`,
			LayoutOrder = p3
		}, { topComponent = p4, bottomComponent = p5 })
	end
	
	local var4 = createSideColumn(if var3 then "center" else "left", 1, components.topLeftComponent, components.bottomLeftComponent)
	local var5 = createSideColumn(if var3 then "center" else "right", 3, components.topRightComponent, components.bottomRightComponent)
	
	return if var3 then reactModule.createElement(view, { tag = "auto-y flex-x-between row size-full-0" }, {
		Inner = reactModule.createElement(view, {
			tag = "col flex-y-fill padding-y-large padding-x-xxlarge size-full",
			LayoutOrder = 1
		}, {
			TopRow = reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = 1 }, {
				Columns = reactModule.createElement(view, { tag = "auto-y flex-x-between row size-full-0" }, { LeftColumn = var4, RightColumn = var5 }),
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
		padding = UDim2.fromOffset(var2.Margin.Large, var2.Margin.Small)
	}, {
		leftColumn = var4,
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
		rightColumn = var5
	})
end)

return reactModule.memo(function()
	-- upvalues: useDeviceOrientation (ref), useKeybindsModule (ref), reactModule (ref), userGameSettingsService (ref), displayModule (ref), touchControlsEnumModule (ref), touchActionModule (ref), view (ref), var1 (ref), constantsModule (ref), touchHelpPageResponsiveUnits (ref)
	local var2 = useDeviceOrientation()
	local controls = useKeybindsModule().controls
	local var3, var4 = reactModule.useState(userGameSettingsService.TouchMovementMode)
	local viewportSize = displayModule.GetDisplayStore(false).getViewportSize(false)
	reactModule.useEffect(function()
		-- upvalues: userGameSettingsService (copy), var4 (ref)
		local var5 = userGameSettingsService:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
			-- upvalues: var4 (copy), userGameSettingsService (copy)
			var4(userGameSettingsService.TouchMovementMode)
		end)
		
		return function()
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, {})
	local var5 = var3 == Enum.TouchMovementMode.ClickToMove
	local var6 = reactModule.useMemo(function()
		-- upvalues: controls (ref), var5 (ref)
		local t = {}
		
		if controls == nil then
			return t
		end
		for i, v in controls do
			if v.touchInput ~= nil then
				for i_1, v_1 in ipairs(if var5 then v.touchInput.tapToMoveInput else v.touchInput.thumbstickInput) do
					assert(t[v_1] == nil, "A touch input position cannot have multiple actions.")
					t[v_1] = v.label
				end
			end
		end
		return t
	end, { controls, var3 })
	
	if controls == nil then
		return nil
	end
	local topMidTap = touchControlsEnumModule.TopMidTap
	local topMidRotate = touchControlsEnumModule.TopMidRotate
	assert(not (var6[topMidTap] and var6[topMidRotate]), "Cannot assign a position to both tap and rotate simultaneously.")
	local var7 = if var6[topMidTap] then topMidTap elseif var6[topMidRotate] then topMidRotate else nil
	local topRightTap = touchControlsEnumModule.TopRightTap
	local topRightRotate = touchControlsEnumModule.TopRightRotate
	assert(not (var6[topRightTap] and var6[topRightRotate]), "Cannot assign a position to both tap and rotate simultaneously.")
	local var8 = if var6[topRightTap] then topRightTap elseif var6[topRightRotate] then topRightRotate else nil
	local bottomLeftTap = touchControlsEnumModule.BottomLeftTap
	local bottomLeftRotate = touchControlsEnumModule.BottomLeftRotate
	assert(not (var6[bottomLeftTap] and var6[bottomLeftRotate]), "Cannot assign a position to both tap and rotate simultaneously.")
	local var9 = if var6[bottomLeftTap] then bottomLeftTap elseif var6[bottomLeftRotate] then bottomLeftRotate else nil
	
	return reactModule.createElement(view, {
		ClipsDescendants = true,
		Size = if touchHelpPageResponsiveUnits then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, viewportSize.Y - (if viewportSize.X < constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X or viewportSize.Y < constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y then constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_OFFSET else constantsModule.HELP_PAGE.TOUCH_OFFSETS.BIG_SCREEN_OFFSET))
	}, {
		pageComponent = reactModule.createElement(var1, {
			components = {
				topLeftComponent = var6[touchControlsEnumModule.TopLeft] and reactModule.createElement(touchActionModule, {
					layoutOrder = 0,
					action = var6[touchControlsEnumModule.TopLeft],
					touchInput = touchControlsEnumModule.TopLeft
				}) or reactModule.createElement(view),
				bottomLeftComponent = var9 and reactModule.createElement(touchActionModule, {
					layoutOrder = 1,
					action = var9 and var6[var9],
					touchInput = var9
				}) or reactModule.createElement(view),
				topMidComponent = var7 and reactModule.createElement(touchActionModule, {
					layoutOrder = 1,
					action = var7 and var6[var7],
					touchInput = var7
				}) or reactModule.createElement(view),
				bottomMidComponent = var6[touchControlsEnumModule.BottomMid] and reactModule.createElement(touchActionModule, {
					layoutOrder = 1,
					action = var6[touchControlsEnumModule.BottomMid],
					touchInput = touchControlsEnumModule.BottomMid
				}) or reactModule.createElement(view),
				topRightComponent = var8 and reactModule.createElement(touchActionModule, {
					layoutOrder = 1,
					action = var8 and var6[var8],
					touchInput = var8
				}) or reactModule.createElement(view),
				bottomRightComponent = var6[touchControlsEnumModule.BottomRight] and reactModule.createElement(touchActionModule, {
					layoutOrder = 2,
					action = var6[touchControlsEnumModule.BottomRight],
					touchInput = touchControlsEnumModule.BottomRight
				}) or reactModule.createElement(view)
			},
			orientation = var2
		})
	})
end)