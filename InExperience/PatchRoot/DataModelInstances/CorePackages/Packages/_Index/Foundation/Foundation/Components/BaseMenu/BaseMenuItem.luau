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
local useBaseMenuItemVariantsModule = require(script.Parent.useBaseMenuItemVariants)
local useMenuItemHoverModule = require(script.Parent.useMenuItemHover)
local t = { isChecked = false }

local function _(p0) --[[ line: 68 | named "resolveAccessory" ]]
	return if p0 == nil then nil elseif type(p0) == "string" then { iconName = p0 } else p0
end

local var22 = (function() --[[ line: 81 | named "getInputSinkAll" ]]
	-- upvalues: flagsModule (ref)
	if not flagsModule.FoundationGuiObjectInputSinkProperty then
		return nil
	end
	local ok, status = pcall(game.GetEngineFeature, game, "GuiObjectInputSink")
	
	if not ok or not status then
		return nil
	end
	local ok_1, status_1 = pcall(function() --[[ line: 91 ]]
		return Enum.InputSink.All
	end)
	
	return if ok_1 then status_1 else nil
end)()

local function getContainerPadding(p1, p2) --[[ line: 100 ]]
	return {
		left = UDim.new(0, (if p2 then p1.paddingLeftWithCheck else p1.paddingLeftWithoutCheck) or 0),
		right = UDim.new(0, p1.paddingRight or 0)
	}
end

