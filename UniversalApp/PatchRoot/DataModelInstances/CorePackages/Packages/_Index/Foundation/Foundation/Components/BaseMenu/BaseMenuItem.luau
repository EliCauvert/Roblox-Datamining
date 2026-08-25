local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local loggerModule = require(foundation.Utility.Logger)
local reactModule = require(parent.React)
local constantsModule = require(foundation.Constants)
local iconModule = require(foundation.Components.Icon)
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

local function _(p0)
	return if p0 == nil then nil elseif type(p0) == "string" then { iconName = p0 } else p0
end

local var23 = (function()
	-- upvalues: flagsModule (ref)
	if not flagsModule.FoundationGuiObjectInputSinkProperty then
		return nil
	end
	local ok, status = pcall(game.GetEngineFeature, game, "GuiObjectInputSink")
	
	if not ok or not status then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		return Enum.InputSink.All
	end)
	
	return if ok_1 then status_1 else nil
end)()

local function getContainerPadding(p1, p2)
	return {
		left = UDim.new(0, (if p2 then p1.paddingLeftWithCheck else p1.paddingLeftWithoutCheck) or 0),
		right = UDim.new(0, p1.paddingRight or 0)
	}
end

return reactModule.memo(reactModule.forwardRef(function(p3, p4)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), baseMenuContextModule (ref), useTokensModule (ref), flagsModule (ref), useBaseMenuItemVariantsModule (ref), useMenuItemHoverModule (ref), loggerModule (ref), useBindableModule (ref), useComposedRef (ref), getContainerPadding (ref), viewModule (ref), iconModule (ref), builderIconsModule (ref), baseMenuItemAccessoryModule (ref), textModule (ref), withCommonPropsModule (ref), constantsModule (ref), baseMenuScrollContainerModule (ref), var23 (ref), popoverModule (ref), popoverSideModule (ref), popoverAlignModule (ref), radiusModule (ref)
	local var25 = withDefaultsModule(p3, t)
	local var26 = reactModule.useContext(baseMenuContextModule)
	local var27 = if var25.menuHasLeading ~= nil then var26.hasLeading == true else var25.menuHasLeading
	local var28 = if var25.menuHasCheck ~= nil then var25.isChecked == true else var25.menuHasCheck
	local var29 = useTokensModule()
	local size = var25.size or var26.size
	local depth = var26.depth
	local var31 = var25.children ~= nil
	local var32 = var31 and var26.hoverOpenPath[depth] == var25.id
	local leading = var25.leading or var25.icon
	local var34 = if leading == nil then nil elseif type(leading) == "string" then { iconName = leading } else leading
	local trailing = var25.trailing
	local var35 = if trailing == nil then nil elseif type(trailing) == "string" then { iconName = trailing } else trailing
	local var36 = flagsModule.FoundationBaseMenuSubmenuMaxHeight and var26.maxHeight ~= nil
	local var37 = useBaseMenuItemVariantsModule(var29, size, var36)
	local var38 = reactModule.useRef(nil)
	local var39 = var25.isChecked == true and not var31
	local var40, var41 = reactModule.useState(false)
	local var42 = reactModule.useCallback(function()
		-- upvalues: var41 (ref)
		var41(true)
	end, {})
	local var43 = var34 ~= nil
	reactModule.useEffect(function()
		-- upvalues: var43 (ref), var26 (ref)
		if var43 and var26.setHasLeading then
			var26.setHasLeading()
		end
	end, { var43, var26.setHasLeading })
	useMenuItemHoverModule({
		itemRef = var38,
		id = var25.id,
		depth = depth,
		isSubmenu = var31,
		isDisabled = var25.isDisabled,
		hoverOpenAtDepth = var26.hoverOpenAtDepth,
		hoverCloseAtDepth = var26.hoverCloseAtDepth
	})
	local _ = reactModule.useCallback(function()
		-- upvalues: var31 (ref), var25 (ref), var26 (ref), var32 (ref), depth (ref), loggerModule (copy)
		if var31 then
			if var25.isDisabled then return end
			if var26.hoverOpenAtDepth and not var32 then
				var26.hoverOpenAtDepth(depth, var25.id, true)
				
				return
			end
		elseif var26.hoverReset then
			var26.hoverReset()
		end
		local var50 = if var25.onActivated then var25.onActivated else var26.onActivated
		
		if var50 then
			var50(var25.id)
		else
			loggerModule:warning("Menu should have either onActivated on itself or on all of its children")
		end
		if depth > 1 and var26.onNestedLeafActivated then
			var26.onNestedLeafActivated()
		end
	end, {
		var31, var25.isDisabled, var32, depth, var25.id, var25.onActivated,
		var26.onActivated, var26.onNestedLeafActivated, var26.hoverOpenAtDepth,
		var26.hoverReset
	})
	local var44 = reactModule.useCallback(function()
		-- upvalues: var26 (ref)
		if var26.hoverReset then
			var26.hoverReset()
		end
	end, { var26.hoverReset })
	local var45 = useBindableModule(var26.maxHeight)
	local _ = reactModule.useMemo(function()
		-- upvalues: var29 (ref)
		return {
			radius = UDim.new(0, var29.Radius.Small),
			offset = var29.Size.Size_200,
			borderWidth = var29.Stroke.Thicker
		}
	end, { var29 })
	local _ = useComposedRef(var38, p4)
	local _ = nil
	local _ = getContainerPadding(var37.container, var28)
	local _ = {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 0),
		SortOrder = Enum.SortOrder.LayoutOrder
	}
	local _ = if var37.wrapper then var37.wrapper.gap else 0
	local _ = if var28 then reactModule.createElement(viewModule, {
		LayoutOrder = 1,
		tag = `{var37.slotAlign.tag} {var37.check.tag}`,
		testId = `{var25.testId}--check-column`
	}, {
		Check = if var39 then reactModule.createElement(iconModule, {
			name = builderIconsModule.Icon.Check,
			style = var37.check.style,
			size = var37.check.size,
			testId = `{var25.testId}--checkmark`
		}) else nil
	}) else nil
	local var46 = nil
	
	if var34 ~= nil then
		var46 = reactModule.createElement(baseMenuItemAccessoryModule, {
			LayoutOrder = 1,
			accessory = var34,
			iconVariant = var37.icon,
			size = size,
			tokens = var29,
			testId = `{var25.testId}--leading`
		})
	elseif var27 then
		var46 = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = `{var37.slotAlign.tag} {var37.icon.tag}`
		})
	end
	local _ = reactModule.createElement(textModule, { LayoutOrder = 2, Text = var25.text, tag = var37.text.tag })
	local var47 = nil
	
	if var31 then
		var47 = reactModule.createElement(iconModule, {
			LayoutOrder = 3,
			name = builderIconsModule.Icon.ChevronSmallRight,
			style = var37.check.style,
			size = var37.chevron.size,
			testId = `{var25.testId}--chevron`
		})
	elseif var35 ~= nil then
		var47 = reactModule.createElement(baseMenuItemAccessoryModule, {
			LayoutOrder = 3,
			accessory = var35,
			iconVariant = var37.icon,
			size = size,
			tokens = var29,
			testId = `{var25.testId}--trailing`
		})
	end
	local var48 = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
		-- upvalues: var26 (ref), size (ref), var40 (ref), var42 (ref), depth (ref)
		return {
			onActivated = var26.onActivated,
			onNestedLeafActivated = var26.onNestedLeafActivated,
			size = size,
			hasLeading = var40,
			setHasLeading = var42,
			hoverOpenPath = var26.hoverOpenPath,
			hoverOpenAtDepth = var26.hoverOpenAtDepth,
			hoverCloseAtDepth = var26.hoverCloseAtDepth,
			hoverReset = var26.hoverReset,
			depth = depth + 1,
			maxHeight = var26.maxHeight
		}
	end, {
		var26.onActivated, var26.onNestedLeafActivated, size, var40,
		var26.hoverOpenPath, var26.hoverOpenAtDepth, var26.hoverCloseAtDepth,
		var26.hoverReset, depth, var26.maxHeight
	}) else nil
	
	if var31 then
		local standard = var29.Stroke.Standard
		local size_1 = var37.groupPadding.size
		local var49 = reactModule.createElement(baseMenuContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then var48 else {
				onActivated = var26.onActivated,
				onNestedLeafActivated = var26.onNestedLeafActivated,
				size = size,
				hasLeading = var40,
				setHasLeading = var42,
				hoverOpenPath = var26.hoverOpenPath,
				hoverOpenAtDepth = var26.hoverOpenAtDepth,
				hoverCloseAtDepth = var26.hoverCloseAtDepth,
				hoverReset = var26.hoverReset,
				depth = depth + 1,
				maxHeight = var26.maxHeight
			}
		}, var25.children)
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			Item = u655,
			Submenu = reactModule.createElement(popoverModule.Root, { isOpen = var32, testId = `{var25.testId}--submenu` }, {
				Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var38 }),
				Content = reactModule.createElement(popoverModule.Content, {
					hasArrow = false,
					side = {
						position = popoverSideModule.Right,
						offset = size_1 / 2 + standard
					},
					align = { position = popoverAlignModule.Start, offset = -size_1 },
					onPressedOutside = var44,
					backgroundStyle = var29.Color.Surface.Surface_200,
					radius = radiusModule.Medium
				}, if var36 then reactModule.createElement(baseMenuScrollContainerModule, {
					maxHeight = var45,
					scrollViewProps = { tag = var37.submenuContent.tag, InputSink = var23 }
				}, var49) else reactModule.createElement(viewModule, { tag = var37.submenuContent.tag, InputSink = var23 }, var49))
			})
		})
	end
	return u655
end))