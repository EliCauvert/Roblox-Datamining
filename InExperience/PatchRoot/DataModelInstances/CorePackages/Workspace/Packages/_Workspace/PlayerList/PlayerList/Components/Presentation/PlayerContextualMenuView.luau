local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local divider = foundationModule.Divider
local useTokens = foundationModule.Hooks.useTokens
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local playerContextualMenuStoreModule = require(parent.Common.PlayerContextualMenuStore)
local playerContextMenuHeaderModule = require(parent.Components.Presentation.PlayerContextMenuHeader)
local menuActionRowModule = require(parent.Components.Presentation.MenuActionRow)
local usePreferredBackgroundStyleModule = require(parent.Hooks.usePreferredBackgroundStyle)
local constantsModule = require(parent.Common.Constants)
local useSlideOpenCloseAnimationModule = require(parent.Hooks.useSlideOpenCloseAnimation)
local useSlideOpenCloseAnimation = useSlideOpenCloseAnimationModule.useSlideOpenCloseAnimation
local MENU_SLIDE_CONFIG = useSlideOpenCloseAnimationModule.MENU_SLIDE_CONFIG
local MENU_ZOOM_CLOSED_SCALE = useSlideOpenCloseAnimationModule.MENU_ZOOM_CLOSED_SCALE
local t = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
local t_1 = { affordance = stateLayerAffordance.None }

local function _()
	-- upvalues: userInputService (ref)
	return userInputService:GetLastInputType().Name:find("Gamepad") ~= nil
end

