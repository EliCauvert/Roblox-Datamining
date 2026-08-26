local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local reactOtterModule = require(parent.ReactOtter)
local tooltipModule = require(avatarExperienceControlBar.Components.Tooltip)
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local fFlagAXAddToolTipToIconItemMenu = require(parent.AvatarExperienceFlags).FFlagAXAddToolTipToIconItemMenu
local fFlagAXMigrateBuilderIcons = require(parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons
local isBuilderIcon = foundationModule.Utility.isBuilderIcon
local iconVariant = foundationModule.Enums.IconVariant
local useSemanticTokensModule = require(avatarExperienceControlBar.Hooks.useSemanticTokens)
local useHoverBindingModule = require(avatarExperienceControlBar.Hooks.useHoverBinding)
local var1 = if fFlagAXMigrateBuilderIcons then foundationModule.Enums.IconName.X else "icons/navigation/close"
local t = { dampingRatio = 1, frequency = 5 }

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useSemanticTokensModule (ref), useHoverBindingModule (ref), reactOtterModule (ref), fFlagAXMigrateBuilderIcons (ref), var1 (ref), iconVariant (ref), reactModule (ref), t (ref), fFlagAXAddToolTipToIconItemMenu (ref), foundationModule (ref), tooltipModule (ref), isBuilderIcon (ref)
	local var2 = useSemanticTokensModule()
	local var3, var4 = useHoverBindingModule()
	local var5, var6 = reactOtterModule.useAnimatedBinding(0)
	local isActive = p1.isActive or false
	local var7 = if p1.size then p1.size else var2.defaultIconContainerSize
	local var8 = if p1.iconSize then p1.iconSize elseif fFlagAXMigrateBuilderIcons then var2.defaultLegacyIconSize else var2.defaultIconSize
	local var9 = if p1.activeIcon then p1.activeIcon else var1
	local var10 = if fFlagAXMigrateBuilderIcons then if p1.activeIconVariant then p1.activeIconVariant else iconVariant.Regular else nil
	local var11 = if p1.activeIconSize then p1.activeIconSize elseif var9 == var1 then var2.closeIconSize else var8
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref), reactOtterModule (copy), isActive (ref), t (copy)
		if p1.animate then
			var6(reactOtterModule.spring(if isActive then 1 else 0, t))
			
			return
		end
		var6(reactOtterModule.instant(if isActive then 1 else 0))
	end, { isActive, p1.animate })
	
	if fFlagAXAddToolTipToIconItemMenu then
		local var12
		local createElement = reactModule.createElement
		local view = foundationModule.View
		local t_1 = {
			tag = "row align-x-center align-y-center",
			Size = UDim2.new(0, var7, 0, var7),
			LayoutOrder = p1.LayoutOrder
		}
		local t_2 = {}
		local createElement_1 = reactModule.createElement
		local var13 = tooltipModule
		local toolTipConfig = p1.toolTipConfig
		local createElement_2 = reactModule.createElement
		local view_1 = foundationModule.View
		local t_3 = {
			tag = "radius-circle",
			Size = UDim2.new(0, var7, 0, var7),
			onStateChanged = var4,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = p1.onActivated,
			disabled = p1.disabled,
			ref = p2,
			LayoutOrder = p1.LayoutOrder
		}
		local t_4 = {
			Icon = reactModule.createElement(foundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				Visible = if p1.isActive and not p1.animate then false else true,
				backgroundStyle = if p1.disabled then nil else var3:map(function(p3)
					-- upvalues: var2 (ref)
					return {
						Color3 = var2.hoverIconBackgroundStyle.Color3,
						Transparency = if p3 then var2.hoverIconBackgroundStyle.Transparency else 1
					}
				end),
				tag = if fFlagAXMigrateBuilderIcons then {
					["radius-circle position-center-center anchor-center-center clip"] = true,
					["row align-x-center align-y-center"] = isBuilderIcon(p1.icon)
				} else "radius-circle position-center-center anchor-center-center clip"
			}, {
				IconImage = if fFlagAXMigrateBuilderIcons and isBuilderIcon(p1.icon) then reactModule.createElement(foundationModule.Icon, {
					tag = "position-center-center anchor-center-center content-emphasis",
					name = p1.icon,
					size = var5:map(function(p3)
						-- upvalues: var8 (ref)
						return math.round((1 - p3) * var8)
					end),
					variant = if p1.iconVariant then p1.iconVariant else iconVariant.Regular,
					style = {
						Color3 = var2.contentForegroundStyle.Color3,
						Transparency = if p1.disabled then var2.contentDisabledTransparency else var2.contentForegroundStyle.Transparency
					}
				}) else reactModule.createElement(foundationModule.Image, {
					tag = "position-center-center anchor-center-center content-emphasis",
					Image = p1.icon,
					Size = var5:map(function(p3)
						-- upvalues: var8 (ref)
						local rounded = math.round((1 - p3) * var8)
						
						return UDim2.fromOffset(rounded, rounded)
					end),
					imageStyle = {
						Color3 = var2.contentForegroundStyle.Color3,
						Transparency = if p1.disabled then var2.contentDisabledTransparency else var2.contentForegroundStyle.Transparency
					}
				})
			})
		}
		
		if isActive or p1.animate then
			var12 = reactModule.createElement
			var12 = var12(foundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				GroupTransparency = var5:map(function(p3)
					return 1 - p3
				end),
				backgroundStyle = if p1.disabled then nil else var3:map(function(p3)
					-- upvalues: var2 (ref)
					return if p3 then var2.hoverIconBackgroundStyle else var2.activeIconBackgroundStyle
				end),
				tag = if fFlagAXMigrateBuilderIcons then {
					["radius-circle position-center-center anchor-center-center clip"] = true,
					["row align-x-center align-y-center"] = isBuilderIcon(var9)
				} else "radius-circle position-center-center anchor-center-center clip"
			}, {
				ActiveIconImage = if fFlagAXMigrateBuilderIcons and isBuilderIcon(var9) then reactModule.createElement(foundationModule.Icon, {
					tag = "size-full-full position-center-center anchor-center-center content-emphasis",
					name = var9,
					size = var5:map(function(p3)
						-- upvalues: var8 (ref)
						return math.round(p3 * var8)
					end),
					variant = var10,
					style = {
						Color3 = var2.contentForegroundStyle.Color3,
						Transparency = if p1.disabled then var2.contentDisabledTransparency else var2.contentForegroundStyle.Transparency
					}
				}) else reactModule.createElement(foundationModule.Image, {
					tag = "position-center-center anchor-center-center clip content-emphasis",
					Image = var9,
					Size = var5:map(function(p3)
						-- upvalues: var11 (ref)
						local rounded = math.round(p3 * var11)
						
						return UDim2.fromOffset(rounded, rounded)
					end)
				})
			})
		else
			var12 = nil
		end
		t_4.ActiveIcon = var12
		t_2.TooltipIconItem = createElement_1(var13, toolTipConfig, createElement_2(view_1, t_3, t_4))
		
		return createElement(view, t_1, t_2)
	else
		local var14
		local createElement = reactModule.createElement
		local view = foundationModule.View
		local t_1 = {
			tag = "radius-circle",
			Size = UDim2.new(0, var7, 0, var7),
			onStateChanged = var4,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = p1.onActivated,
			disabled = p1.disabled,
			ref = p2,
			LayoutOrder = p1.LayoutOrder
		}
		local t_2 = {
			Icon = reactModule.createElement(foundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				Visible = if p1.isActive and not p1.animate then false else true,
				backgroundStyle = if p1.disabled then nil else var3:map(function(p3)
					-- upvalues: var2 (ref)
					return {
						Color3 = var2.hoverIconBackgroundStyle.Color3,
						Transparency = if p3 then var2.hoverIconBackgroundStyle.Transparency else 1
					}
				end),
				tag = if fFlagAXMigrateBuilderIcons then {
					["radius-circle position-center-center anchor-center-center clip"] = true,
					["row align-x-center align-y-center"] = isBuilderIcon(p1.icon)
				} else "radius-circle position-center-center anchor-center-center clip"
			}, {
				IconImage = if fFlagAXMigrateBuilderIcons and isBuilderIcon(p1.icon) then reactModule.createElement(foundationModule.Icon, {
					tag = "position-center-center anchor-center-center content-emphasis",
					name = p1.icon,
					size = var5:map(function(p3)
						-- upvalues: var8 (ref)
						return math.round((1 - p3) * var8)
					end),
					variant = if p1.iconVariant then p1.iconVariant else iconVariant.Regular,
					style = {
						Color3 = var2.contentForegroundStyle.Color3,
						Transparency = if p1.disabled then var2.contentDisabledTransparency else var2.contentForegroundStyle.Transparency
					}
				}) else reactModule.createElement(foundationModule.Image, {
					tag = "position-center-center anchor-center-center content-emphasis",
					Image = p1.icon,
					Size = var5:map(function(p3)
						-- upvalues: var8 (ref)
						local rounded = math.round((1 - p3) * var8)
						
						return UDim2.fromOffset(rounded, rounded)
					end),
					imageStyle = {
						Color3 = var2.contentForegroundStyle.Color3,
						Transparency = if p1.disabled then var2.contentDisabledTransparency else var2.contentForegroundStyle.Transparency
					}
				})
			})
		}
		
		if isActive or p1.animate then
			var14 = reactModule.createElement
			var14 = var14(foundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				GroupTransparency = var5:map(function(p3)
					return 1 - p3
				end),
				backgroundStyle = if p1.disabled then nil else var3:map(function(p3)
					-- upvalues: var2 (ref)
					return if p3 then var2.hoverIconBackgroundStyle else var2.activeIconBackgroundStyle
				end),
				tag = if fFlagAXMigrateBuilderIcons then {
					["radius-circle position-center-center anchor-center-center clip"] = true,
					["row align-x-center align-y-center"] = isBuilderIcon(var9)
				} else "radius-circle position-center-center anchor-center-center clip"
			}, {
				ActiveIconImage = if fFlagAXMigrateBuilderIcons and isBuilderIcon(var9) then reactModule.createElement(foundationModule.Icon, {
					tag = "position-center-center anchor-center-center clip content-emphasis",
					name = var9,
					size = var5:map(function(p3)
						-- upvalues: var8 (ref)
						return math.round((1 - p3) * var8)
					end),
					variant = var10
				}) else reactModule.createElement(foundationModule.Image, {
					tag = "position-center-center anchor-center-center clip content-emphasis",
					Image = var9,
					Size = var5:map(function(p3)
						-- upvalues: var11 (ref)
						local rounded = math.round(p3 * var11)
						
						return UDim2.fromOffset(rounded, rounded)
					end)
				})
			})
		else
			var14 = nil
		end
		t_2.ActiveIcon = var14
		
		return createElement(view, t_1, t_2)
	end
end)