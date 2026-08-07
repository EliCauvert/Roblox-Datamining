-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:00 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local isBuilderOrMigratedIcon = require(foundation.Utility.iconMigrationUtils).isBuilderOrMigratedIcon
local loggerModule = require(foundation.Utility.Logger)
local reactModule = require(parent.React)
local constantsModule = require(foundation.Constants)
local iconModule = require(foundation.Components.Icon)
local imageModule = require(foundation.Components.Image)
local popoverModule = require(foundation.Components.Popover)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local useBindableModule = require(foundation.Utility.useBindable)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useComposedRef = require(parent.ReactUtils).useComposedRef
local _ = require(foundation.Enums.InputSize)
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local radiusModule = require(foundation.Enums.Radius)
local flagsModule = require(foundation.Utility.Flags)
local baseMenuItemAccessoryModule = require(script.Parent.BaseMenuItemAccessory)
local baseMenuContextModule = require(script.Parent.BaseMenuContext)
local baseMenuScrollContainerModule = require(script.Parent.BaseMenuScrollContainer)
local useBaseMenuItemVariantsModule = require(script.Parent.useBaseMenuItemVariants)
local useMenuItemHoverModule = require(script.Parent.useMenuItemHover)
local t = { isChecked = false }

local function _(p0) --[[ line: 71 | named "resolveAccessory" ]]
	return if p0 == nil then nil elseif type(p0) == "string" then { iconName = p0 } else p0
end

local var24 = (function() --[[ line: 84 | named "getInputSinkAll" ]]
	-- upvalues: flagsModule (ref)
	if not flagsModule.FoundationGuiObjectInputSinkProperty then
		return nil
	end
	local ok, status = pcall(game.GetEngineFeature, game, "GuiObjectInputSink")
	
	if not ok or not status then
		return nil
	end
	local ok_1, status_1 = pcall(function() --[[ line: 94 ]]
		return Enum.InputSink.All
	end)
	
	return if ok_1 then status_1 else nil
end)()

local function getContainerPadding(p1, p2) --[[ line: 103 ]]
	return {
		left = UDim.new(0, (if p2 then p1.paddingLeftWithCheck else p1.paddingLeftWithoutCheck) or 0),
		right = UDim.new(0, p1.paddingRight or 0)
	}
end

