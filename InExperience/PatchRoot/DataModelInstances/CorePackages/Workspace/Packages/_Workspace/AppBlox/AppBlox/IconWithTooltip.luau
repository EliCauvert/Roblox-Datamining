local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local interactable = UIBloxModule.Core.Control.Interactable
local withHoverTooltip = UIBloxModule.App.Dialog.TooltipV2.withHoverTooltip
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local useDesignTokens = require(parent.Style).useDesignTokens
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent.RobloxAppEnums).UiMode
local getFFlagTenFootUiSupportSortHeaderTooltip = require(parent.SharedFlags).GetFFlagTenFootUiSupportSortHeaderTooltip
local fFlagLuaAppFixCursorHooks = require(parent.SharedFlags).FFlagLuaAppFixCursorHooks
game:DefineFastInt("TooltipHitboxMinSize", 26)
local luaAppGateTooltipPositionTracking = game:DefineFastFlag("LuaAppGateTooltipPositionTracking", false)
local info = images["icons/actions/info"]
local vector2 = Vector2.new(game:GetFastInt("TooltipHitboxMinSize"), game:GetFastInt("TooltipHitboxMinSize"))

return function(p1)
	-- upvalues: useUiModeInfo (ref), useDesignTokens (ref), luaAppGateTooltipPositionTracking (ref), reactModule (ref), getFFlagTenFootUiSupportSortHeaderTooltip (ref), fFlagLuaAppFixCursorHooks (ref), useCursor (ref), uiMode (ref), coreGuiService (ref), withHoverTooltip (ref), controlState (ref), imageSetLabel (ref), info (ref), interactable (ref), vector2 (ref)
	local var1 = useUiModeInfo()
	local var2 = useDesignTokens()
	local var3 = if luaAppGateTooltipPositionTracking then reactModule.useRef(false) else nil
	local var4 = if luaAppGateTooltipPositionTracking then reactModule.useRef(nil) else nil
	local color3 = var2.Color.Content.Emphasis.Color3
	local size600 = var2.Size.Size_600
	local circle = nil
	local size0 = nil
	
	if getFFlagTenFootUiSupportSortHeaderTooltip() then
		circle = var2.Radius.Circle
		size0 = var2.Size.Size_0
	end
	local var5 = if fFlagLuaAppFixCursorHooks and getFFlagTenFootUiSupportSortHeaderTooltip() then useCursor(UDim.new(0, circle), size0) else nil
	local var6 = var1.uiMode == uiMode.VR
	
	if var1.uiMode == uiMode.VR and not p1.supportVR then
		return nil
	elseif var1.uiMode == uiMode.TenFoot and not p1.supportTenFootUi then
		return nil
	end
	local size = p1.size or UDim2.new(0, size600, 0, size600)
	
	return withHoverTooltip({ useLargeDropShadow = true, bodyText = p1.hoverText }, {
		DisplayOrder = 10,
		delayTime = 0.2,
		preferredOrientation = p1.tooltipOrientation,
		guiTarget = coreGuiService,
		triggerPointName = p1.triggerPointName,
		disabled = var6
	}, function(p2, p3)
		-- upvalues: luaAppGateTooltipPositionTracking (copy), var3 (ref), controlState (copy), var4 (ref), reactModule (copy), size (ref), p1 (ref), fFlagLuaAppFixCursorHooks (copy), getFFlagTenFootUiSupportSortHeaderTooltip (copy), var5 (ref), useCursor (copy), circle (write), size0 (write), imageSetLabel (copy), info (copy), color3 (ref), interactable (copy), vector2 (copy)
		local _ = nil
		local _ = nil
		
		if luaAppGateTooltipPositionTracking then
			local var7 = function(p4)
				-- upvalues: var3 (copy), p2 (ref)
				if var3.current then
					p2(p4)
				end
			end
			
			local var8 = function(p4, p5)
				-- upvalues: var3 (copy), controlState (copy), var4 (copy), p2 (ref), p3 (ref)
				var3.current = if p5 ~= controlState.Hover then p5 == controlState.Selected else true
				
				if var3.current and var4.current then
					p2(var4.current)
				end
				p3(p4, p5)
			end
		else
			local var7 = p2
			local var8 = p3
		end
		return reactModule.createElement("Frame", {
			Size = size,
			BackgroundTransparency = 1,
			LayoutOrder = p1.layoutOrder,
			AnchorPoint = p1.anchorPoint,
			Position = p1.position,
			ref = if luaAppGateTooltipPositionTracking then var4 else nil,
			SelectionImageObject = if fFlagLuaAppFixCursorHooks and getFFlagTenFootUiSupportSortHeaderTooltip() then var5 elseif getFFlagTenFootUiSupportSortHeaderTooltip() then useCursor(UDim.new(0, circle), size0) else nil,
			[reactModule.Change.AbsolutePosition] = var7,
			[reactModule.Change.AbsoluteSize] = var7
		}, {
			TooltipIcon = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 0,
				Size = size,
				Image = p1.icon or info,
				ImageColor3 = p1.color or color3
			}),
			Hitbox = reactModule.createElement(interactable, {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				onStateChanged = var8,
				[reactModule.Event.Activated] = p1.onActivateTooltip,
				ZIndex = 1,
				Selectable = p1.selectable
			}, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = vector2 })
			})
		})
	end)
end