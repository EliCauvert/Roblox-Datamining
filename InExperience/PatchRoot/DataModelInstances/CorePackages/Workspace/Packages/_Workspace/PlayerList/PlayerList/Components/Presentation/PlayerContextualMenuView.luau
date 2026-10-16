local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PlayerContextualMenuStoreModule = require(Parent.Common.PlayerContextualMenuStore)
local PlayerContextMenuHeaderModule = require(Parent.Components.Presentation.PlayerContextMenuHeader)
local MenuActionRowModule = require(Parent.Components.Presentation.MenuActionRow)
local UsePreferredBackgroundStyleModule = require(Parent.Hooks.usePreferredBackgroundStyle)
local ConstantsModule = require(Parent.Common.Constants)
local UseSlideOpenCloseAnimationModule = require(Parent.Hooks.useSlideOpenCloseAnimation)
local UseSlideOpenCloseAnimationFunction = UseSlideOpenCloseAnimationModule.useSlideOpenCloseAnimation
local MENUSLIDECONFIG = UseSlideOpenCloseAnimationModule.MENU_SLIDE_CONFIG
local MENUZOOMCLOSEDSCALE = UseSlideOpenCloseAnimationModule.MENU_ZOOM_CLOSED_SCALE
local BackgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

local function v20() --[[ Line: 35 ]] end

local function _(Frame: Frame, Vector): boolean --[[ Line: 37 | Named "isPositionInsideGuiObject" ]]
	local AbsolutePosition = Frame.AbsolutePosition
	local AbsoluteSize = Frame.AbsoluteSize
	
	return AbsolutePosition.X <= Vector.X and (Vector.X <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= Vector.Y) and Vector.Y <= AbsolutePosition.Y + AbsoluteSize.Y
end

local function isPositionOnMenu(Frame: Frame, Vector): boolean --[[ Line: 47 ]]
	local AbsolutePosition = Frame.AbsolutePosition
	local AbsoluteSize = Frame.AbsoluteSize
	
	if AbsolutePosition.X <= Vector.X and (Vector.X <= AbsolutePosition.X + AbsoluteSize.X and (AbsolutePosition.Y <= Vector.Y and Vector.Y <= AbsolutePosition.Y + AbsoluteSize.Y)) then
		return true
	end
	for _, Gui in Frame:GetDescendants() do
		if Gui:IsA("GuiObject") and Gui.Visible then
			local AbsolutePosition1 = Gui.AbsolutePosition
			local AbsoluteSize1 = Gui.AbsoluteSize
			
			if AbsolutePosition1.X <= Vector.X and (Vector.X <= AbsolutePosition1.X + AbsoluteSize1.X and (AbsolutePosition1.Y <= Vector.Y and Vector.Y <= AbsolutePosition1.Y + AbsoluteSize1.Y)) then
				return true
			end
		end
	end
	return false
end

local function isPositionOnRow(Frame: Frame, Vector): boolean --[[ Line: 64 ]]
	local AbsolutePosition = Frame.AbsolutePosition
	local AbsoluteSize = Frame.AbsoluteSize
	
	if AbsolutePosition.X > Vector.X or (Vector.X > AbsolutePosition.X + AbsoluteSize.X or (AbsolutePosition.Y > Vector.Y or Vector.Y > AbsolutePosition.Y + AbsoluteSize.Y)) then
		return false
	end
	local Parent = Frame.Parent
	while Parent ~= nil and Parent:IsA("GuiObject") do
		local Frame1 = Parent
		
		if Frame1.ClipsDescendants then
			local AbsolutePosition1 = Frame1.AbsolutePosition
			local AbsoluteSize1 = Frame1.AbsoluteSize
			
			if AbsolutePosition1.X > Vector.X or (Vector.X > AbsolutePosition1.X + AbsoluteSize1.X or (AbsolutePosition1.Y > Vector.Y or Vector.Y > AbsolutePosition1.Y + AbsoluteSize1.Y)) then
				return false
			end
		end
		Parent = Frame1.Parent
	end
	return true
end

local _ = function(): boolean --[[ Line: 82 | Named "isGamepad" ]]
	-- upvalues: UserInputService (copy)
	return UserInputService:GetLastInputType().Name:find("Gamepad") ~= nil
end

