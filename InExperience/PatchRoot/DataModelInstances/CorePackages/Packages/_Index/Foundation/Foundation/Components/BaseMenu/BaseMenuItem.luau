local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local LoggerModule = require(Foundation.Utility.Logger)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Foundation.Constants)
local IconModule = require(Foundation.Components.Icon)
local PopoverModule = require(Foundation.Components.Popover)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UseBindableModule = require(Foundation.Utility.useBindable)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseComposedRefFunction = require(Parent.ReactUtils).useComposedRef
local _ = require(Foundation.Enums.InputSize)
local PopoverAlignModule = require(Foundation.Enums.PopoverAlign)
local PopoverSideModule = require(Foundation.Enums.PopoverSide)
local RadiusModule = require(Foundation.Enums.Radius)
local FlagsModule = require(Foundation.Utility.Flags)
local BaseMenuItemAccessoryModule = require(script.Parent.BaseMenuItemAccessory)
local BaseMenuContextModule = require(script.Parent.BaseMenuContext)
local BaseMenuScrollContainerModule = require(script.Parent.BaseMenuScrollContainer)
local UseBaseMenuItemVariantsModule = require(script.Parent.useBaseMenuItemVariants)
local UseMenuItemHoverModule = require(script.Parent.useMenuItemHover)
local config = { isChecked = false }

local function _(IconName) --[[ Line: 68 | Named "resolveAccessory" ]]
	return if IconName == nil then nil elseif type(IconName) == "string" then { iconName = IconName } else IconName
end

local InputSink = (function() --[[ Line: 81 | Named "getInputSinkAll" ]]
	-- upvalues: FlagsModule (copy)
	if not FlagsModule.FoundationGuiObjectInputSinkProperty then
		return nil
	end
	local Success, Result = pcall(game.GetEngineFeature, game, "GuiObjectInputSink")
	
	if Success and Result then
		local Success1, Result1 = pcall(function() --[[ Line: 91 ]]
			return Enum.InputSink.All
		end)
		
		return if Success1 then Result1 else nil
	else
		return nil
	end
end)()

