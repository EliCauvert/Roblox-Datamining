local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local interactable = UIBloxModule.Core.Control.Interactable
local withHoverTooltip = UIBloxModule.App.Dialog.TooltipV2.withHoverTooltip
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local useDesignTokens = require(parent.Style).useDesignTokens
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent.RobloxAppEnums).UiMode
local getFFlagTenFootUiSupportSortHeaderTooltip = require(parent.SharedFlags).GetFFlagTenFootUiSupportSortHeaderTooltip
local fFlagLuaAppFixCursorHooks = require(parent.SharedFlags).FFlagLuaAppFixCursorHooks
game:DefineFastInt("TooltipHitboxMinSize", 26)
local info = images["icons/actions/info"]
local vector2 = Vector2.new(game:GetFastInt("TooltipHitboxMinSize"), game:GetFastInt("TooltipHitboxMinSize"))

return function(p0) --[[ line: 42 | named "IconWithTooltip" ]]
	-- upvalues: useUiModeInfo (ref), useDesignTokens (ref), getFFlagTenFootUiSupportSortHeaderTooltip (ref), fFlagLuaAppFixCursorHooks (ref), useCursor (ref), uiMode (ref), coreGuiService (ref), withHoverTooltip (ref), reactModule (ref), imageSetLabel (ref), info (ref), interactable (ref), vector2 (ref)
	local var4 = useUiModeInfo()
	local var5 = useDesignTokens()
	local color3 = var5.Color.Content.Emphasis.Color3
	local size600 = var5.Size.Size_600
	local circle = nil
	local size0 = nil
	
	if getFFlagTenFootUiSupportSortHeaderTooltip() then
		circle = var5.Radius.Circle
		size0 = var5.Size.Size_0
	end
	local var6 = if fFlagLuaAppFixCursorHooks and getFFlagTenFootUiSupportSortHeaderTooltip() then useCursor(UDim.new(0, circle), size0) else nil
	local var7 = var4.uiMode == uiMode.VR
	
	if var4.uiMode == uiMode.VR and not p0.supportVR then
		return nil
	elseif var4.uiMode == uiMode.TenFoot and not p0.supportTenFootUi then
		return nil
	end
	local size = p0.size or UDim2.new(0, size600, 0, size600)
	
	return withHoverTooltip({ useLargeDropShadow = true, bodyText = p0.hoverText }, {
		DisplayOrder = 10,
		delayTime = 0.2,
		preferredOrientation = p0.tooltipOrientation,
		guiTarget = coreGuiService,
		triggerPointName = p0.triggerPointName,
		disabled = var7
	}, function(p1, p2) --[[ line: 81 ]]
		-- upvalues: reactModule (copy), size (ref), p0 (ref), fFlagLuaAppFixCursorHooks (copy), getFFlagTenFootUiSupportSortHeaderTooltip (copy), var6 (ref), useCursor (copy), circle (write), size0 (write), imageSetLabel (copy), info (copy), color3 (ref), interactable (copy), vector2 (copy)
		return reactModule.createElement("Frame", {
			Size = size,
			BackgroundTransparency = 1,
			LayoutOrder = p0.layoutOrder,
			AnchorPoint = p0.anchorPoint,
			Position = p0.position,
			SelectionImageObject = if fFlagLuaAppFixCursorHooks and getFFlagTenFootUiSupportSortHeaderTooltip() then var6 elseif getFFlagTenFootUiSupportSortHeaderTooltip() then useCursor(UDim.new(0, circle), size0) else nil,
			[reactModule.Change.AbsolutePosition] = p1,
			[reactModule.Change.AbsoluteSize] = p1
		}, {
			TooltipIcon = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 0,
				Size = size,
				Image = p0.icon or info,
				ImageColor3 = p0.color or color3
			}),
			Hitbox = reactModule.createElement(interactable, {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				onStateChanged = p2,
				[reactModule.Event.Activated] = p0.onActivateTooltip,
				ZIndex = 1,
				Selectable = p0.selectable
			}, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = vector2 })
			})
		})
	end)
end