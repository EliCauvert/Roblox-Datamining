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

local var1 = function() end

local function _(p1, p2)
	local absolutePosition = p1.AbsolutePosition
	local absoluteSize = p1.AbsoluteSize
	
	return absolutePosition.X <= p2.X and (p2.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p2.Y and p2.Y <= absolutePosition.Y + absoluteSize.Y))
end

local function isPositionOnMenu(p1, p2)
	local absolutePosition = p1.AbsolutePosition
	local absoluteSize = p1.AbsoluteSize
	
	if absolutePosition.X <= p2.X and (p2.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p2.Y and p2.Y <= absolutePosition.Y + absoluteSize.Y)) then
		return true
	end
	for i, v in p1:GetDescendants() do
		if v:IsA("GuiObject") and v.Visible then
			local absolutePosition_1 = v.AbsolutePosition
			local absoluteSize_1 = v.AbsoluteSize
			
			if absolutePosition_1.X <= p2.X and (p2.X <= absolutePosition_1.X + absoluteSize_1.X and (absolutePosition_1.Y <= p2.Y and p2.Y <= absolutePosition_1.Y + absoluteSize_1.Y)) then
				return true
			end
		end
	end
	return false
end

local function isPositionOnRow(p3, p4)
	local absolutePosition = p3.AbsolutePosition
	local absoluteSize = p3.AbsoluteSize
	
	if not (absolutePosition.X <= p4.X and (p4.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p4.Y and p4.Y <= absolutePosition.Y + absoluteSize.Y))) then
		return false
	end
	local parent = p3.Parent
	while parent ~= nil and parent:IsA("GuiObject") do
		local var2 = parent
		
		if var2.ClipsDescendants then
			local absolutePosition_1 = var2.AbsolutePosition
			local absoluteSize_1 = var2.AbsoluteSize
			
			if absolutePosition_1.X <= p4.X and (p4.X <= absolutePosition_1.X + absoluteSize_1.X and (absolutePosition_1.Y <= p4.Y and p4.Y <= absolutePosition_1.Y + absoluteSize_1.Y)) then
				parent = var2.Parent
				continue
			end
			return false
		end
	end
	return true
end

local _ = function()
	-- upvalues: userInputService (ref)
	return userInputService:GetLastInputType().Name:find("Gamepad") ~= nil
end