return reactModule.memo(function(p0)
	-- upvalues: signalsReactModule (ref), playerContextualMenuStoreModule (ref), useTokens (ref), usePreferredBackgroundStyleModule (ref), reactModule (ref), useSlideOpenCloseAnimation (ref), MENU_SLIDE_CONFIG (ref), userInputService (ref), contextActionService (ref), guiService (ref), MENU_ZOOM_CLOSED_SCALE (ref), playerContextMenuHeaderModule (ref), divider (ref), menuActionRowModule (ref), constantsModule (ref), view (ref), t (ref), t_1 (ref)
	local var14 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData)
	local var15 = useTokens()
	local var16 = usePreferredBackgroundStyleModule(var15.Color.OverMedia.OverMedia_100)
	local var17 = reactModule.useRef(var14)
	
	if var14 ~= nil then
		var17.current = var14
	end
	local var18 = useSlideOpenCloseAnimation(var14 ~= nil, MENU_SLIDE_CONFIG, if var14 then var14.player.UserId else nil)
	local var19 = var14 ~= nil
	local var20 = reactModule.useRef(nil)
	local contextActionServiceOverride = p0.contextActionServiceOverride
	local var21 = if p0.isGamepadOverride ~= nil then userInputService:GetLastInputType().Name:find("Gamepad") ~= nil else p0.isGamepadOverride
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var19 (ref), contextActionServiceOverride (ref), contextActionService (copy), playerContextualMenuStoreModule (copy)
		if p0.isSmallTouchDevice and var19 then
			local contextActionServiceOverride_1 = contextActionServiceOverride or contextActionService
			contextActionServiceOverride_1:BindCoreAction("RbxPlayerListReskinGamepadMenuClose", function(_, p1, _)
				-- upvalues: playerContextualMenuStoreModule (copy)
				if p1 == Enum.UserInputState.Begin then
					playerContextualMenuStoreModule.closeContextMenu()
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			
			return function()
				-- upvalues: contextActionServiceOverride_1 (ref)
				contextActionServiceOverride_1:UnbindCoreAction("RbxPlayerListReskinGamepadMenuClose")
			end
		end
		return function() end
	end, {
		var19,
		p0.isSmallTouchDevice,
		contextActionServiceOverride
	})
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var19 (ref), var21 (ref), var20 (ref), guiService (copy)
		if not p0.isSmallTouchDevice or not var19 or not var21 then
			return function() end
		elseif var20.current then
			guiService.SelectedCoreObject = var20.current
		end
		return function() end
	end, { var19, p0.isSmallTouchDevice, var21 })
	local var22 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), var18 (ref), MENU_ZOOM_CLOSED_SCALE (copy)
		return if p0.isSmallTouchDevice then var18.offset:map(function(p2)
			-- upvalues: MENU_ZOOM_CLOSED_SCALE (copy)
			return 1 + (MENU_ZOOM_CLOSED_SCALE - 1) * p2
		end) else nil
	end, { p0.isSmallTouchDevice, var18.offset })
	local var23 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), var15 (ref), var18 (ref)
		if p0.isSmallTouchDevice then
			local transparency = var15.Color.Stroke.Default.Transparency
			
			return var18.offset:map(function(p3)
				-- upvalues: transparency (ref)
				return transparency + (1 - transparency) * p3
			end)
		end
		return nil
	end, {
		p0.isSmallTouchDevice,
		var18.offset,
		var15.Color.Stroke.Default.Transparency
	})
	
	if not var18.shouldMount then
		return nil
	end
	local current = var17.current
	
	if current == nil then
		return nil
	end
	local anchorPosition = current.anchorPosition
	local vector2 = Vector2.new(0.5, 0.5)
	local uDim2 = UDim2.fromScale(0.5, 0.5)
	
	if not p0.isSmallTouchDevice and anchorPosition ~= nil then
		vector2 = Vector2.new(1, 0)
		uDim2 = UDim2.fromOffset(anchorPosition.X - 8, anchorPosition.Y)
	end
	local t_2 = {
		Header = reactModule.createElement(playerContextMenuHeaderModule, {
			layoutOrder = 1,
			header = current.header,
			player = current.player
		}),
		HeaderDivider = reactModule.createElement(divider, { LayoutOrder = 2 })
	}
	
	for i, v in ipairs(current.items) do
		t_2[`Action_{tostring(v.key)}`] = reactModule.createElement(menuActionRowModule, {
			item = v,
			layoutOrder = 2 + i,
			isInteractable = var19,
			rowRef = if i == 1 then var20 else nil
		})
	end
	local t_3
	local var27 = constantsModule.CONTEXT_MENU_WIDTH * var15.Config.UI.Scale
	local _ = nil
	
	if p0.isSmallTouchDevice then
		t_3 = table.clone(t_2)
		t_3.UIScale = reactModule.createElement("UIScale", { Scale = var22 })
		t_3.UIStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = var15.Color.Stroke.Default.Color3,
			Transparency = var23,
			Thickness = var15.Stroke.Standard
		})
	else
		t_3 = {
			SlideOffset = reactModule.createElement(view, {
				tag = "col align-x-left gap-xxsmall auto-y padding-small stroke-standard stroke-default radius-large",
				Position = var18.position,
				Size = UDim2.fromOffset(var27, 0),
				backgroundStyle = var16
			}, t_2)
		}
	end
	return reactModule.createElement(view, {
		ZIndex = 10,
		tag = "size-full",
		backgroundStyle = t,
		selection = constantsModule.NOT_SELECTABLE
	}, {
		Backdrop = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 1,
			backgroundStyle = t,
			onActivated = if var19 then playerContextualMenuStoreModule.closeContextMenu else nil,
			stateLayer = t_1,
			selection = constantsModule.NOT_SELECTABLE
		}),
		Menu = reactModule.createElement(view, {
			ZIndex = 2,
			Visible = true,
			testId = "player-context-menu",
			AnchorPoint = vector2,
			Position = uDim2,
			Size = UDim2.fromOffset(var27, 0),
			GroupTransparency = if p0.isSmallTouchDevice then var18.offset else nil,
			selectionGroup = if p0.isSmallTouchDevice and var19 then constantsModule.CONSOLE_FOCUS_ISOLATE else nil,
			selection = constantsModule.NOT_SELECTABLE,
			tag = {
				["auto-y clip"] = not p0.isSmallTouchDevice,
				["col align-x-left gap-xxsmall auto-y padding-small radius-large"] = p0.isSmallTouchDevice
			},
			backgroundStyle = if p0.isSmallTouchDevice then var16 else nil
		}, t_3)
	})
end)