return reactModule.memo(reactModule.forwardRef(function(p3, p4) --[[ line: 112 | named "BaseMenuItem" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), baseMenuContextModule (ref), flagsModule (ref), useTokensModule (ref), useBaseMenuItemVariantsModule (ref), useMenuItemHoverModule (ref), loggerModule (ref), useBindableModule (ref), builderIconsModule (ref), useComposedRef (ref), getContainerPadding (ref), viewModule (ref), iconModule (ref), baseMenuItemAccessoryModule (ref), textModule (ref), withCommonPropsModule (ref), constantsModule (ref), isBuilderOrMigratedIcon (ref), imageModule (ref), baseMenuScrollContainerModule (ref), var24 (ref), popoverModule (ref), popoverSideModule (ref), popoverAlignModule (ref), radiusModule (ref)
	local var28, menuHasCheck
	local var26 = withDefaultsModule(p3, t)
	local var27 = reactModule.useContext(baseMenuContextModule)
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationBaseMenuBeta then
		var28 = if var26.menuHasLeading ~= nil then var27.hasLeading == true else var26.menuHasLeading
		
		if var26.menuHasCheck == nil then
			menuHasCheck = var26.isChecked == true
			menuHasCheck = nil
		else
			menuHasCheck = var26.menuHasCheck
		end
	else
		var28 = var27.hasLeading == true
		menuHasCheck = false
	end
	local var33
	local var29 = useTokensModule()
	local size = var26.size or var27.size
	local depth = var27.depth
	local var31 = var26.children ~= nil
	local var32 = var31 and var27.hoverOpenPath[depth] == var26.id
	
	if flagsModule.FoundationBaseMenuBeta then
		local var34 = var26.leading or var26.icon
		var33 = if var34 == nil then nil elseif type(var34) == "string" then { iconName = var34 } else var34
	else
		var33 = nil
	end
	local var35
	if flagsModule.FoundationBaseMenuBeta then
		local trailing = var26.trailing
		var35 = if trailing == nil then nil elseif type(trailing) == "string" then { iconName = trailing } else trailing
	else
		var35 = nil
	end
	local var43
	local var36 = flagsModule.FoundationBaseMenuSubmenuMaxHeight and var27.maxHeight ~= nil
	local var37 = useBaseMenuItemVariantsModule(var29, size, if var31 then false else var26.isChecked, var36)
	local var38 = reactModule.useRef(nil)
	local var39 = var26.isChecked == true and not var31
	local var40, var41 = reactModule.useState(false)
	local var42 = reactModule.useCallback(function() --[[ line: 143 ]]
		-- upvalues: var41 (ref)
		var41(true)
	end, {})
	
	if flagsModule.FoundationBaseMenuBeta then
		var43 = var33 ~= nil
		var43 = nil
	else
		var43 = var26.icon ~= nil
	end
	local var57
	reactModule.useEffect(function() --[[ line: 148 ]]
		-- upvalues: var43 (ref), var27 (ref)
		if var43 and var27.setHasLeading then
			var27.setHasLeading()
		end
	end, { var43, var27.setHasLeading })
	useMenuItemHoverModule({
		itemRef = var38,
		id = var26.id,
		depth = depth,
		isSubmenu = var31,
		isDisabled = var26.isDisabled,
		hoverOpenAtDepth = var27.hoverOpenAtDepth,
		hoverCloseAtDepth = var27.hoverCloseAtDepth
	})
	local var44 = reactModule.useCallback(function() --[[ line: 165 ]]
		-- upvalues: var31 (ref), var26 (ref), var27 (ref), var32 (ref), depth (ref), loggerModule (copy)
		if var31 then
			if var26.isDisabled then return end
			if var27.hoverOpenAtDepth and not var32 then
				var27.hoverOpenAtDepth(depth, var26.id, true)
				
				return
			end
		elseif var27.hoverReset then
			var27.hoverReset()
		end
		local var59 = if var26.onActivated then var26.onActivated else var27.onActivated
		
		if var59 then
			var59(var26.id)
		else
			loggerModule:warning("Menu should have either onActivated on itself or on all of its children")
		end
		if depth > 1 and var27.onNestedLeafActivated then
			var27.onNestedLeafActivated()
		end
	end, {
		var31, var26.isDisabled, var32, depth, var26.id, var26.onActivated,
		var27.onActivated, var27.onNestedLeafActivated, var27.hoverOpenAtDepth,
		var27.hoverReset
	})
	local var45 = reactModule.useCallback(function() --[[ line: 206 ]]
		-- upvalues: var27 (ref)
		if var27.hoverReset then
			var27.hoverReset()
		end
	end, { var27.hoverReset })
	local var46 = useBindableModule(var27.maxHeight)
	local var47 = reactModule.useMemo(function() --[[ line: 214 ]]
		-- upvalues: var29 (ref)
		return {
			radius = UDim.new(0, var29.Radius.Small),
			offset = var29.Size.Size_200,
			borderWidth = var29.Stroke.Thicker
		}
	end, { var29 })
	local var48 = reactModule.useMemo(function() --[[ line: 222 ]]
		-- upvalues: builderIconsModule (copy), var26 (ref)
		return builderIconsModule.Migration.uiblox[var26.icon]
	end, { var26.icon })
	local var49 = useComposedRef(var38, p4)
	local _ = nil
	
	if flagsModule.FoundationBaseMenuBeta then
		local var50 = getContainerPadding(var37.container, menuHasCheck)
		local t_1 = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder
		}
		local var52 = if var37.wrapper then var37.wrapper.gap else 0
		local var53 = if menuHasCheck then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = `{var37.slotAlign.tag} {var37.check.tag}`,
			testId = `{var26.testId}--check-column`
		}, {
			Check = if var39 then reactModule.createElement(iconModule, {
				name = builderIconsModule.Icon.Check,
				style = var37.check.style,
				size = var37.check.size,
				testId = `{var26.testId}--checkmark`
			}) else nil
		}) else nil
		local var54 = nil
		
		if var33 ~= nil then
			var54 = reactModule.createElement(baseMenuItemAccessoryModule, {
				LayoutOrder = 1,
				accessory = var33,
				iconVariant = var37.icon,
				size = size,
				tokens = var29,
				testId = `{var26.testId}--leading`
			})
		elseif var28 then
			var54 = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = `{var37.slotAlign.tag} {var37.icon.tag}`
			})
		end
		local var55 = reactModule.createElement(textModule, { LayoutOrder = 2, Text = var26.text, tag = var37.text.tag })
		local var56 = nil
		
		if var31 then
			var56 = reactModule.createElement(iconModule, {
				LayoutOrder = 3,
				name = builderIconsModule.Icon.ChevronSmallRight,
				style = var37.check.style,
				size = var37.chevron.size,
				testId = `{var26.testId}--chevron`
			})
		elseif var35 ~= nil then
			var56 = reactModule.createElement(baseMenuItemAccessoryModule, {
				LayoutOrder = 3,
				accessory = var35,
				iconVariant = var37.icon,
				size = size,
				tokens = var29,
				testId = `{var26.testId}--trailing`
			})
		end
		var57 = reactModule.createElement(viewModule, withCommonPropsModule(var26, {
			GroupTransparency = if var26.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
			isDisabled = var26.isDisabled,
			onActivated = var44,
			selection = { Selectable = not var26.isDisabled },
			cursor = var47,
			tag = var37.container.tag,
			padding = var50,
			layout = t_1,
			ref = var49
		}), {
			Check = var53,
			Wrapper = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = "auto-xy",
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, var52),
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, { Leading = var54, Title = var55, Trailing = var56 })
		})
	else
		var57 = reactModule.createElement(viewModule, withCommonPropsModule(var26, {
			GroupTransparency = if var26.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
			isDisabled = var26.isDisabled,
			onActivated = var44,
			selection = { Selectable = not var26.isDisabled },
			cursor = var47,
			tag = var37.container.tag,
			ref = var49
		}), {
			Icon = if not var26.icon and not var28 then if var26.icon and isBuilderOrMigratedIcon(var26.icon) then reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = `align-x-center align-y-center {var37.icon.tag}`
			}, {
				Icon = reactModule.createElement(iconModule, {
					name = if var48 then var48.name else var26.icon,
					style = var37.icon.style,
					size = var37.icon.size
				})
			}) else reactModule.createElement(imageModule, {
				LayoutOrder = 1,
				Image = var26.icon,
				tag = var37.icon.tag
			}) else nil,
			Text = reactModule.createElement(textModule, { LayoutOrder = 2, Text = var26.text, tag = var37.text.tag }),
			Chevron = if var31 then reactModule.createElement(iconModule, {
				LayoutOrder = 3,
				name = builderIconsModule.Icon.ChevronSmallRight,
				style = var37.check.style,
				size = var37.chevron.size,
				testId = `{var26.testId}--chevron`
			}) else nil,
			Check = if var31 or not var26.isChecked then nil else reactModule.createElement(iconModule, {
				LayoutOrder = 3,
				name = builderIconsModule.Icon.Check,
				style = var37.check.style,
				size = var37.check.size,
				testId = `{var26.testId}--checkmark`
			})
		})
	end
	if var31 then
		local standard = var29.Stroke.Standard
		local size_1 = var37.groupPadding.size
		local var58 = reactModule.createElement(baseMenuContextModule.Provider, {
			value = {
				onActivated = var27.onActivated,
				onNestedLeafActivated = var27.onNestedLeafActivated,
				size = size,
				hasLeading = var40,
				setHasLeading = var42,
				hoverOpenPath = var27.hoverOpenPath,
				hoverOpenAtDepth = var27.hoverOpenAtDepth,
				hoverCloseAtDepth = var27.hoverCloseAtDepth,
				hoverReset = var27.hoverReset,
				depth = depth + 1,
				maxHeight = var27.maxHeight
			}
		}, var26.children)
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			Item = var57,
			Submenu = reactModule.createElement(popoverModule.Root, { isOpen = var32, testId = `{var26.testId}--submenu` }, {
				Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var38 }),
				Content = reactModule.createElement(popoverModule.Content, {
					hasArrow = false,
					side = {
						position = popoverSideModule.Right,
						offset = size_1 / 2 + standard
					},
					align = { position = popoverAlignModule.Start, offset = -size_1 },
					onPressedOutside = var45,
					backgroundStyle = if flagsModule.FoundationBaseMenuBeta then var29.Color.Surface.Surface_200 else var29.Color.Surface.Surface_100,
					radius = radiusModule.Medium
				}, if var36 then reactModule.createElement(baseMenuScrollContainerModule, {
					maxHeight = var46,
					scrollViewProps = { tag = var37.submenuContent.tag, InputSink = var24 }
				}, var58) else reactModule.createElement(viewModule, { tag = var37.submenuContent.tag, InputSink = var24 }, var58))
			})
		})
	end
	return var57
end))