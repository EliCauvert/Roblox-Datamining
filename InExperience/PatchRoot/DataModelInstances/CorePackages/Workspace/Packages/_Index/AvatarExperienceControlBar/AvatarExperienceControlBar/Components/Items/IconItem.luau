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
local var7 = if fFlagAXMigrateBuilderIcons then foundationModule.Enums.IconName.X else "icons/navigation/close"
local t = { dampingRatio = 1, frequency = 5 }

return reactModule.forwardRef(function(p0, p1) --[[ line: 44 | named "IconItem" ]]
	-- upvalues: useSemanticTokensModule (ref), useHoverBindingModule (ref), reactOtterModule (ref), fFlagAXMigrateBuilderIcons (ref), var7 (ref), iconVariant (ref), reactModule (ref), t (ref), fFlagAXAddToolTipToIconItemMenu (ref), foundationModule (ref), tooltipModule (ref), isBuilderIcon (ref)
	local var9 = useSemanticTokensModule()
	local var10, var11 = useHoverBindingModule()
	local var12, var13 = reactOtterModule.useAnimatedBinding(0)
	local isActive = p0.isActive or false
	local var15 = if p0.size then p0.size else var9.defaultIconContainerSize
	local var16 = if p0.iconSize then p0.iconSize elseif fFlagAXMigrateBuilderIcons then var9.defaultLegacyIconSize else var9.defaultIconSize
	local var17 = if p0.activeIcon then p0.activeIcon else var7
	local var18 = if fFlagAXMigrateBuilderIcons then if p0.activeIconVariant then p0.activeIconVariant else iconVariant.Regular else nil
	local var19 = if p0.activeIconSize then p0.activeIconSize elseif var17 == var7 then var9.closeIconSize else var16
	reactModule.useEffect(function() --[[ line: 64 ]]
		-- upvalues: p0 (ref), var13 (ref), reactOtterModule (copy), isActive (ref), t (copy)
		if p0.animate then
			var13(reactOtterModule.spring(if isActive then 1 else 0, t))
			
			return
		end
		var13(reactOtterModule.instant(if isActive then 1 else 0))
	end, { isActive, p0.animate })
	
	if fFlagAXAddToolTipToIconItemMenu then
		local var25
		local createElement = reactModule.createElement
		local view = foundationModule.View
		local t_1 = {
			tag = "row align-x-center align-y-center",
			Size = UDim2.new(0, var15, 0, var15),
			LayoutOrder = p0.LayoutOrder
		}
		local t_2 = {}
		local createElement_1 = reactModule.createElement
		local var22 = tooltipModule
		local toolTipConfig = p0.toolTipConfig
		local createElement_2 = reactModule.createElement
		local view_1 = foundationModule.View
		local t_3 = {
			tag = "radius-circle",
			Size = UDim2.new(0, var15, 0, var15),
			onStateChanged = var11,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = p0.onActivated,
			disabled = p0.disabled,
			ref = p1,
			LayoutOrder = p0.LayoutOrder
		}
		local t_4 = {
			Icon = reactModule.createElement(foundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				Visible = if p0.isActive and not p0.animate then false else true,
				backgroundStyle = if p0.disabled then nil else var10:map(function(p2) --[[ line: 98 ]]
					-- upvalues: var9 (ref)
					return {
						Color3 = var9.hoverIconBackgroundStyle.Color3,
						Transparency = if p2 then var9.hoverIconBackgroundStyle.Transparency else 1
					}
				end),
				tag = if fFlagAXMigrateBuilderIcons then {
					["radius-circle position-center-center anchor-center-center clip"] = true,
					["row align-x-center align-y-center"] = isBuilderIcon(p0.icon)
				} else "radius-circle position-center-center anchor-center-center clip"
			}, {
				IconImage = if fFlagAXMigrateBuilderIcons and isBuilderIcon(p0.icon) then reactModule.createElement(foundationModule.Icon, {
					tag = "position-center-center anchor-center-center content-emphasis",
					name = p0.icon,
					size = var12:map(function(p4) --[[ line: 114 ]]
						-- upvalues: var16 (ref)
						return math.round((1 - p4) * var16)
					end),
					variant = if p0.iconVariant then p0.iconVariant else iconVariant.Regular,
					style = {
						Color3 = var9.contentForegroundStyle.Color3,
						Transparency = if p0.disabled then var9.contentDisabledTransparency else var9.contentForegroundStyle.Transparency
					}
				}) else reactModule.createElement(foundationModule.Image, {
					tag = "position-center-center anchor-center-center content-emphasis",
					Image = p0.icon,
					Size = var12:map(function(p3) --[[ line: 129 ]]
						-- upvalues: var16 (ref)
						local rounded = math.round((1 - p3) * var16)
						
						return UDim2.fromOffset(rounded, rounded)
					end),
					imageStyle = {
						Color3 = var9.contentForegroundStyle.Color3,
						Transparency = if p0.disabled then var9.contentDisabledTransparency else var9.contentForegroundStyle.Transparency
					}
				})
			})
		}
		
		if isActive or p0.animate then
			var25 = reactModule.createElement
			var25 = var25(foundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				GroupTransparency = var12:map(function(p5) --[[ line: 145 ]]
					return 1 - p5
				end),
				backgroundStyle = if p0.disabled then nil else var10:map(function(p6) --[[ line: 150 ]]
					-- upvalues: var9 (ref)
					return if p6 then var9.hoverIconBackgroundStyle else var9.activeIconBackgroundStyle
				end),
				tag = if fFlagAXMigrateBuilderIcons then {
					["radius-circle position-center-center anchor-center-center clip"] = true,
					["row align-x-center align-y-center"] = isBuilderIcon(var17)
				} else "radius-circle position-center-center anchor-center-center clip"
			}, {
				ActiveIconImage = if fFlagAXMigrateBuilderIcons and isBuilderIcon(var17) then reactModule.createElement(foundationModule.Icon, {
					tag = "size-full-full position-center-center anchor-center-center content-emphasis",
					name = var17,
					size = var12:map(function(p8) --[[ line: 166 ]]
						-- upvalues: var16 (ref)
						return math.round(p8 * var16)
					end),
					variant = var18,
					style = {
						Color3 = var9.contentForegroundStyle.Color3,
						Transparency = if p0.disabled then var9.contentDisabledTransparency else var9.contentForegroundStyle.Transparency
					}
				}) else reactModule.createElement(foundationModule.Image, {
					tag = "position-center-center anchor-center-center clip content-emphasis",
					Image = var17,
					Size = var12:map(function(p7) --[[ line: 181 ]]
						-- upvalues: var19 (ref)
						local rounded = math.round(p7 * var19)
						
						return UDim2.fromOffset(rounded, rounded)
					end)
				})
			})
		else
			var25 = nil
		end
		t_4.ActiveIcon = var25
		t_2.TooltipIconItem = createElement_1(var22, toolTipConfig, createElement_2(view_1, t_3, t_4))
		
		return createElement(view, t_1, t_2)
	else
		local var28
		local createElement = reactModule.createElement
		local view = foundationModule.View
		local t_1 = {
			tag = "radius-circle",
			Size = UDim2.new(0, var15, 0, var15),
			onStateChanged = var11,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = p0.onActivated,
			disabled = p0.disabled,
			ref = p1,
			LayoutOrder = p0.LayoutOrder
		}
		local t_2 = {
			Icon = reactModule.createElement(foundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				Visible = if p0.isActive and not p0.animate then false else true,
				backgroundStyle = if p0.disabled then nil else var10:map(function(p9) --[[ line: 210 ]]
					-- upvalues: var9 (ref)
					return {
						Color3 = var9.hoverIconBackgroundStyle.Color3,
						Transparency = if p9 then var9.hoverIconBackgroundStyle.Transparency else 1
					}
				end),
				tag = if fFlagAXMigrateBuilderIcons then {
					["radius-circle position-center-center anchor-center-center clip"] = true,
					["row align-x-center align-y-center"] = isBuilderIcon(p0.icon)
				} else "radius-circle position-center-center anchor-center-center clip"
			}, {
				IconImage = if fFlagAXMigrateBuilderIcons and isBuilderIcon(p0.icon) then reactModule.createElement(foundationModule.Icon, {
					tag = "position-center-center anchor-center-center content-emphasis",
					name = p0.icon,
					size = var12:map(function(p11) --[[ line: 226 ]]
						-- upvalues: var16 (ref)
						return math.round((1 - p11) * var16)
					end),
					variant = if p0.iconVariant then p0.iconVariant else iconVariant.Regular,
					style = {
						Color3 = var9.contentForegroundStyle.Color3,
						Transparency = if p0.disabled then var9.contentDisabledTransparency else var9.contentForegroundStyle.Transparency
					}
				}) else reactModule.createElement(foundationModule.Image, {
					tag = "position-center-center anchor-center-center content-emphasis",
					Image = p0.icon,
					Size = var12:map(function(p10) --[[ line: 241 ]]
						-- upvalues: var16 (ref)
						local rounded = math.round((1 - p10) * var16)
						
						return UDim2.fromOffset(rounded, rounded)
					end),
					imageStyle = {
						Color3 = var9.contentForegroundStyle.Color3,
						Transparency = if p0.disabled then var9.contentDisabledTransparency else var9.contentForegroundStyle.Transparency
					}
				})
			})
		}
		
		if isActive or p0.animate then
			var28 = reactModule.createElement
			var28 = var28(foundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				GroupTransparency = var12:map(function(p12) --[[ line: 257 ]]
					return 1 - p12
				end),
				backgroundStyle = if p0.disabled then nil else var10:map(function(p13) --[[ line: 262 ]]
					-- upvalues: var9 (ref)
					return if p13 then var9.hoverIconBackgroundStyle else var9.activeIconBackgroundStyle
				end),
				tag = if fFlagAXMigrateBuilderIcons then {
					["radius-circle position-center-center anchor-center-center clip"] = true,
					["row align-x-center align-y-center"] = isBuilderIcon(var17)
				} else "radius-circle position-center-center anchor-center-center clip"
			}, {
				ActiveIconImage = if fFlagAXMigrateBuilderIcons and isBuilderIcon(var17) then reactModule.createElement(foundationModule.Icon, {
					tag = "position-center-center anchor-center-center clip content-emphasis",
					name = var17,
					size = var12:map(function(p15) --[[ line: 278 ]]
						-- upvalues: var16 (ref)
						return math.round((1 - p15) * var16)
					end),
					variant = var18
				}) else reactModule.createElement(foundationModule.Image, {
					tag = "position-center-center anchor-center-center clip content-emphasis",
					Image = var17,
					Size = var12:map(function(p14) --[[ line: 287 ]]
						-- upvalues: var19 (ref)
						local rounded = math.round(p14 * var19)
						
						return UDim2.fromOffset(rounded, rounded)
					end)
				})
			})
		else
			var28 = nil
		end
		t_2.ActiveIcon = var28
		
		return createElement(view, t_1, t_2)
	end
end)