return reactModule.memo(reactModule.forwardRef(function(p3, p4) --[[ line: 109 | named "BaseMenuItem" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), baseMenuContextModule (ref), flagsModule (ref), useTokensModule (ref), useBaseMenuItemVariantsModule (ref), useMenuItemHoverModule (ref), loggerModule (ref), builderIconsModule (ref), useComposedRef (ref), getContainerPadding (ref), viewModule (ref), iconModule (ref), baseMenuItemAccessoryModule (ref), textModule (ref), withCommonPropsModule (ref), constantsModule (ref), isBuilderOrMigratedIcon (ref), imageModule (ref), popoverModule (ref), popoverSideModule (ref), popoverAlignModule (ref), radiusModule (ref), var22 (ref)
	local var26, menuHasCheck
	local var24 = withDefaultsModule(p3, t)
	local var25 = reactModule.useContext(baseMenuContextModule)
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationBaseMenuBeta then
		var26 = if var24.menuHasLeading ~= nil then var25.hasLeading == true else var24.menuHasLeading
		
		if var24.menuHasCheck == nil then
			menuHasCheck = var24.isChecked == true
			menuHasCheck = nil
		else
			menuHasCheck = var24.menuHasCheck
		end
	else
		var26 = var25.hasLeading == true
		menuHasCheck = false
	end
	local var31
	local var27 = useTokensModule()
	local size = var24.size or var25.size
	local depth = var25.depth
	local var29 = var24.children ~= nil
	local var30 = var29 and var25.hoverOpenPath[depth] == var24.id
	
	if flagsModule.FoundationBaseMenuBeta then
		local var32 = var24.leading or var24.icon
		var31 = if var32 == nil then nil elseif type(var32) == "string" then { iconName = var32 } else var32
	else
		var31 = nil
	end
	local var33
	if flagsModule.FoundationBaseMenuBeta then
		local trailing = var24.trailing
		var33 = if trailing == nil then nil elseif type(trailing) == "string" then { iconName = trailing } else trailing
	else
		var33 = nil
	end
	local var40
	local var34 = useBaseMenuItemVariantsModule(var27, size, if var29 then false else var24.isChecked)
	local var35 = reactModule.useRef(nil)
	local var36 = var24.isChecked == true and not var29
	local var37, var38 = reactModule.useState(false)
	local var39 = reactModule.useCallback(function() --[[ line: 138 ]]
		-- upvalues: var38 (ref)
		var38(true)
	end, {})
	
	if flagsModule.FoundationBaseMenuBeta then
		var40 = var31 ~= nil
		var40 = nil
	else
		var40 = var24.icon ~= nil
	end
	local var53
	reactModule.useEffect(function() --[[ line: 143 ]]
		-- upvalues: var40 (ref), var25 (ref)
		if var40 and var25.setHasLeading then
			var25.setHasLeading()
		end
	end, { var40, var25.setHasLeading })
	useMenuItemHoverModule({
		itemRef = var35,
		id = var24.id,
		depth = depth,
		isSubmenu = var29,
		isDisabled = var24.isDisabled,
		hoverOpenAtDepth = var25.hoverOpenAtDepth,
		hoverCloseAtDepth = var25.hoverCloseAtDepth
	})
	local var41 = reactModule.useCallback(function() --[[ line: 160 ]]
		-- upvalues: var29 (ref), var24 (ref), var25 (ref), var30 (ref), depth (ref), loggerModule (copy)
		if var29 then
			if var24.isDisabled then return end
			if var25.hoverOpenAtDepth and not var30 then
				var25.hoverOpenAtDepth(depth, var24.id, true)
				
				return
			end
		elseif var25.hoverReset then
			var25.hoverReset()
		end
		local var54 = if var24.onActivated then var24.onActivated else var25.onActivated
		
		if var54 then
			var54(var24.id)
		else
			loggerModule:warning("Menu should have either onActivated on itself or on all of its children")
		end
		if depth > 1 and var25.onNestedLeafActivated then
			var25.onNestedLeafActivated()
		end
	end, {
		var29, var24.isDisabled, var30, depth, var24.id, var24.onActivated,
		var25.onActivated, var25.onNestedLeafActivated, var25.hoverOpenAtDepth,
		var25.hoverReset
	})
	local var42 = reactModule.useCallback(function() --[[ line: 201 ]]
		-- upvalues: var25 (ref)
		if var25.hoverReset then
			var25.hoverReset()
		end
	end, { var25.hoverReset })
	local var43 = reactModule.useMemo(function() --[[ line: 207 ]]
		-- upvalues: var27 (ref)
		return {
			radius = UDim.new(0, var27.Radius.Small),
			offset = var27.Size.Size_200,
			borderWidth = var27.Stroke.Thicker
		}
	end, { var27 })
	local var44 = reactModule.useMemo(function() --[[ line: 215 ]]
		-- upvalues: builderIconsModule (copy), var24 (ref)
		return builderIconsModule.Migration.uiblox[var24.icon]
	end, { var24.icon })
	local var45 = useComposedRef(var35, p4)
	local _ = nil
	
	if flagsModule.FoundationBaseMenuBeta then
		local var46 = getContainerPadding(var34.container, menuHasCheck)
		local t_1 = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder
		}
		local var48 = if var34.wrapper then var34.wrapper.gap else 0
		local var49 = if menuHasCheck then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = `{var34.slotAlign.tag} {var34.check.tag}`,
			testId = `{var24.testId}--check-column`
		}, {
			Check = if var36 then reactModule.createElement(iconModule, {
				name = builderIconsModule.Icon.Check,
				style = var34.check.style,
				size = var34.check.size,
				testId = `{var24.testId}--checkmark`
			}) else nil
		}) else nil
		local var50 = nil
		
		if var31 ~= nil then
			var50 = reactModule.createElement(baseMenuItemAccessoryModule, {
				LayoutOrder = 1,
				accessory = var31,
				iconVariant = var34.icon,
				size = size,
				tokens = var27,
				testId = `{var24.testId}--leading`
			})
		elseif var26 then
			var50 = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = `{var34.slotAlign.tag} {var34.icon.tag}`
			})
		end
		local var51 = reactModule.createElement(textModule, { LayoutOrder = 2, Text = var24.text, tag = var34.text.tag })
		local var52 = nil
		
		if var29 then
			var52 = reactModule.createElement(iconModule, {
				LayoutOrder = 3,
				name = builderIconsModule.Icon.ChevronSmallRight,
				style = var34.check.style,
				size = var34.chevron.size,
				testId = `{var24.testId}--chevron`
			})
		elseif var33 ~= nil then
			var52 = reactModule.createElement(baseMenuItemAccessoryModule, {
				LayoutOrder = 3,
				accessory = var33,
				iconVariant = var34.icon,
				size = size,
				tokens = var27,
				testId = `{var24.testId}--trailing`
			})
		end
		var53 = reactModule.createElement(viewModule, withCommonPropsModule(var24, {
			GroupTransparency = if var24.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
			isDisabled = var24.isDisabled,
			onActivated = var41,
			selection = { Selectable = not var24.isDisabled },
			cursor = var43,
			tag = var34.container.tag,
			padding = var46,
			layout = t_1,
			ref = var45
		}), {
			Check = var49,
			Wrapper = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = "auto-xy",
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, var48),
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, { Leading = var50, Title = var51, Trailing = var52 })
		})
	else
		var53 = reactModule.createElement(viewModule, withCommonPropsModule(var24, {
			GroupTransparency = if var24.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
			isDisabled = var24.isDisabled,
			onActivated = var41,
			selection = { Selectable = not var24.isDisabled },
			cursor = var43,
			tag = var34.container.tag,
			ref = var45
		}), {
			Icon = if not var24.icon and not var26 then if var24.icon and isBuilderOrMigratedIcon(var24.icon) then reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = `align-x-center align-y-center {var34.icon.tag}`
			}, {
				Icon = reactModule.createElement(iconModule, {
					name = if var44 then var44.name else var24.icon,
					style = var34.icon.style,
					size = var34.icon.size
				})
			}) else reactModule.createElement(imageModule, {
				LayoutOrder = 1,
				Image = var24.icon,
				tag = var34.icon.tag
			}) else nil,
			Text = reactModule.createElement(textModule, { LayoutOrder = 2, Text = var24.text, tag = var34.text.tag }),
			Chevron = if var29 then reactModule.createElement(iconModule, {
				LayoutOrder = 3,
				name = builderIconsModule.Icon.ChevronSmallRight,
				style = var34.check.style,
				size = var34.chevron.size,
				testId = `{var24.testId}--chevron`
			}) else nil,
			Check = if var29 or not var24.isChecked then nil else reactModule.createElement(iconModule, {
				LayoutOrder = 3,
				name = builderIconsModule.Icon.Check,
				style = var34.check.style,
				size = var34.check.size,
				testId = `{var24.testId}--checkmark`
			})
		})
	end
	if var29 then
		local size_1 = var34.groupPadding.size
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			Item = var53,
			Submenu = reactModule.createElement(popoverModule.Root, { isOpen = var30, testId = `{var24.testId}--submenu` }, {
				Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var35 }),
				Content = reactModule.createElement(popoverModule.Content, {
					hasArrow = false,
					side = {
						position = popoverSideModule.Right,
						offset = size_1 / 2 + var27.Stroke.Standard
					},
					align = { position = popoverAlignModule.Start, offset = -size_1 },
					onPressedOutside = var42,
					backgroundStyle = if flagsModule.FoundationBaseMenuBeta then var27.Color.Surface.Surface_200 else var27.Color.Surface.Surface_100,
					radius = radiusModule.Medium
				}, reactModule.createElement(viewModule, { tag = var34.submenuContent.tag, InputSink = var22 }, reactModule.createElement(baseMenuContextModule.Provider, {
					value = {
						onActivated = var25.onActivated,
						onNestedLeafActivated = var25.onNestedLeafActivated,
						size = size,
						hasLeading = var37,
						setHasLeading = var39,
						hoverOpenPath = var25.hoverOpenPath,
						hoverOpenAtDepth = var25.hoverOpenAtDepth,
						hoverCloseAtDepth = var25.hoverCloseAtDepth,
						hoverReset = var25.hoverReset,
						depth = depth + 1
					}
				}, var24.children)))
			})
		})
	end
	return var53
end))