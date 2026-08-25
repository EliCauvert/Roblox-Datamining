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
	local var1 = withDefaultsModule(p1, t)
	local var2 = reactModule.useContext(baseMenuContextModule)
	local var3 = if var1.menuHasLeading ~= nil then var2.hasLeading == true else var1.menuHasLeading
	local var4 = if var1.menuHasCheck ~= nil then var1.isChecked == true else var1.menuHasCheck
	local var5 = useTokensModule()
	local size = var1.size or var2.size
	local depth = var2.depth
	local var6 = var1.children ~= nil
	local var7 = var6 and var2.hoverOpenPath[depth] == var1.id
	local leading = var1.leading or var1.icon
	local var8 = if leading == nil then nil elseif type(leading) == "string" then { iconName = leading } else leading
	local trailing = var1.trailing
	local var9 = if trailing == nil then nil elseif type(trailing) == "string" then { iconName = trailing } else trailing
	local var10 = flagsModule.FoundationBaseMenuSubmenuMaxHeight and var2.maxHeight ~= nil
	local var11 = useBaseMenuItemVariantsModule(var5, size, var10)
	local var12 = reactModule.useRef(nil)
	local var13 = var1.isChecked == true and not var6
	local var14, var15 = reactModule.useState(false)
	local var16 = reactModule.useCallback(function()
		-- upvalues: var15 (ref)
		var15(true)
	end, {})
	local var17 = var8 ~= nil
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var2 (ref)
		if var17 and var2.setHasLeading then
			var2.setHasLeading()
		end
	end, { var17, var2.setHasLeading })
	useMenuItemHoverModule({
		itemRef = var12,
		id = var1.id,
		depth = depth,
		isSubmenu = var6,
		isDisabled = var1.isDisabled,
		hoverOpenAtDepth = var2.hoverOpenAtDepth,
		hoverCloseAtDepth = var2.hoverCloseAtDepth
	})
	local _ = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var1 (ref), var2 (ref), var7 (ref), depth (ref), loggerModule (copy)
		if var6 then
			if var1.isDisabled then return end
			if var2.hoverOpenAtDepth and not var7 then
				var2.hoverOpenAtDepth(depth, var1.id, true)
				
				return
			end
		elseif var2.hoverReset then
			var2.hoverReset()
		end
		local var1 = if var1.onActivated then var1.onActivated else var2.onActivated
		
		if var1 then
			var1(var1.id)
		else
			loggerModule:warning("Menu should have either onActivated on itself or on all of its children")
		end
		if depth > 1 and var2.onNestedLeafActivated then
			var2.onNestedLeafActivated()
		end
	end, {
		var6, var1.isDisabled, var7, depth, var1.id, var1.onActivated,
		var2.onActivated, var2.onNestedLeafActivated, var2.hoverOpenAtDepth,
		var2.hoverReset
	})
	local var2 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		if var2.hoverReset then
			var2.hoverReset()
		end
	end, { var2.hoverReset })
	local var3 = useBindableModule(var2.maxHeight)
	local _ = reactModule.useMemo(function()
		-- upvalues: var5 (ref)
		return {
			radius = UDim.new(0, var5.Radius.Small),
			offset = var5.Size.Size_200,
			borderWidth = var5.Stroke.Thicker
		}
	end, { var5 })
	local _ = useComposedRef(var12, p2)
	local _ = nil
	local _ = getContainerPadding(var11.container, var4)
	local _ = {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 0),
		SortOrder = Enum.SortOrder.LayoutOrder
	}
	local _ = if var11.wrapper then var11.wrapper.gap else 0
	local _ = if var4 then reactModule.createElement(viewModule, {
		LayoutOrder = 1,
		tag = `{var11.slotAlign.tag} {var11.check.tag}`,
		testId = `{var1.testId}--check-column`
	}, {
		Check = if var13 then reactModule.createElement(iconModule, {
			name = builderIconsModule.Icon.Check,
			style = var11.check.style,
			size = var11.check.size,
			testId = `{var1.testId}--checkmark`
		}) else nil
	}) else nil
	local var4 = nil
	
	if var8 ~= nil then
		var4 = reactModule.createElement(baseMenuItemAccessoryModule, {
			LayoutOrder = 1,
			accessory = var8,
			iconVariant = var11.icon,
			size = size,
			tokens = var5,
			testId = `{var1.testId}--leading`
		})
	elseif var3 then
		var4 = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = `{var11.slotAlign.tag} {var11.icon.tag}`
		})
	end
	local _ = reactModule.createElement(textModule, { LayoutOrder = 2, Text = var1.text, tag = var11.text.tag })
	local var5 = nil
	
	if var6 then
		var5 = reactModule.createElement(iconModule, {
			LayoutOrder = 3,
			name = builderIconsModule.Icon.ChevronSmallRight,
			style = var11.check.style,
			size = var11.chevron.size,
			testId = `{var1.testId}--chevron`
		})
	elseif var9 ~= nil then
		var5 = reactModule.createElement(baseMenuItemAccessoryModule, {
			LayoutOrder = 3,
			accessory = var9,
			iconVariant = var11.icon,
			size = size,
			tokens = var5,
			testId = `{var1.testId}--trailing`
		})
	end
	local var6 = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
		-- upvalues: var2 (ref), size (ref), var14 (ref), var16 (ref), depth (ref)
		return {
			onActivated = var2.onActivated,
			onNestedLeafActivated = var2.onNestedLeafActivated,
			size = size,
			hasLeading = var14,
			setHasLeading = var16,
			hoverOpenPath = var2.hoverOpenPath,
			hoverOpenAtDepth = var2.hoverOpenAtDepth,
			hoverCloseAtDepth = var2.hoverCloseAtDepth,
			hoverReset = var2.hoverReset,
			depth = depth + 1,
			maxHeight = var2.maxHeight
		}
	end, {
		var2.onActivated, var2.onNestedLeafActivated, size, var14,
		var2.hoverOpenPath, var2.hoverOpenAtDepth, var2.hoverCloseAtDepth,
		var2.hoverReset, depth, var2.maxHeight
	}) else nil
	
	if var6 then
		local standard = var5.Stroke.Standard
		local size_1 = var11.groupPadding.size
		local var7 = reactModule.createElement(baseMenuContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then var6 else {
				onActivated = var2.onActivated,
				onNestedLeafActivated = var2.onNestedLeafActivated,
				size = size,
				hasLeading = var14,
				setHasLeading = var16,
				hoverOpenPath = var2.hoverOpenPath,
				hoverOpenAtDepth = var2.hoverOpenAtDepth,
				hoverCloseAtDepth = var2.hoverCloseAtDepth,
				hoverReset = var2.hoverReset,
				depth = depth + 1,
				maxHeight = var2.maxHeight
			}
		}, var1.children)
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			Item = u666,
			Submenu = reactModule.createElement(popoverModule.Root, { isOpen = var7, testId = `{var1.testId}--submenu` }, {
				Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var12 }),
				Content = reactModule.createElement(popoverModule.Content, {
					hasArrow = false,
					side = {
						position = popoverSideModule.Right,
						offset = size_1 / 2 + standard
					},
					align = { position = popoverAlignModule.Start, offset = -size_1 },
					onPressedOutside = var2,
					backgroundStyle = var5.Color.Surface.Surface_200,
					radius = radiusModule.Medium
				}, if var10 then reactModule.createElement(baseMenuScrollContainerModule, {
					maxHeight = var3,
					scrollViewProps = { tag = var11.submenuContent.tag, InputSink = var1 }
				}, var7) else reactModule.createElement(viewModule, { tag = var11.submenuContent.tag, InputSink = var1 }, var7))
			})
		})
	end
	return u666
end))