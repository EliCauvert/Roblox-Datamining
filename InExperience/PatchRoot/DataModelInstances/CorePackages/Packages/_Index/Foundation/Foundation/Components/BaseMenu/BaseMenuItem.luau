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

local function _(p1)
	return if p1 == nil then nil elseif type(p1) == "string" then { iconName = p1 } else p1
end

local var1 = (function()
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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), baseMenuContextModule (ref), useTokensModule (ref), flagsModule (ref), useBaseMenuItemVariantsModule (ref), useMenuItemHoverModule (ref), loggerModule (ref), useBindableModule (ref), useComposedRef (ref), getContainerPadding (ref), viewModule (ref), iconModule (ref), builderIconsModule (ref), baseMenuItemAccessoryModule (ref), textModule (ref), withCommonPropsModule (ref), constantsModule (ref), baseMenuScrollContainerModule (ref), var1 (ref), popoverModule (ref), popoverSideModule (ref), popoverAlignModule (ref), radiusModule (ref)
	local var2 = withDefaultsModule(p1, t)
	local var3 = reactModule.useContext(baseMenuContextModule)
	local var4 = if var2.menuHasLeading ~= nil then var3.hasLeading == true else var2.menuHasLeading
	local var5 = if var2.menuHasCheck ~= nil then var2.isChecked == true else var2.menuHasCheck
	local var6 = useTokensModule()
	local size = var2.size or var3.size
	local depth = var3.depth
	local var7 = var2.children ~= nil
	local var8 = var7 and var3.hoverOpenPath[depth] == var2.id
	local leading = var2.leading or var2.icon
	local var9 = if leading == nil then nil elseif type(leading) == "string" then { iconName = leading } else leading
	local trailing = var2.trailing
	local var10 = if trailing == nil then nil elseif type(trailing) == "string" then { iconName = trailing } else trailing
	local var11 = flagsModule.FoundationBaseMenuSubmenuMaxHeight and var3.maxHeight ~= nil
	local var12 = useBaseMenuItemVariantsModule(var6, size, var11)
	local var13 = reactModule.useRef(nil)
	local var14 = var2.isChecked == true and not var7
	local var15, var16 = reactModule.useState(false)
	local var17 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		var16(true)
	end, {})
	local var18 = var9 ~= nil
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var3 (ref)
		if var18 and var3.setHasLeading then
			var3.setHasLeading()
		end
	end, { var18, var3.setHasLeading })
	useMenuItemHoverModule({
		itemRef = var13,
		id = var2.id,
		depth = depth,
		isSubmenu = var7,
		isDisabled = var2.isDisabled,
		hoverOpenAtDepth = var3.hoverOpenAtDepth,
		hoverCloseAtDepth = var3.hoverCloseAtDepth
	})
	local _ = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var2 (ref), var3 (ref), var8 (ref), depth (ref), loggerModule (copy)
		if var7 then
			if var2.isDisabled then return end
			if var3.hoverOpenAtDepth and not var8 then
				var3.hoverOpenAtDepth(depth, var2.id, true)
				
				return
			end
		elseif var3.hoverReset then
			var3.hoverReset()
		end
		local var19 = if var2.onActivated then var2.onActivated else var3.onActivated
		
		if var19 then
			var19(var2.id)
		else
			loggerModule:warning("Menu should have either onActivated on itself or on all of its children")
		end
		if depth > 1 and var3.onNestedLeafActivated then
			var3.onNestedLeafActivated()
		end
	end, {
		var7, var2.isDisabled, var8, depth, var2.id, var2.onActivated,
		var3.onActivated, var3.onNestedLeafActivated, var3.hoverOpenAtDepth,
		var3.hoverReset
	})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		if var3.hoverReset then
			var3.hoverReset()
		end
	end, { var3.hoverReset })
	local var20 = useBindableModule(var3.maxHeight)
	local _ = reactModule.useMemo(function()
		-- upvalues: var6 (ref)
		return {
			radius = UDim.new(0, var6.Radius.Small),
			offset = var6.Size.Size_200,
			borderWidth = var6.Stroke.Thicker
		}
	end, { var6 })
	local _ = useComposedRef(var13, p2)
	local _ = nil
	local _ = getContainerPadding(var12.container, var5)
	local _ = {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 0),
		SortOrder = Enum.SortOrder.LayoutOrder
	}
	local _ = if var12.wrapper then var12.wrapper.gap else 0
	local _ = if var5 then reactModule.createElement(viewModule, {
		LayoutOrder = 1,
		tag = `{var12.slotAlign.tag} {var12.check.tag}`,
		testId = `{var2.testId}--check-column`
	}, {
		Check = if var14 then reactModule.createElement(iconModule, {
			name = builderIconsModule.Icon.Check,
			style = var12.check.style,
			size = var12.check.size,
			testId = `{var2.testId}--checkmark`
		}) else nil
	}) else nil
	local var21 = nil
	
	if var9 ~= nil then
		var21 = reactModule.createElement(baseMenuItemAccessoryModule, {
			LayoutOrder = 1,
			accessory = var9,
			iconVariant = var12.icon,
			size = size,
			tokens = var6,
			testId = `{var2.testId}--leading`
		})
	elseif var4 then
		var21 = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = `{var12.slotAlign.tag} {var12.icon.tag}`
		})
	end
	local _ = reactModule.createElement(textModule, { LayoutOrder = 2, Text = var2.text, tag = var12.text.tag })
	local var22 = nil
	
	if var7 then
		var22 = reactModule.createElement(iconModule, {
			LayoutOrder = 3,
			name = builderIconsModule.Icon.ChevronSmallRight,
			style = var12.check.style,
			size = var12.chevron.size,
			testId = `{var2.testId}--chevron`
		})
	elseif var10 ~= nil then
		var22 = reactModule.createElement(baseMenuItemAccessoryModule, {
			LayoutOrder = 3,
			accessory = var10,
			iconVariant = var12.icon,
			size = size,
			tokens = var6,
			testId = `{var2.testId}--trailing`
		})
	end
	local var23 = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
		-- upvalues: var3 (ref), size (ref), var15 (ref), var17 (ref), depth (ref)
		return {
			onActivated = var3.onActivated,
			onNestedLeafActivated = var3.onNestedLeafActivated,
			size = size,
			hasLeading = var15,
			setHasLeading = var17,
			hoverOpenPath = var3.hoverOpenPath,
			hoverOpenAtDepth = var3.hoverOpenAtDepth,
			hoverCloseAtDepth = var3.hoverCloseAtDepth,
			hoverReset = var3.hoverReset,
			depth = depth + 1,
			maxHeight = var3.maxHeight
		}
	end, {
		var3.onActivated, var3.onNestedLeafActivated, size, var15,
		var3.hoverOpenPath, var3.hoverOpenAtDepth, var3.hoverCloseAtDepth,
		var3.hoverReset, depth, var3.maxHeight
	}) else nil
	
	if var7 then
		local standard = var6.Stroke.Standard
		local size_1 = var12.groupPadding.size
		local var24 = reactModule.createElement(baseMenuContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then var23 else {
				onActivated = var3.onActivated,
				onNestedLeafActivated = var3.onNestedLeafActivated,
				size = size,
				hasLeading = var15,
				setHasLeading = var17,
				hoverOpenPath = var3.hoverOpenPath,
				hoverOpenAtDepth = var3.hoverOpenAtDepth,
				hoverCloseAtDepth = var3.hoverCloseAtDepth,
				hoverReset = var3.hoverReset,
				depth = depth + 1,
				maxHeight = var3.maxHeight
			}
		}, var2.children)
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			Item = u655,
			Submenu = reactModule.createElement(popoverModule.Root, { isOpen = var8, testId = `{var2.testId}--submenu` }, {
				Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var13 }),
				Content = reactModule.createElement(popoverModule.Content, {
					hasArrow = false,
					side = {
						position = popoverSideModule.Right,
						offset = size_1 / 2 + standard
					},
					align = { position = popoverAlignModule.Start, offset = -size_1 },
					onPressedOutside = var19,
					backgroundStyle = var6.Color.Surface.Surface_200,
					radius = radiusModule.Medium
				}, if var11 then reactModule.createElement(baseMenuScrollContainerModule, {
					maxHeight = var20,
					scrollViewProps = { tag = var12.submenuContent.tag, InputSink = var1 }
				}, var24) else reactModule.createElement(viewModule, { tag = var12.submenuContent.tag, InputSink = var1 }, var24))
			})
		})
	end
	return u655
end))