return ReactModule.memo(function(p1) --[[ Line: 86 | Named "PlayerContextualMenuView" ]]
	-- upvalues: SignalsReactModule (copy), PlayerContextualMenuStoreModule (copy), UseTokensFunction (copy), UsePreferredBackgroundStyleModule (copy), ReactModule (copy), UseSlideOpenCloseAnimationFunction (copy), MENUSLIDECONFIG (copy), UserInputService (copy), ContextActionService (copy), isPositionOnMenu (copy), isPositionOnRow (copy), GuiService (copy), MENUZOOMCLOSEDSCALE (copy), PlayerContextMenuHeaderModule (copy), Divider (copy), MenuActionRowModule (copy), ConstantsModule (copy), View (copy), BackgroundStyle (copy), v20 (copy), StateLayer (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PlayerContextualMenuStoreModule.getMenuData)
	local UseTokensResult = UseTokensFunction()
	local UsePreferredBackgroundStyleModuleResult = UsePreferredBackgroundStyleModule(UseTokensResult.Color.OverMedia.OverMedia_100)
	local UseRefResult = ReactModule.useRef(UseSignalStateResult)
	
	if UseSignalStateResult ~= nil then
		UseRefResult.current = UseSignalStateResult
	end
	local UseSlideOpenCloseAnimationResult = UseSlideOpenCloseAnimationFunction(UseSignalStateResult ~= nil, MENUSLIDECONFIG, if UseSignalStateResult then UseSignalStateResult.player.UserId else nil)
	local HasUseSignalStateResult = UseSignalStateResult ~= nil
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local ContextActionServiceOverride = p1.contextActionServiceOverride
	local HasGamepad = if p1.isGamepadOverride == nil then UserInputService:GetLastInputType().Name:find("Gamepad") ~= nil else p1.isGamepadOverride
	ReactModule.useEffect(function() --[[ Line: 124 ]]
		-- upvalues: p1 (copy), HasUseSignalStateResult (copy), ContextActionServiceOverride (copy), ContextActionService (upval), PlayerContextualMenuStoreModule (upval)
		if p1.isSmallTouchDevice and HasUseSignalStateResult then
			local ContextActionServiceOverride1 = ContextActionServiceOverride or ContextActionService
			ContextActionServiceOverride1:BindCoreAction("RbxPlayerListReskinGamepadMenuClose", function(_, UserInputState, _) --[[ Line: 129 ]]
				-- upvalues: PlayerContextualMenuStoreModule (upval)
				if UserInputState == Enum.UserInputState.Begin then
					PlayerContextualMenuStoreModule.closeContextMenu()
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonB)
			
			return function() --[[ Line: 136 ]]
				-- upvalues: ContextActionServiceOverride1 (copy)
				ContextActionServiceOverride1:UnbindCoreAction("RbxPlayerListReskinGamepadMenuClose")
			end
		else
			return function() --[[ Line: 126 ]] end
		end
	end, {
		HasUseSignalStateResult,
		p1.isSmallTouchDevice,
		ContextActionServiceOverride
	})
	local UserInputServiceOverride = p1.userInputServiceOverride
	ReactModule.useEffect(function() --[[ Line: 144 ]]
		-- upvalues: HasUseSignalStateResult (copy), UserInputServiceOverride (copy), UserInputService (upval), UseRefResult1 (copy), isPositionOnMenu (upval), p1 (copy), PlayerContextualMenuStoreModule (upval), isPositionOnRow (upval)
		if HasUseSignalStateResult then
			local InputBeganConnection = (UserInputServiceOverride or UserInputService).InputBegan:Connect(function(Input) --[[ Line: 149 ]]
				-- upvalues: UseRefResult1 (upval), isPositionOnMenu (upval), p1 (upval), PlayerContextualMenuStoreModule (upval), isPositionOnRow (upval)
				local UserInputType = Input.UserInputType
				
				if UserInputType ~= Enum.UserInputType.Touch and UserInputType ~= Enum.UserInputType.MouseButton1 then return end
				local Current = UseRefResult1.current
				
				if Current ~= nil and isPositionOnMenu(Current, Input.Position) then return end
				if not p1.isSmallTouchDevice then
					local AnchorRow = PlayerContextualMenuStoreModule.getAnchorRow()
					
					if AnchorRow ~= nil and isPositionOnRow(AnchorRow, Input.Position) then return end
				end
				PlayerContextualMenuStoreModule.closeContextMenu()
			end)
			
			return function() --[[ Line: 169 ]]
				-- upvalues: InputBeganConnection (copy)
				InputBeganConnection:Disconnect()
			end
		else
			return function() --[[ Line: 146 ]] end
		end
	end, {
		HasUseSignalStateResult,
		UserInputServiceOverride,
		p1.isSmallTouchDevice
	})
	ReactModule.useEffect(function() --[[ Line: 174 ]]
		-- upvalues: p1 (copy), HasUseSignalStateResult (copy), HasGamepad (copy), UseRefResult2 (copy), GuiService (upval)
		if not p1.isSmallTouchDevice or not HasUseSignalStateResult or not HasGamepad then
			return function() --[[ Line: 176 ]] end
		end
		if UseRefResult2.current then
			GuiService.SelectedCoreObject = UseRefResult2.current
		end
		return function() --[[ Line: 181 ]] end
	end, {
		HasUseSignalStateResult,
		p1.isSmallTouchDevice,
		HasGamepad
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 184 ]]
		-- upvalues: p1 (copy), UseSlideOpenCloseAnimationResult (copy), MENUZOOMCLOSEDSCALE (upval)
		return if p1.isSmallTouchDevice then UseSlideOpenCloseAnimationResult.offset:map(function(p2): number --[[ Line: 188 ]]
			-- upvalues: MENUZOOMCLOSEDSCALE (upval)
			return 1 + (MENUZOOMCLOSEDSCALE - 1) * p2
		end) else nil
	end, {
		p1.isSmallTouchDevice,
		UseSlideOpenCloseAnimationResult.offset
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 193 ]]
		-- upvalues: p1 (copy), UseTokensResult (copy), UseSlideOpenCloseAnimationResult (copy)
		if p1.isSmallTouchDevice then
			local Transparency = UseTokensResult.Color.Stroke.Default.Transparency
			
			return UseSlideOpenCloseAnimationResult.offset:map(function(p2): number --[[ Line: 198 ]]
				-- upvalues: Transparency (copy)
				return Transparency + (1 - Transparency) * p2
			end)
		else
			return nil
		end
	end, {
		p1.isSmallTouchDevice,
		UseSlideOpenCloseAnimationResult.offset,
		UseTokensResult.Color.Stroke.Default.Transparency
	})
	
	if not UseSlideOpenCloseAnimationResult.shouldMount then
		return nil
	end
	local Current = UseRefResult.current
	
	if Current == nil then
		return nil
	end
	local AnchorPosition = Current.anchorPosition
	local _Vector2 = Vector2.new(0.5, 0.5)
	local _UDim2 = UDim2.fromScale(0.5, 0.5)
	
	if not p1.isSmallTouchDevice and AnchorPosition ~= nil then
		_Vector2 = Vector2.new(1, 0)
		_UDim2 = UDim2.fromOffset(AnchorPosition.X - 8, AnchorPosition.Y)
	end
	local config = {
		Header = ReactModule.createElement(PlayerContextMenuHeaderModule, {
			layoutOrder = 1,
			header = Current.header,
			player = Current.player
		}),
		HeaderDivider = ReactModule.createElement(Divider, { LayoutOrder = 2 })
	}
	
	for i, item in ipairs(Current.items) do
		config[`Action_{tostring(item.key)}`] = ReactModule.createElement(MenuActionRowModule, {
			item = item,
			layoutOrder = 2 + i,
			isInteractable = HasUseSignalStateResult,
			rowRef = if i == 1 then UseRefResult2 else nil
		})
	end
	local ScaledCONTEXTMENUWIDTH = ConstantsModule.CONTEXT_MENU_WIDTH * UseTokensResult.Config.UI.Scale
	local Copy = nil
	
	if p1.isSmallTouchDevice then
		Copy = table.clone(config)
		Copy.UIScale = ReactModule.createElement("UIScale", { Scale = UseMemoResult })
		Copy.UIStroke = ReactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = UseTokensResult.Color.Stroke.Default.Color3,
			Transparency = UseMemoResult1,
			Thickness = UseTokensResult.Stroke.Standard
		})
	else
		Copy = {
			SlideOffset = ReactModule.createElement(View, {
				tag = "col align-x-left gap-xxsmall auto-y padding-small stroke-standard stroke-default radius-large",
				Position = UseSlideOpenCloseAnimationResult.position,
				Size = UDim2.fromOffset(ScaledCONTEXTMENUWIDTH, 0),
				backgroundStyle = UsePreferredBackgroundStyleModuleResult
			}, config)
		}
	end
	return ReactModule.createElement(View, {
		ZIndex = 10,
		tag = "size-full",
		backgroundStyle = BackgroundStyle,
		selection = ConstantsModule.NOT_SELECTABLE
	}, {
		Backdrop = ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = 1,
			backgroundStyle = BackgroundStyle,
			onActivated = if p1.isSmallTouchDevice and HasUseSignalStateResult then v20 else nil,
			stateLayer = StateLayer,
			selection = ConstantsModule.NOT_SELECTABLE
		}),
		Menu = ReactModule.createElement(View, {
			ZIndex = 2,
			Visible = true,
			testId = "player-context-menu",
			AnchorPoint = _Vector2,
			Position = _UDim2,
			Size = UDim2.fromOffset(ScaledCONTEXTMENUWIDTH, 0),
			ref = UseRefResult1,
			GroupTransparency = if p1.isSmallTouchDevice then UseSlideOpenCloseAnimationResult.offset else nil,
			selectionGroup = if p1.isSmallTouchDevice and HasUseSignalStateResult then ConstantsModule.CONSOLE_FOCUS_ISOLATE else nil,
			selection = ConstantsModule.NOT_SELECTABLE,
			tag = {
				["auto-y clip"] = not p1.isSmallTouchDevice,
				["col align-x-left gap-xxsmall auto-y padding-small radius-large"] = p1.isSmallTouchDevice
			},
			backgroundStyle = if p1.isSmallTouchDevice then UsePreferredBackgroundStyleModuleResult else nil,
			onActivated = if p1.isSmallTouchDevice then nil else v20,
			stateLayer = if p1.isSmallTouchDevice then nil else StateLayer
		}, Copy)
	})
end)