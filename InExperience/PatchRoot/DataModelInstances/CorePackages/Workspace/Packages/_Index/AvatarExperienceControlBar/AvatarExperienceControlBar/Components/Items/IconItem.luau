local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ReactOtterModule = require(Parent.ReactOtter)
local TooltipModule = require(AvatarExperienceControlBar.Components.Tooltip)
local _ = require(AvatarExperienceControlBar.ControlBarTypes)
local FFlagAXAddToolTipToIconItemMenu = require(Parent.AvatarExperienceFlags).FFlagAXAddToolTipToIconItemMenu
local FFlagAXMigrateBuilderIcons = require(Parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons
local IsBuilderIconFunction = FoundationModule.Utility.isBuilderIcon
local IconVariant = FoundationModule.Enums.IconVariant
local UseSemanticTokensModule = require(AvatarExperienceControlBar.Hooks.useSemanticTokens)
local UseHoverBindingModule = require(AvatarExperienceControlBar.Hooks.useHoverBinding)
local X = if FFlagAXMigrateBuilderIcons then FoundationModule.Enums.IconName.X else "icons/navigation/close"
local config = { dampingRatio = 1, frequency = 5 }

return ReactModule.forwardRef(function(Frame: Frame, Ref) --[[ Line: 44 | Named "IconItem" ]]
	-- upvalues: UseSemanticTokensModule (copy), UseHoverBindingModule (copy), ReactOtterModule (copy), FFlagAXMigrateBuilderIcons (copy), X (copy), IconVariant (copy), ReactModule (copy), config (copy), FFlagAXAddToolTipToIconItemMenu (copy), FoundationModule (copy), TooltipModule (copy), IsBuilderIconFunction (copy)
	local UseSemanticTokensModuleResult = UseSemanticTokensModule()
	local UseHoverBindingModuleResult, UseHoverBindingModuleResult2 = UseHoverBindingModule()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local IsActive = Frame.isActive or false
	local Size = if Frame.size then Frame.size else UseSemanticTokensModuleResult.defaultIconContainerSize
	local IconSize = if Frame.iconSize then Frame.iconSize elseif FFlagAXMigrateBuilderIcons then UseSemanticTokensModuleResult.defaultLegacyIconSize else UseSemanticTokensModuleResult.defaultIconSize
	local ActiveIcon = if Frame.activeIcon then Frame.activeIcon else X
	local ActiveIconVariant = if FFlagAXMigrateBuilderIcons then if Frame.activeIconVariant then Frame.activeIconVariant else IconVariant.Regular else nil
	local ActiveIconSize = if Frame.activeIconSize then Frame.activeIconSize elseif ActiveIcon == X then UseSemanticTokensModuleResult.closeIconSize else IconSize
	ReactModule.useEffect(function() --[[ Line: 64 ]]
		-- upvalues: Frame (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), IsActive (copy), config (upval)
		if Frame.animate then
			UseAnimatedBindingResult2(ReactOtterModule.spring(if IsActive then 1 else 0, config))
			
			return
		else
			UseAnimatedBindingResult2((ReactOtterModule.instant(if IsActive then 1 else 0)))
		end
	end, { IsActive, Frame.animate })
	
	return if FFlagAXAddToolTipToIconItemMenu then ReactModule.createElement(FoundationModule.View, {
		tag = "row align-x-center align-y-center",
		Size = UDim2.new(0, Size, 0, Size),
		LayoutOrder = Frame.LayoutOrder
	}, {
		TooltipIconItem = ReactModule.createElement(TooltipModule, Frame.toolTipConfig, ReactModule.createElement(FoundationModule.View, {
			tag = "radius-circle",
			Size = UDim2.new(0, Size, 0, Size),
			onStateChanged = UseHoverBindingModuleResult2,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = Frame.onActivated,
			disabled = Frame.disabled,
			ref = Ref,
			LayoutOrder = Frame.LayoutOrder
		}, {
			Icon = ReactModule.createElement(FoundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				Visible = not Frame.isActive or Frame.animate,
				backgroundStyle = if Frame.disabled then nil else UseHoverBindingModuleResult:map(function(p1) --[[ Line: 98 ]]
					-- upvalues: UseSemanticTokensModuleResult (copy)
					return {
						Color3 = UseSemanticTokensModuleResult.hoverIconBackgroundStyle.Color3,
						Transparency = if p1 then UseSemanticTokensModuleResult.hoverIconBackgroundStyle.Transparency else 1
					}
				end),
				tag = if FFlagAXMigrateBuilderIcons then {
					["radius-circle position-center-center anchor-center-center clip"] = true,
					["row align-x-center align-y-center"] = IsBuilderIconFunction(Frame.icon)
				} else "radius-circle position-center-center anchor-center-center clip"
			}, {
				IconImage = if FFlagAXMigrateBuilderIcons and IsBuilderIconFunction(Frame.icon) then ReactModule.createElement(FoundationModule.Icon, {
					tag = "position-center-center anchor-center-center content-emphasis",
					name = Frame.icon,
					size = UseAnimatedBindingResult:map(function(p1: number): number --[[ Line: 114 ]]
						-- upvalues: IconSize (copy)
						return (math.round((1 - p1) * IconSize))
					end),
					variant = if Frame.iconVariant then Frame.iconVariant else IconVariant.Regular,
					style = {
						Color3 = UseSemanticTokensModuleResult.contentForegroundStyle.Color3,
						Transparency = if Frame.disabled then UseSemanticTokensModuleResult.contentDisabledTransparency else UseSemanticTokensModuleResult.contentForegroundStyle.Transparency
					}
				}) else ReactModule.createElement(FoundationModule.Image, {
					tag = "position-center-center anchor-center-center content-emphasis",
					Image = Frame.icon,
					Size = UseAnimatedBindingResult:map(function(p1: number): UDim2 --[[ Line: 129 ]]
						-- upvalues: IconSize (copy)
						local Rounded = math.round((1 - p1) * IconSize)
						
						return UDim2.fromOffset(Rounded, Rounded)
					end),
					imageStyle = {
						Color3 = UseSemanticTokensModuleResult.contentForegroundStyle.Color3,
						Transparency = if Frame.disabled then UseSemanticTokensModuleResult.contentDisabledTransparency else UseSemanticTokensModuleResult.contentForegroundStyle.Transparency
					}
				})
			}),
			ActiveIcon = if IsActive or Frame.animate then ReactModule.createElement(FoundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				GroupTransparency = UseAnimatedBindingResult:map(function(p1: number): number --[[ Line: 145 ]]
					return 1 - p1
				end),
				backgroundStyle = if Frame.disabled then nil else UseHoverBindingModuleResult:map(function(p1) --[[ Line: 150 ]]
					-- upvalues: UseSemanticTokensModuleResult (copy)
					return if p1 then UseSemanticTokensModuleResult.hoverIconBackgroundStyle else UseSemanticTokensModuleResult.activeIconBackgroundStyle
				end),
				tag = if FFlagAXMigrateBuilderIcons then {
					["radius-circle position-center-center anchor-center-center clip"] = true,
					["row align-x-center align-y-center"] = IsBuilderIconFunction(ActiveIcon)
				} else "radius-circle position-center-center anchor-center-center clip"
			}, {
				ActiveIconImage = if FFlagAXMigrateBuilderIcons and IsBuilderIconFunction(ActiveIcon) then ReactModule.createElement(FoundationModule.Icon, {
					tag = "size-full-full position-center-center anchor-center-center content-emphasis",
					name = ActiveIcon,
					size = UseAnimatedBindingResult:map(function(p1): number --[[ Line: 166 ]]
						-- upvalues: IconSize (copy)
						return (math.round(p1 * IconSize))
					end),
					variant = ActiveIconVariant,
					style = {
						Color3 = UseSemanticTokensModuleResult.contentForegroundStyle.Color3,
						Transparency = if Frame.disabled then UseSemanticTokensModuleResult.contentDisabledTransparency else UseSemanticTokensModuleResult.contentForegroundStyle.Transparency
					}
				}) else ReactModule.createElement(FoundationModule.Image, {
					tag = "position-center-center anchor-center-center clip content-emphasis",
					Image = ActiveIcon,
					Size = UseAnimatedBindingResult:map(function(p1): UDim2 --[[ Line: 181 ]]
						-- upvalues: ActiveIconSize (copy)
						local Rounded = math.round(p1 * ActiveIconSize)
						
						return UDim2.fromOffset(Rounded, Rounded)
					end)
				})
			}) else nil
		}))
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = "radius-circle",
		Size = UDim2.new(0, Size, 0, Size),
		onStateChanged = UseHoverBindingModuleResult2,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		onActivated = Frame.onActivated,
		disabled = Frame.disabled,
		ref = Ref,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Icon = ReactModule.createElement(FoundationModule.View, {
			Size = UDim2.fromScale(1, 1),
			Visible = not Frame.isActive or Frame.animate,
			backgroundStyle = if Frame.disabled then nil else UseHoverBindingModuleResult:map(function(p1) --[[ Line: 210 ]]
				-- upvalues: UseSemanticTokensModuleResult (copy)
				return {
					Color3 = UseSemanticTokensModuleResult.hoverIconBackgroundStyle.Color3,
					Transparency = if p1 then UseSemanticTokensModuleResult.hoverIconBackgroundStyle.Transparency else 1
				}
			end),
			tag = if FFlagAXMigrateBuilderIcons then {
				["radius-circle position-center-center anchor-center-center clip"] = true,
				["row align-x-center align-y-center"] = IsBuilderIconFunction(Frame.icon)
			} else "radius-circle position-center-center anchor-center-center clip"
		}, {
			IconImage = if FFlagAXMigrateBuilderIcons and IsBuilderIconFunction(Frame.icon) then ReactModule.createElement(FoundationModule.Icon, {
				tag = "position-center-center anchor-center-center content-emphasis",
				name = Frame.icon,
				size = UseAnimatedBindingResult:map(function(p1: number): number --[[ Line: 226 ]]
					-- upvalues: IconSize (copy)
					return (math.round((1 - p1) * IconSize))
				end),
				variant = if Frame.iconVariant then Frame.iconVariant else IconVariant.Regular,
				style = {
					Color3 = UseSemanticTokensModuleResult.contentForegroundStyle.Color3,
					Transparency = if Frame.disabled then UseSemanticTokensModuleResult.contentDisabledTransparency else UseSemanticTokensModuleResult.contentForegroundStyle.Transparency
				}
			}) else ReactModule.createElement(FoundationModule.Image, {
				tag = "position-center-center anchor-center-center content-emphasis",
				Image = Frame.icon,
				Size = UseAnimatedBindingResult:map(function(p1: number): UDim2 --[[ Line: 241 ]]
					-- upvalues: IconSize (copy)
					local Rounded = math.round((1 - p1) * IconSize)
					
					return UDim2.fromOffset(Rounded, Rounded)
				end),
				imageStyle = {
					Color3 = UseSemanticTokensModuleResult.contentForegroundStyle.Color3,
					Transparency = if Frame.disabled then UseSemanticTokensModuleResult.contentDisabledTransparency else UseSemanticTokensModuleResult.contentForegroundStyle.Transparency
				}
			})
		}),
		ActiveIcon = if IsActive or Frame.animate then ReactModule.createElement(FoundationModule.View, {
			Size = UDim2.fromScale(1, 1),
			GroupTransparency = UseAnimatedBindingResult:map(function(p1: number): number --[[ Line: 257 ]]
				return 1 - p1
			end),
			backgroundStyle = if Frame.disabled then nil else UseHoverBindingModuleResult:map(function(p1) --[[ Line: 262 ]]
				-- upvalues: UseSemanticTokensModuleResult (copy)
				return if p1 then UseSemanticTokensModuleResult.hoverIconBackgroundStyle else UseSemanticTokensModuleResult.activeIconBackgroundStyle
			end),
			tag = if FFlagAXMigrateBuilderIcons then {
				["radius-circle position-center-center anchor-center-center clip"] = true,
				["row align-x-center align-y-center"] = IsBuilderIconFunction(ActiveIcon)
			} else "radius-circle position-center-center anchor-center-center clip"
		}, {
			ActiveIconImage = if FFlagAXMigrateBuilderIcons and IsBuilderIconFunction(ActiveIcon) then ReactModule.createElement(FoundationModule.Icon, {
				tag = "position-center-center anchor-center-center clip content-emphasis",
				name = ActiveIcon,
				size = UseAnimatedBindingResult:map(function(p1: number): number --[[ Line: 278 ]]
					-- upvalues: IconSize (copy)
					return (math.round((1 - p1) * IconSize))
				end),
				variant = ActiveIconVariant
			}) else ReactModule.createElement(FoundationModule.Image, {
				tag = "position-center-center anchor-center-center clip content-emphasis",
				Image = ActiveIcon,
				Size = UseAnimatedBindingResult:map(function(p1): UDim2 --[[ Line: 287 ]]
					-- upvalues: ActiveIconSize (copy)
					local Rounded = math.round(p1 * ActiveIconSize)
					
					return UDim2.fromOffset(Rounded, Rounded)
				end)
			})
		}) else nil
	})
end)