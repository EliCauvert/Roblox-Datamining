local CoreGui = game:GetService("CoreGui")
local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local WithHoverTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withHoverTooltip
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent.RobloxAppEnums).UiMode
local GetFFlagTenFootUiSupportSortHeaderTooltipFunction = require(Parent.SharedFlags).GetFFlagTenFootUiSupportSortHeaderTooltip
local FFlagLuaAppFixCursorHooks = require(Parent.SharedFlags).FFlagLuaAppFixCursorHooks
game:DefineFastInt("TooltipHitboxMinSize", 26)
local IconsActionsInfo = Images["icons/actions/info"]
local _Vector2 = Vector2.new(game:GetFastInt("TooltipHitboxMinSize"), game:GetFastInt("TooltipHitboxMinSize"))

return function(p1)
	-- upvalues: UseUiModeInfoFunction (copy), UseDesignTokensFunction (copy), GetFFlagTenFootUiSupportSortHeaderTooltipFunction (copy), FFlagLuaAppFixCursorHooks (copy), UseCursorFunction (copy), UiMode (copy), CoreGui (copy), WithHoverTooltipFunction (copy), ReactModule (copy), ImageSetLabel (copy), IconsActionsInfo (copy), Interactable (copy), _Vector2 (copy)
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local EmphasisColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3
	local Size600 = UseDesignTokensResult.Size.Size_600
	local Offset = nil
	local Size0 = nil
	
	if GetFFlagTenFootUiSupportSortHeaderTooltipFunction() then
		Offset = UseDesignTokensResult.Radius.Circle
		Size0 = UseDesignTokensResult.Size.Size_0
	end
	local UseCursorResult = if FFlagLuaAppFixCursorHooks and GetFFlagTenFootUiSupportSortHeaderTooltipFunction() then UseCursorFunction(UDim.new(0, Offset), Size0) else nil
	local IsUiModeMatch = UseUiModeInfoResult.uiMode == UiMode.VR
	
	if UseUiModeInfoResult.uiMode == UiMode.VR and not p1.supportVR then
		return nil
	elseif UseUiModeInfoResult.uiMode == UiMode.TenFoot and not p1.supportTenFootUi then
		return nil
	else
		local Size = p1.size or UDim2.new(0, Size600, 0, Size600)
		
		return WithHoverTooltipFunction({ useLargeDropShadow = true, bodyText = p1.hoverText }, {
			DisplayOrder = 10,
			delayTime = 0.2,
			preferredOrientation = p1.tooltipOrientation,
			guiTarget = CoreGui,
			triggerPointName = p1.triggerPointName,
			disabled = IsUiModeMatch
		}, function(p2, OnStateChanged)
			-- upvalues: ReactModule (upval), Size (copy), p1 (copy), FFlagLuaAppFixCursorHooks (upval), GetFFlagTenFootUiSupportSortHeaderTooltipFunction (upval), UseCursorResult (copy), UseCursorFunction (upval), Offset (ref), Size0 (ref), ImageSetLabel (upval), IconsActionsInfo (upval), EmphasisColor3 (copy), Interactable (upval), _Vector2 (upval)
			return ReactModule.createElement("Frame", {
				Size = Size,
				BackgroundTransparency = 1,
				LayoutOrder = p1.layoutOrder,
				AnchorPoint = p1.anchorPoint,
				Position = p1.position,
				SelectionImageObject = if FFlagLuaAppFixCursorHooks and GetFFlagTenFootUiSupportSortHeaderTooltipFunction() then UseCursorResult elseif GetFFlagTenFootUiSupportSortHeaderTooltipFunction() then UseCursorFunction(UDim.new(0, Offset), Size0) else nil,
				[ReactModule.Change.AbsolutePosition] = p2,
				[ReactModule.Change.AbsoluteSize] = p2
			}, {
				TooltipIcon = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ZIndex = 0,
					Size = Size,
					Image = p1.icon or IconsActionsInfo,
					ImageColor3 = p1.color or EmphasisColor3
				}),
				Hitbox = ReactModule.createElement(Interactable, {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					onStateChanged = OnStateChanged,
					[ReactModule.Event.Activated] = p1.onActivateTooltip,
					ZIndex = 1,
					Selectable = p1.selectable
				}, {
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MinSize = _Vector2 })
				})
			})
		end)
	end
end