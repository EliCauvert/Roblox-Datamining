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

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), playerContextualMenuStoreModule (ref), useTokens (ref), usePreferredBackgroundStyleModule (ref), reactModule (ref), useSlideOpenCloseAnimation (ref), MENU_SLIDE_CONFIG (ref), userInputService (ref), contextActionService (ref), guiService (ref), MENU_ZOOM_CLOSED_SCALE (ref), playerContextMenuHeaderModule (ref), divider (ref), menuActionRowModule (ref), constantsModule (ref), view (ref), t (ref), t_1 (ref)
	local var1 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData)
	local var2 = useTokens()
	local var3 = usePreferredBackgroundStyleModule(var2.Color.OverMedia.OverMedia_100)
	local var4 = reactModule.useRef(var1)
	
	if var1 ~= nil then
		var4.current = var1
	end
	local var5 = useSlideOpenCloseAnimation(var1 ~= nil, MENU_SLIDE_CONFIG, if var1 then var1.player.UserId else nil)
	local var6 = var1 ~= nil
	local var7 = reactModule.useRef(nil)
	local contextActionServiceOverride = p1.contextActionServiceOverride
	local var8 = if p1.isGamepadOverride ~= nil then userInputService:GetLastInputType().Name:find("Gamepad") ~= nil else p1.isGamepadOverride
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref), contextActionServiceOverride (ref), contextActionService (copy), playerContextualMenuStoreModule (copy)
		if p1.isSmallTouchDevice and var6 then
			local contextActionServiceOverride_1 = contextActionServiceOverride or contextActionService
			contextActionServiceOverride_1:BindCoreAction("RbxPlayerListReskinGamepadMenuClose", function(_, p2, _)
				-- upvalues: playerContextualMenuStoreModule (copy)
				if p2 == Enum.UserInputState.Begin then
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
		var6,
		p1.isSmallTouchDevice,
		contextActionServiceOverride
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref), var8 (ref), var7 (ref), guiService (copy)
		if not p1.isSmallTouchDevice or not var6 or not var8 then
			return function() end
		elseif var7.current then
			guiService.SelectedCoreObject = var7.current
		end
		return function() end
	end, { var6, p1.isSmallTouchDevice, var8 })
	local var9 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var5 (ref), MENU_ZOOM_CLOSED_SCALE (copy)
		return if p1.isSmallTouchDevice then var5.offset:map(function(p2)
			-- upvalues: MENU_ZOOM_CLOSED_SCALE (copy)
			return 1 + (MENU_ZOOM_CLOSED_SCALE - 1) * p2
		end) else nil
	end, { p1.isSmallTouchDevice, var5.offset })
	local var10 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var2 (ref), var5 (ref)
		if p1.isSmallTouchDevice then
			local transparency = var2.Color.Stroke.Default.Transparency
			
			return var5.offset:map(function(p2)
				-- upvalues: transparency (ref)
				return transparency + (1 - transparency) * p2
			end)
		end
		return nil
	end, {
		p1.isSmallTouchDevice,
		var5.offset,
		var2.Color.Stroke.Default.Transparency
	})
	
	if not var5.shouldMount then
		return nil
	end
	local current = var4.current
	
	if current == nil then
		return nil
	end
	local anchorPosition = current.anchorPosition
	local vector2 = Vector2.new(0.5, 0.5)
	local uDim2 = UDim2.fromScale(0.5, 0.5)
	
	if not p1.isSmallTouchDevice and anchorPosition ~= nil then
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
			isInteractable = var6,
			rowRef = if i == 1 then var7 else nil
		})
	end
	local t_3
	local var11 = constantsModule.CONTEXT_MENU_WIDTH * var2.Config.UI.Scale
	local _ = nil
	
	if p1.isSmallTouchDevice then
		t_3 = table.clone(t_2)
		t_3.UIScale = reactModule.createElement("UIScale", { Scale = var9 })
		t_3.UIStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = var2.Color.Stroke.Default.Color3,
			Transparency = var10,
			Thickness = var2.Stroke.Standard
		})
	else
		t_3 = {
			SlideOffset = reactModule.createElement(view, {
				tag = "col align-x-left gap-xxsmall auto-y padding-small stroke-standard stroke-default radius-large",
				Position = var5.position,
				Size = UDim2.fromOffset(var11, 0),
				backgroundStyle = var3
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
			onActivated = if var6 then playerContextualMenuStoreModule.closeContextMenu else nil,
			stateLayer = t_1,
			selection = constantsModule.NOT_SELECTABLE
		}),
		Menu = reactModule.createElement(view, {
			ZIndex = 2,
			Visible = true,
			testId = "player-context-menu",
			AnchorPoint = vector2,
			Position = uDim2,
			Size = UDim2.fromOffset(var11, 0),
			GroupTransparency = if p1.isSmallTouchDevice then var5.offset else nil,
			selectionGroup = if p1.isSmallTouchDevice and var6 then constantsModule.CONSOLE_FOCUS_ISOLATE else nil,
			selection = constantsModule.NOT_SELECTABLE,
			tag = {
				["auto-y clip"] = not p1.isSmallTouchDevice,
				["col align-x-left gap-xxsmall auto-y padding-small radius-large"] = p1.isSmallTouchDevice
			},
			backgroundStyle = if p1.isSmallTouchDevice then var3 else nil
		}, t_3)
	})
end)