local function getContainerPadding(Container, IsIsChecked) --[[ Line: 100 ]]
	return {
		left = UDim.new(0, (if IsIsChecked then Container.paddingLeftWithCheck else Container.paddingLeftWithoutCheck) or 0),
		right = UDim.new(0, Container.paddingRight or 0)
	}
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2) --[[ Line: 109 | Named "BaseMenuItem" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), BaseMenuContextModule (copy), UseTokensModule (copy), FlagsModule (copy), UseBaseMenuItemVariantsModule (copy), UseMenuItemHoverModule (copy), LoggerModule (copy), UseBindableModule (copy), UseComposedRefFunction (copy), getContainerPadding (copy), ViewModule (copy), IconModule (copy), BuilderIconsModule (copy), BaseMenuItemAccessoryModule (copy), TextModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), BaseMenuScrollContainerModule (copy), InputSink (copy), PopoverModule (copy), PopoverSideModule (copy), PopoverAlignModule (copy), RadiusModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseContextResult = ReactModule.useContext(BaseMenuContextModule)
	local IsHasLeading = if WithDefaultsModuleResult.menuHasLeading == nil then UseContextResult.hasLeading == true else WithDefaultsModuleResult.menuHasLeading
	local IsIsChecked = if WithDefaultsModuleResult.menuHasCheck == nil then WithDefaultsModuleResult.isChecked == true else WithDefaultsModuleResult.menuHasCheck
	local UseTokensModuleResult = UseTokensModule()
	local Size = WithDefaultsModuleResult.size or UseContextResult.size
	local Depth = UseContextResult.depth
	local HasChildren = WithDefaultsModuleResult.children ~= nil
	local IsHoverOpenPathEntryMatch: boolean = HasChildren and UseContextResult.hoverOpenPath[Depth] == WithDefaultsModuleResult.id
	local Leading = WithDefaultsModuleResult.leading or WithDefaultsModuleResult.icon
	local Config = if Leading == nil then nil elseif type(Leading) == "string" then { iconName = Leading } else Leading
	local Trailing = WithDefaultsModuleResult.trailing
	local Config1 = if Trailing == nil then nil elseif type(Trailing) == "string" then { iconName = Trailing } else Trailing
	local HasMaxHeight: boolean = FlagsModule.FoundationBaseMenuSubmenuMaxHeight and UseContextResult.maxHeight ~= nil
	local UseBaseMenuItemVariantsModuleResult = UseBaseMenuItemVariantsModule(UseTokensModuleResult, Size, HasMaxHeight)
	local UseRefResult = ReactModule.useRef(nil)
	local NoHasChildren: boolean = WithDefaultsModuleResult.isChecked == true and not HasChildren
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 131 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local HasConfig = Config ~= nil
	ReactModule.useEffect(function() --[[ Line: 136 ]]
		-- upvalues: HasConfig (copy), UseContextResult (copy)
		if HasConfig and UseContextResult.setHasLeading then
			UseContextResult.setHasLeading()
		end
	end, { HasConfig, UseContextResult.setHasLeading })
	UseMenuItemHoverModule({
		itemRef = UseRefResult,
		id = WithDefaultsModuleResult.id,
		depth = Depth,
		isSubmenu = HasChildren,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		hoverOpenAtDepth = UseContextResult.hoverOpenAtDepth,
		hoverCloseAtDepth = UseContextResult.hoverCloseAtDepth
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 153 ]]
		-- upvalues: HasChildren (copy), WithDefaultsModuleResult (copy), UseContextResult (copy), IsHoverOpenPathEntryMatch (copy), Depth (copy), LoggerModule (upval)
		if not HasChildren then
			if UseContextResult.hoverReset then
				UseContextResult.hoverReset()
			end
			local OnActivated: (any) -> () = if WithDefaultsModuleResult.onActivated then WithDefaultsModuleResult.onActivated else UseContextResult.onActivated
			
			if OnActivated then
				OnActivated(WithDefaultsModuleResult.id)
			else
				LoggerModule:warning("Menu should have either onActivated on itself or on all of its children")
			end
			if Depth > 1 and UseContextResult.onNestedLeafActivated then
				UseContextResult.onNestedLeafActivated()
			end
		elseif WithDefaultsModuleResult.isDisabled then return end
		if UseContextResult.hoverOpenAtDepth and not IsHoverOpenPathEntryMatch then
			UseContextResult.hoverOpenAtDepth(Depth, WithDefaultsModuleResult.id, true)
			
			return
		end
	end, {
		HasChildren, WithDefaultsModuleResult.isDisabled, IsHoverOpenPathEntryMatch,
		Depth, WithDefaultsModuleResult.id, WithDefaultsModuleResult.onActivated,
		UseContextResult.onActivated, UseContextResult.onNestedLeafActivated,
		UseContextResult.hoverOpenAtDepth, UseContextResult.hoverReset
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 194 ]]
		-- upvalues: UseContextResult (copy)
		if UseContextResult.hoverReset then
			UseContextResult.hoverReset()
		end
	end, { UseContextResult.hoverReset })
	local UseBindableModuleResult = UseBindableModule(UseContextResult.maxHeight)
	local Element = ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		onActivated = UseResult1,
		selection = { Selectable = not WithDefaultsModuleResult.isDisabled },
		cursor = ReactModule.useMemo(function() --[[ Line: 202 ]]
			-- upvalues: UseTokensModuleResult (copy)
			return {
				radius = UDim.new(0, UseTokensModuleResult.Radius.Small),
				offset = UseTokensModuleResult.Size.Size_200,
				borderWidth = UseTokensModuleResult.Stroke.Thicker
			}
		end, { UseTokensModuleResult }),
		tag = UseBaseMenuItemVariantsModuleResult.container.tag,
		padding = getContainerPadding(UseBaseMenuItemVariantsModuleResult.container, IsIsChecked),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		ref = UseComposedRefFunction(UseRefResult, p2)
	}), {
		Check = if IsIsChecked then ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = `{UseBaseMenuItemVariantsModuleResult.slotAlign.tag} {UseBaseMenuItemVariantsModuleResult.check.tag}`,
			testId = `{WithDefaultsModuleResult.testId}--check-column`
		}, {
			Check = if NoHasChildren then ReactModule.createElement(IconModule, {
				name = BuilderIconsModule.Icon.Check,
				style = UseBaseMenuItemVariantsModuleResult.check.style,
				size = UseBaseMenuItemVariantsModuleResult.check.size,
				testId = `{WithDefaultsModuleResult.testId}--checkmark`
			}) else nil
		}) else nil,
		Wrapper = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = "auto-xy",
			flexItem = { FlexMode = Enum.UIFlexMode.Fill },
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, UseBaseMenuItemVariantsModuleResult.wrapper and UseBaseMenuItemVariantsModuleResult.wrapper.gap or 0),
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, {
			Leading = if Config == nil then if IsHasLeading then ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = `{UseBaseMenuItemVariantsModuleResult.slotAlign.tag} {UseBaseMenuItemVariantsModuleResult.icon.tag}`
			}) else nil else ReactModule.createElement(BaseMenuItemAccessoryModule, {
				LayoutOrder = 1,
				accessory = Config,
				iconVariant = UseBaseMenuItemVariantsModuleResult.icon,
				size = Size,
				tokens = UseTokensModuleResult,
				testId = `{WithDefaultsModuleResult.testId}--leading`
			}),
			Title = ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				Text = WithDefaultsModuleResult.text,
				tag = UseBaseMenuItemVariantsModuleResult.text.tag
			}),
			Trailing = if HasChildren then ReactModule.createElement(IconModule, {
				LayoutOrder = 3,
				name = BuilderIconsModule.Icon.ChevronSmallRight,
				style = UseBaseMenuItemVariantsModuleResult.check.style,
				size = UseBaseMenuItemVariantsModuleResult.chevron.size,
				testId = `{WithDefaultsModuleResult.testId}--chevron`
			}) elseif Config1 == nil then nil else ReactModule.createElement(BaseMenuItemAccessoryModule, {
				LayoutOrder = 3,
				accessory = Config1,
				iconVariant = UseBaseMenuItemVariantsModuleResult.icon,
				size = Size,
				tokens = UseTokensModuleResult,
				testId = `{WithDefaultsModuleResult.testId}--trailing`
			})
		})
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 320 ]]
		-- upvalues: UseContextResult (copy), Size (copy), UseStateResult (copy), UseResult (copy), Depth (copy)
		return {
			onActivated = UseContextResult.onActivated,
			onNestedLeafActivated = UseContextResult.onNestedLeafActivated,
			size = Size,
			hasLeading = UseStateResult,
			setHasLeading = UseResult,
			hoverOpenPath = UseContextResult.hoverOpenPath,
			hoverOpenAtDepth = UseContextResult.hoverOpenAtDepth,
			hoverCloseAtDepth = UseContextResult.hoverCloseAtDepth,
			hoverReset = UseContextResult.hoverReset,
			depth = Depth + 1,
			maxHeight = UseContextResult.maxHeight
		}
	end, {
		UseContextResult.onActivated, UseContextResult.onNestedLeafActivated, Size,
		UseStateResult, UseContextResult.hoverOpenPath,
		UseContextResult.hoverOpenAtDepth, UseContextResult.hoverCloseAtDepth,
		UseContextResult.hoverReset, Depth, UseContextResult.maxHeight
	})
	
	if HasChildren then
		local Size1: number = UseBaseMenuItemVariantsModuleResult.groupPadding.size
		local Element1 = ReactModule.createElement(BaseMenuContextModule.Provider, { value = UseMemoResult }, WithDefaultsModuleResult.children)
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			Item = Element,
			Submenu = ReactModule.createElement(PopoverModule.Root, {
				isOpen = IsHoverOpenPathEntryMatch,
				testId = `{WithDefaultsModuleResult.testId}--submenu`
			}, {
				Anchor = ReactModule.createElement(PopoverModule.Anchor, { anchorRef = UseRefResult }),
				Content = ReactModule.createElement(PopoverModule.Content, {
					hasArrow = false,
					side = {
						position = PopoverSideModule.Right,
						offset = Size1 / 2 + UseTokensModuleResult.Stroke.Standard
					},
					align = { position = PopoverAlignModule.Start, offset = -Size1 },
					onPressedOutside = UseResult2,
					backgroundStyle = UseTokensModuleResult.Color.Surface.Surface_200,
					radius = RadiusModule.Medium
				}, if HasMaxHeight then ReactModule.createElement(BaseMenuScrollContainerModule, {
					maxHeight = UseBindableModuleResult,
					scrollViewProps = {
						tag = UseBaseMenuItemVariantsModuleResult.submenuContent.tag,
						InputSink = InputSink
					}
				}, Element1) else ReactModule.createElement(ViewModule, {
					tag = UseBaseMenuItemVariantsModuleResult.submenuContent.tag,
					InputSink = InputSink
				}, Element1))
			})
		})
	else
		return Element
	end
end))