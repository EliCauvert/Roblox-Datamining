local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local IsBuilderOrMigratedIconFunction = require(Foundation.Utility.iconMigrationUtils).isBuilderOrMigratedIcon
local LoggerModule = require(Foundation.Utility.Logger)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Foundation.Constants)
local IconModule = require(Foundation.Components.Icon)
local ImageModule = require(Foundation.Components.Image)
local PopoverModule = require(Foundation.Components.Popover)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
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
local UseBaseMenuItemVariantsModule = require(script.Parent.useBaseMenuItemVariants)
local UseMenuItemHoverModule = require(script.Parent.useMenuItemHover)
local config = { isChecked = false }

local function _(IconName)
	return if IconName == nil then nil elseif type(IconName) == "string" then { iconName = IconName } else IconName
end

local InputSink = (function()
	-- upvalues: FlagsModule (copy)
	if not FlagsModule.FoundationGuiObjectInputSinkProperty then
		return nil
	end
	local Success, Result = pcall(game.GetEngineFeature, game, "GuiObjectInputSink")
	
	if Success and Result then
		local Success1, Result1 = pcall(function()
			return Enum.InputSink.All
		end)
		
		return if Success1 then Result1 else nil
	else
		return nil
	end
end)()

local function getContainerPadding(Container, IsIsChecked)
	return {
		left = UDim.new(0, (if IsIsChecked then Container.paddingLeftWithCheck else Container.paddingLeftWithoutCheck) or 0),
		right = UDim.new(0, Container.paddingRight or 0)
	}
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), BaseMenuContextModule (copy), FlagsModule (copy), UseTokensModule (copy), UseBaseMenuItemVariantsModule (copy), UseMenuItemHoverModule (copy), LoggerModule (copy), BuilderIconsModule (copy), UseComposedRefFunction (copy), getContainerPadding (copy), ViewModule (copy), IconModule (copy), BaseMenuItemAccessoryModule (copy), TextModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), IsBuilderOrMigratedIconFunction (copy), ImageModule (copy), PopoverModule (copy), PopoverSideModule (copy), PopoverAlignModule (copy), RadiusModule (copy), InputSink (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseContextResult = ReactModule.useContext(BaseMenuContextModule)
	local IsHasLeading = nil
	local IsIsChecked = nil
	
	if FlagsModule.FoundationBaseMenuBeta then
		IsHasLeading = if WithDefaultsModuleResult.menuHasLeading == nil then UseContextResult.hasLeading == true else WithDefaultsModuleResult.menuHasLeading
		IsIsChecked = if WithDefaultsModuleResult.menuHasCheck == nil then WithDefaultsModuleResult.isChecked == true else WithDefaultsModuleResult.menuHasCheck
	else
		IsHasLeading = UseContextResult.hasLeading == true
		IsIsChecked = false
	end
	local UseTokensModuleResult = UseTokensModule()
	local Size = WithDefaultsModuleResult.size or UseContextResult.size
	local Depth: number = UseContextResult.depth
	local HasChildren = WithDefaultsModuleResult.children ~= nil
	local IsHoverOpenPathEntryMatch: boolean = HasChildren and UseContextResult.hoverOpenPath[Depth] == WithDefaultsModuleResult.id
	local Config = nil
	
	if FlagsModule.FoundationBaseMenuBeta then
		local Leading = WithDefaultsModuleResult.leading or WithDefaultsModuleResult.icon
		Config = if Leading == nil then nil elseif type(Leading) == "string" then { iconName = Leading } else Leading
	else
		Config = nil
	end
	local Config1 = nil
	if FlagsModule.FoundationBaseMenuBeta then
		local Trailing = WithDefaultsModuleResult.trailing
		Config1 = if Trailing == nil then nil elseif type(Trailing) == "string" then { iconName = Trailing } else Trailing
	else
		Config1 = nil
	end
	local UseBaseMenuItemVariantsModuleResult = UseBaseMenuItemVariantsModule(UseTokensModuleResult, Size, not HasChildren and WithDefaultsModuleResult.isChecked)
	local UseRefResult = ReactModule.useRef(nil)
	local NoHasChildren: boolean = WithDefaultsModuleResult.isChecked == true and not HasChildren
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local HasConfig: boolean = if FlagsModule.FoundationBaseMenuBeta then Config ~= nil else WithDefaultsModuleResult.icon ~= nil
	ReactModule.useEffect(function()
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
	local UseResult1 = ReactModule.useCallback(function()
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
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy)
		if UseContextResult.hoverReset then
			UseContextResult.hoverReset()
		end
	end, { UseContextResult.hoverReset })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensModuleResult (copy)
		return {
			radius = UDim.new(0, UseTokensModuleResult.Radius.Small),
			offset = UseTokensModuleResult.Size.Size_200,
			borderWidth = UseTokensModuleResult.Stroke.Thicker
		}
	end, { UseTokensModuleResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: BuilderIconsModule (upval), WithDefaultsModuleResult (copy)
		return BuilderIconsModule.Migration.uiblox[WithDefaultsModuleResult.icon]
	end, { WithDefaultsModuleResult.icon })
	local UseComposedRefResult = UseComposedRefFunction(UseRefResult, p2)
	local Element = if FlagsModule.FoundationBaseMenuBeta then ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		onActivated = UseResult1,
		selection = { Selectable = not WithDefaultsModuleResult.isDisabled },
		cursor = UseMemoResult,
		tag = UseBaseMenuItemVariantsModuleResult.container.tag,
		padding = getContainerPadding(UseBaseMenuItemVariantsModuleResult.container, IsIsChecked),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		ref = UseComposedRefResult
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
	}) else ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		onActivated = UseResult1,
		selection = { Selectable = not WithDefaultsModuleResult.isDisabled },
		cursor = UseMemoResult,
		tag = UseBaseMenuItemVariantsModuleResult.container.tag,
		ref = UseComposedRefResult
	}), {
		Icon = if WithDefaultsModuleResult.icon or IsHasLeading then if WithDefaultsModuleResult.icon and IsBuilderOrMigratedIconFunction(WithDefaultsModuleResult.icon) then ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = `align-x-center align-y-center {UseBaseMenuItemVariantsModuleResult.icon.tag}`
		}, {
			Icon = ReactModule.createElement(IconModule, {
				name = if UseMemoResult1 then UseMemoResult1.name else WithDefaultsModuleResult.icon,
				style = UseBaseMenuItemVariantsModuleResult.icon.style,
				size = UseBaseMenuItemVariantsModuleResult.icon.size
			})
		}) else ReactModule.createElement(ImageModule, {
			LayoutOrder = 1,
			Image = WithDefaultsModuleResult.icon,
			tag = UseBaseMenuItemVariantsModuleResult.icon.tag
		}) else nil,
		Text = ReactModule.createElement(TextModule, {
			LayoutOrder = 2,
			Text = WithDefaultsModuleResult.text,
			tag = UseBaseMenuItemVariantsModuleResult.text.tag
		}),
		Chevron = if HasChildren then ReactModule.createElement(IconModule, {
			LayoutOrder = 3,
			name = BuilderIconsModule.Icon.ChevronSmallRight,
			style = UseBaseMenuItemVariantsModuleResult.check.style,
			size = UseBaseMenuItemVariantsModuleResult.chevron.size,
			testId = `{WithDefaultsModuleResult.testId}--chevron`
		}) else nil,
		Check = if HasChildren or not WithDefaultsModuleResult.isChecked then nil else ReactModule.createElement(IconModule, {
			LayoutOrder = 3,
			name = BuilderIconsModule.Icon.Check,
			style = UseBaseMenuItemVariantsModuleResult.check.style,
			size = UseBaseMenuItemVariantsModuleResult.check.size,
			testId = `{WithDefaultsModuleResult.testId}--checkmark`
		})
	})
	
	if HasChildren then
		local Size1: number = UseBaseMenuItemVariantsModuleResult.groupPadding.size
		
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
					backgroundStyle = if FlagsModule.FoundationBaseMenuBeta then UseTokensModuleResult.Color.Surface.Surface_200 else UseTokensModuleResult.Color.Surface.Surface_100,
					radius = RadiusModule.Medium
				}, ReactModule.createElement(ViewModule, {
					tag = UseBaseMenuItemVariantsModuleResult.submenuContent.tag,
					InputSink = InputSink
				}, ReactModule.createElement(BaseMenuContextModule.Provider, {
					value = {
						onActivated = UseContextResult.onActivated,
						onNestedLeafActivated = UseContextResult.onNestedLeafActivated,
						size = Size,
						hasLeading = UseStateResult,
						setHasLeading = UseResult,
						hoverOpenPath = UseContextResult.hoverOpenPath,
						hoverOpenAtDepth = UseContextResult.hoverOpenAtDepth,
						hoverCloseAtDepth = UseContextResult.hoverCloseAtDepth,
						hoverReset = UseContextResult.hoverReset,
						depth = Depth + 1
					}
				}, WithDefaultsModuleResult.children)))
			})
		})
	else
		return Element
	end
end))