return reactModule.memo(function(p5)
	-- upvalues: signalsReactModule (ref), playerContextualMenuStoreModule (ref), useTokens (ref), usePreferredBackgroundStyleModule (ref), reactModule (ref), useSlideOpenCloseAnimation (ref), MENU_SLIDE_CONFIG (ref), userInputService (ref), contextActionService (ref), isPositionOnMenu (ref), isPositionOnRow (ref), guiService (ref), MENU_ZOOM_CLOSED_SCALE (ref), playerContextMenuHeaderModule (ref), divider (ref), menuActionRowModule (ref), constantsModule (ref), view (ref), t (ref), var1 (ref), t_1 (ref)
	local var3 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData)
	local var4 = useTokens()
	local var5 = usePreferredBackgroundStyleModule(var4.Color.OverMedia.OverMedia_100)
	local var6 = reactModule.useRef(var3)
	
	if var3 ~= nil then
		var6.current = var3
	end
	local var7 = useSlideOpenCloseAnimation(var3 ~= nil, MENU_SLIDE_CONFIG, if var3 then var3.player.UserId else nil)
	local var8 = var3 ~= nil
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local contextActionServiceOverride = p5.contextActionServiceOverride
	local var11 = if p5.isGamepadOverride ~= nil then userInputService:GetLastInputType().Name:find("Gamepad") ~= nil else p5.isGamepadOverride
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), var8 (ref), contextActionServiceOverride (ref), contextActionService (copy), playerContextualMenuStoreModule (copy)
		if p5.isSmallTouchDevice and var8 then
			local contextActionServiceOverride_1 = contextActionServiceOverride or contextActionService
			contextActionServiceOverride_1:BindCoreAction("RbxPlayerListReskinGamepadMenuClose", function(_, p6, _)
				-- upvalues: playerContextualMenuStoreModule (copy)
				if p6 == Enum.UserInputState.Begin then
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
		var8,
		p5.isSmallTouchDevice,
		contextActionServiceOverride
	})
	local userInputServiceOverride = p5.userInputServiceOverride
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), userInputServiceOverride (ref), userInputService (copy), var9 (ref), isPositionOnMenu (copy), p5 (ref), playerContextualMenuStoreModule (copy), isPositionOnRow (copy)
		if var8 then
			local inputBeganConnection = (userInputServiceOverride or userInputService).InputBegan:Connect(function(p6)
				-- upvalues: var9 (copy), isPositionOnMenu (copy), p5 (copy), playerContextualMenuStoreModule (copy), isPositionOnRow (copy)
				local userInputType = p6.UserInputType
				
				if userInputType ~= Enum.UserInputType.Touch and userInputType ~= Enum.UserInputType.MouseButton1 then return end
				local current = var9.current
				
				if current ~= nil and isPositionOnMenu(current, p6.Position) then return end
				if not p5.isSmallTouchDevice then
					local anchorRow = playerContextualMenuStoreModule.getAnchorRow()
					
					if anchorRow == nil or not isPositionOnRow(anchorRow, p6.Position) then
						playerContextualMenuStoreModule.closeContextMenu()
						
						return
					else
					end
				end
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
		return function() end
	end, { var8, userInputServiceOverride, p5.isSmallTouchDevice })
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), var8 (ref), var11 (ref), var10 (ref), guiService (copy)
		if not p5.isSmallTouchDevice or not var8 or not var11 then
			return function() end
		elseif var10.current then
			guiService.SelectedCoreObject = var10.current
		end
		return function() end
	end, { var8, p5.isSmallTouchDevice, var11 })
	local var12 = reactModule.useMemo(function()
		-- upvalues: p5 (ref), var7 (ref), MENU_ZOOM_CLOSED_SCALE (copy)
		return if p5.isSmallTouchDevice then var7.offset:map(function(p6)
			-- upvalues: MENU_ZOOM_CLOSED_SCALE (copy)
			return 1 + (MENU_ZOOM_CLOSED_SCALE - 1) * p6
		end) else nil
	end, { p5.isSmallTouchDevice, var7.offset })
	local var13 = reactModule.useMemo(function()
		-- upvalues: p5 (ref), var4 (ref), var7 (ref)
		if p5.isSmallTouchDevice then
			local transparency = var4.Color.Stroke.Default.Transparency
			
			return var7.offset:map(function(p6)
				-- upvalues: transparency (ref)
				return transparency + (1 - transparency) * p6
			end)
		end
		return nil
	end, {
		p5.isSmallTouchDevice,
		var7.offset,
		var4.Color.Stroke.Default.Transparency
	})
	
	if not var7.shouldMount then
		return nil
	end
	local current = var6.current
	
	if current == nil then
		return nil
	end
	local anchorPosition = current.anchorPosition
	local vector2 = Vector2.new(0.5, 0.5)
	local uDim2 = UDim2.fromScale(0.5, 0.5)
	
	if not p5.isSmallTouchDevice and anchorPosition ~= nil then
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
			isInteractable = var8,
			rowRef = if i == 1 then var10 else nil
		})
	end
	local t_3
	local var14 = constantsModule.CONTEXT_MENU_WIDTH * var4.Config.UI.Scale
	local _ = nil
	
	if p5.isSmallTouchDevice then
		t_3 = table.clone(t_2)
		t_3.UIScale = reactModule.createElement("UIScale", { Scale = var12 })
		t_3.UIStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = var4.Color.Stroke.Default.Color3,
			Transparency = var13,
			Thickness = var4.Stroke.Standard
		})
	else
		t_3 = {
			SlideOffset = reactModule.createElement(view, {
				tag = "col align-x-left gap-xxsmall auto-y padding-small stroke-standard stroke-default radius-large",
				Position = var7.position,
				Size = UDim2.fromOffset(var14, 0),
				backgroundStyle = var5
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
			onActivated = if p5.isSmallTouchDevice and var8 then var1 else nil,
			stateLayer = t_1,
			selection = constantsModule.NOT_SELECTABLE
		}),
		Menu = reactModule.createElement(view, {
			ZIndex = 2,
			Visible = true,
			testId = "player-context-menu",
			AnchorPoint = vector2,
			Position = uDim2,
			Size = UDim2.fromOffset(var14, 0),
			ref = var9,
			GroupTransparency = if p5.isSmallTouchDevice then var7.offset else nil,
			selectionGroup = if p5.isSmallTouchDevice and var8 then constantsModule.CONSOLE_FOCUS_ISOLATE else nil,
			selection = constantsModule.NOT_SELECTABLE,
			tag = {
				["auto-y clip"] = not p5.isSmallTouchDevice,
				["col align-x-left gap-xxsmall auto-y padding-small radius-large"] = p5.isSmallTouchDevice
			},
			backgroundStyle = if p5.isSmallTouchDevice then var5 else nil,
			onActivated = if p5.isSmallTouchDevice then nil else var1,
			stateLayer = if p5.isSmallTouchDevice then nil else t_1
		}, t_3)
	})
end)