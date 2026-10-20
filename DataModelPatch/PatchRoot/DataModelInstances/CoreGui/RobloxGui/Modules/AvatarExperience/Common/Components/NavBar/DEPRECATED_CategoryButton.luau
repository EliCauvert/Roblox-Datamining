local CoreGui = game:GetService("CoreGui")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithStyleFunction = UIBloxModule.Style.withStyle
local Interactable = UIBloxModule.Core.Control.Interactable
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local UseCategoryButtonTooltipModule = require(Modules.AvatarExperience.Common.Components.NavBar.useCategoryButtonTooltip)
local NewItemNotificationModule = require(Modules.AvatarExperience.Common.Components.NavBar.NewItemNotification)
local AXTooltip = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.AXTooltip
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXCatalogHeadCategoryCombineIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXCatalogCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXCatalogCategoryTooltip
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXMigrateCategoryTooltip
local FFlagAXAddHDCatalogTooltip = AvatarExperienceFlagsModule.FFlagAXAddHDCatalogTooltip
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local DebounceModule = require(Modules.LuaApp.Util.debounce)
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Popover = FoundationModule.Popover
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local Radius = FoundationModule.Enums.Radius
local CategoryButton = RoactModule.PureComponent:extend("CategoryButton")

function CategoryButton.renderButtonChild(p1, p2, p3, Callback, p4, Callback1)
	-- upvalues: Text (copy), FFlagAXCatalogCategoriesSDUI (copy), RoactModule (copy), Focusable (copy), Interactable (copy), CursorKind (copy), NewItemNotificationModule (copy)
	local _Font = p3.Font
	local Theme = p3.Theme
	local IsSelected = p1.props.isSelected
	local HeaderFont = _Font.Header2.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
	
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(0, Text.GetTextWidth(if FFlagAXCatalogCategoriesSDUI and p1.props.localizedCategoryTitle then p1.props.localizedCategoryTitle else p2.title, HeaderFont, ScaledBaseSize) + 20, 1, 0),
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.layoutOrder,
		[RoactModule.Change.AbsoluteSize] = p4,
		[RoactModule.Change.AbsolutePosition] = function(p5)
			-- upvalues: p1 (copy), Callback1 (copy)
			if p1.delayedSetReadyToShowTooltip then
				p1.delayedSetReadyToShowTooltip()
			end
			if Callback1 then
				Callback1(p5)
			end
		end,
		[RoactModule.Ref] = p1.props.frameRef
	}, {
		Button = RoactModule.createElement(Focusable[Interactable], {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[RoactModule.Event.Activated] = p1.onActivated,
			[RoactModule.Ref] = p1.props.forwardRef,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			SelectionImageObject = Callback(CursorKind.NavHighlight)
		}, RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = if FFlagAXCatalogCategoriesSDUI and p1.props.localizedCategoryTitle then p1.props.localizedCategoryTitle else p2.title,
			TextSize = ScaledBaseSize,
			TextColor3 = IsSelected and Theme.TextEmphasis.Color or Theme.TextMuted.Color,
			TextTransparency = IsSelected and Theme.TextEmphasis.Transparency or Theme.TextMuted.Transparency,
			Font = HeaderFont,
			Size = UDim2.new(1, 0, 1, 0)
		})),
		NewItemNotification = p1.props.hasNewItemNotification and RoactModule.createElement(NewItemNotificationModule, { isSelected = IsSelected })
	})
end

function CategoryButton.tryDismissTooltip(p1)
	local ReadyToShowTooltipFromTimestamp = p1.state.readyToShowTooltipFromTimestamp
	
	if not ReadyToShowTooltipFromTimestamp or p1.state.isTooltipDismissed then return end
	if os.difftime(os.time(), ReadyToShowTooltipFromTimestamp) < 3 then return end
	if p1.props.onTooltipDismiss then
		p1.props.onTooltipDismiss()
	end
	p1:setState({ isTooltipDismissed = true })
end

function CategoryButton.renderButtonWithTooltip(p1, p2, p3, p4)
	-- upvalues: WithTooltipFunction (copy), TooltipOrientation (copy), CoreGui (copy), RoactModule (copy), ExternalEventConnection (copy), UserInputService (copy)
	return WithTooltipFunction({
		useLargeDropShadow = true,
		bodyText = p1.props.tooltipTitle
	}, {
		DisplayOrder = 100,
		triggerPointName = `{p1.props.categoryName}-Tooltip`,
		preferredOrientation = TooltipOrientation.Bottom,
		guiTarget = CoreGui,
		active = not p1.props.isHidden and (p1.state.readyToShowTooltipFromTimestamp and not p1.state.isTooltipDismissed)
	}, function(p5)
		-- upvalues: RoactModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), ExternalEventConnection (upval), UserInputService (upval)
		return RoactModule.createFragment({
			CategoryButton = p1:renderButtonChild(p2, p3, p4, p5, p5),
			OnInputBegan = RoactModule.createElement(ExternalEventConnection, {
				event = UserInputService.InputBegan,
				callback = function()
					-- upvalues: p1 (upval)
					p1:tryDismissTooltip()
				end
			})
		})
	end)
end

function CategoryButton.renderWithLocalized(p1, p2)
	-- upvalues: Text (copy), FFlagAXCatalogCategoriesSDUI (copy), WithSelectionCursorProviderFunction (copy), FFlagAXMigrateCategoryTooltip (copy), RoactModule (copy), Popover (copy), Focusable (copy), Interactable (copy), CursorKind (copy), NewItemNotificationModule (copy), PopoverAlign (copy), PopoverSide (copy), Radius (copy), FoundationModule (copy), AXCatalogHeadCategoryCombineIXPModule (copy), AXTooltip (copy), FFlagAXAddHDCatalogTooltip (copy), WithStyleFunction (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: p1 (copy), Text (upval), FFlagAXCatalogCategoriesSDUI (upval), p2 (copy), WithSelectionCursorProviderFunction (upval), FFlagAXMigrateCategoryTooltip (upval), RoactModule (upval), Popover (upval), Focusable (upval), Interactable (upval), CursorKind (upval), NewItemNotificationModule (upval), PopoverAlign (upval), PopoverSide (upval), Radius (upval), FoundationModule (upval), AXCatalogHeadCategoryCombineIXPModule (upval), AXTooltip (upval), FFlagAXAddHDCatalogTooltip (upval)
		local _Font = p3.Font
		local Theme = p3.Theme
		local IsSelected = p1.props.isSelected
		local HeaderFont = _Font.Header2.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
		local Color = IsSelected and Theme.TextEmphasis.Color or Theme.TextMuted.Color
		local Transparency = IsSelected and Theme.TextEmphasis.Transparency or Theme.TextMuted.Transparency
		local NewTextWidth = Text.GetTextWidth(if FFlagAXCatalogCategoriesSDUI and p1.props.localizedCategoryTitle then p1.props.localizedCategoryTitle else p2.title, HeaderFont, ScaledBaseSize) + 20
		local HasNewItemNotification = p1.props.hasNewItemNotification
		local ForwardRef = p1.props.forwardRef
		local FrameRef = p1.props.frameRef
		
		return WithSelectionCursorProviderFunction(function(Callback)
			-- upvalues: FFlagAXMigrateCategoryTooltip (upval), p1 (upval), RoactModule (upval), NewTextWidth (copy), FrameRef (copy), Popover (upval), Focusable (upval), Interactable (upval), ForwardRef (copy), CursorKind (upval), FFlagAXCatalogCategoriesSDUI (upval), p2 (upval), ScaledBaseSize (copy), Color (copy), Transparency (copy), HeaderFont (copy), HasNewItemNotification (copy), NewItemNotificationModule (upval), IsSelected (copy), PopoverAlign (upval), PopoverSide (upval), Radius (upval), FoundationModule (upval), AXCatalogHeadCategoryCombineIXPModule (upval), p3 (copy), AXTooltip (upval), FFlagAXAddHDCatalogTooltip (upval)
			return if FFlagAXMigrateCategoryTooltip or not p1.props.tooltipOpen then if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and p1.enableHeadCategoryCombine and p1.props.tooltipTitle and not p1.props.isSpatial then p1:renderButtonWithTooltip(p2, p3, Callback) else RoactModule.createElement("Frame", {
				Size = UDim2.new(0, NewTextWidth, 1, 0),
				BackgroundTransparency = 1,
				LayoutOrder = p1.props.layoutOrder,
				[RoactModule.Ref] = FrameRef
			}, {
				Button = RoactModule.createElement(Focusable[Interactable], {
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 0, 0.5, 0),
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					[RoactModule.Event.Activated] = p1.onActivated,
					[RoactModule.Ref] = ForwardRef,
					NextSelectionLeft = p1.props.NextSelectionLeft,
					NextSelectionRight = p1.props.NextSelectionRight,
					NextSelectionUp = p1.props.NextSelectionUp,
					NextSelectionDown = p1.props.NextSelectionDown,
					SelectionImageObject = Callback(CursorKind.NavHighlight)
				}, {
					AXTooltip = FFlagAXMigrateCategoryTooltip and RoactModule.createElement(AXTooltip, {
						popoverSide = if FFlagAXAddHDCatalogTooltip then p1.props.popoverSide else "Top",
						tooltipLocalizationKey = p1.props.categoryTooltipLocalizationKey,
						tooltipStorageKey = p1.props.categoryTooltipKey or "",
						dismissTooltipRef = p1.props.dismissTooltipRef,
						showTooltip = p1.props.showTooltip,
						localizedText = if FFlagAXCatalogCategoriesSDUI then p1.props.categoryLocalizedTooltipBody else nil
					}),
					RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = if FFlagAXCatalogCategoriesSDUI and p1.props.localizedCategoryTitle then p1.props.localizedCategoryTitle else p2.title,
						TextSize = ScaledBaseSize,
						TextColor3 = Color,
						TextTransparency = Transparency,
						Font = HeaderFont,
						Size = UDim2.new(1, 0, 1, 0)
					})
				}),
				NewItemNotification = HasNewItemNotification and RoactModule.createElement(NewItemNotificationModule, { isSelected = IsSelected })
			}) else RoactModule.createElement("Frame", {
				Size = UDim2.new(0, NewTextWidth, 1, 0),
				BackgroundTransparency = 1,
				LayoutOrder = p1.props.layoutOrder,
				[RoactModule.Ref] = FrameRef
			}, RoactModule.createElement(Popover.Root, { isOpen = true }, {
				Anchor = RoactModule.createElement(Popover.Anchor, nil, {
					Button = RoactModule.createElement(Focusable[Interactable], {
						AnchorPoint = Vector2.new(0, 0),
						Position = UDim2.new(0, 0, 0, 0),
						Size = UDim2.new(0, NewTextWidth, 0, p1.props.navBarHeight),
						BackgroundTransparency = 1,
						[RoactModule.Event.Activated] = p1.onActivated,
						ref = ForwardRef,
						NextSelectionLeft = p1.props.NextSelectionLeft,
						NextSelectionRight = p1.props.NextSelectionRight,
						NextSelectionUp = p1.props.NextSelectionUp,
						NextSelectionDown = p1.props.NextSelectionDown,
						SelectionImageObject = Callback(CursorKind.NavHighlight)
					}, RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = if FFlagAXCatalogCategoriesSDUI and p1.props.localizedCategoryTitle then p1.props.localizedCategoryTitle else p2.title,
						TextSize = ScaledBaseSize,
						TextColor3 = Color,
						TextTransparency = Transparency,
						Font = HeaderFont,
						Size = UDim2.new(1, 0, 1, 0)
					})),
					NewItemNotification = HasNewItemNotification and RoactModule.createElement(NewItemNotificationModule, { isSelected = IsSelected })
				}),
				Content = RoactModule.createElement(Popover.Content, {
					align = PopoverAlign.Center,
					side = PopoverSide.Top,
					backgroundStyle = p1.props.foundationTokens.Color.System.Contrast,
					radius = Radius.Medium
				}, {
					RoactModule.createElement(FoundationModule.View, {
						tag = "col gap-xsmall padding-y-small padding-x-medium auto-xy"
					}, {
						CategoryButtonTooltipTitle = RoactModule.createElement(FoundationModule.Text, {
							tag = "auto-xy text-title-medium content-inverse-emphasis",
							Text = p2.tooltipTitle
						}, {
							TooltipOverlayButton = RoactModule.createElement("TextButton", {
								Transparency = 1,
								[RoactModule.Event.Activated] = p1.props.tooltipActivated,
								Size = UDim2.fromScale(1, 1)
							})
						})
					})
				})
			}))
		end)
	end)
end

function CategoryButton.render(p1)
	-- upvalues: WithLocalizationFunction (copy), FFlagAXCatalogCategoriesSDUI (copy)
	return WithLocalizationFunction({
		title = if FFlagAXCatalogCategoriesSDUI and p1.props.localizedCategoryTitle then nil else p1.props.categoryTitle,
		tooltipTitle = p1.props.tooltipText
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithLocalized(p2)
	end)
end

function CategoryButton.init(p1)
	-- upvalues: AXCatalogHeadCategoryCombineIXPModule (copy), IxpUtilsModule (copy), DebounceModule (copy), FFlagAXMigrateCategoryTooltip (copy)
	if AXCatalogHeadCategoryCombineIXPModule.isEnabled() then
		p1.enableHeadCategoryCombine = IxpUtilsModule.readTestVariable(AXCatalogHeadCategoryCombineIXPModule.EnableHeadCategoryCombination)
		p1.state = {
			readyToShowTooltipFromTimestamp = nil,
			isTooltipDismissed = false
		}
		p1.delayedSetReadyToShowTooltip = DebounceModule(function()
			-- upvalues: p1 (copy)
			if not p1.state.readyToShowTooltipFromTimestamp then
				p1:setState({ readyToShowTooltipFromTimestamp = os.time() })
				
				return
			end
		end, 0.5)
	end
	function p1.onActivated()
		-- upvalues: FFlagAXMigrateCategoryTooltip (upval), p1 (copy)
		if FFlagAXMigrateCategoryTooltip and p1.props.dismissTooltipRef.current then
			p1.props.dismissTooltipRef.current()
		end
		if p1.props.shouldUseCategoryId then
			p1.props.onActivate(p1.props.categoryId)
			
			return
		else
			p1.props.onActivate(p1.props.categoryIndex)
		end
	end
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: UseIsSpatialFunction (copy), FFlagAXAddHDCatalogTooltip (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), FFlagAXMigrateCategoryTooltip (copy), UseCategoryButtonTooltipModule (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), FFlagAXCatalogCategoryTooltip (copy), UseTokensFunction (copy), RoactModule (copy), FFlagAXCatalogCategoriesSDUI (copy), CategoryButton (copy), CryoModule (copy)
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseSelectorResult = if FFlagAXAddHDCatalogTooltip then UseSelectorFunction(SelectIsPortraitModule) else nil
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local v4 = nil
	
	if not FFlagAXMigrateCategoryTooltip then
		v1, v2, v54 = UseCategoryButtonTooltipModule(if FFlagAXRemoveCatalogCategoryNavKey then p1.categoryId else p1.navigationKey, p1.avatarScreenOfOrigin, if FFlagAXCatalogCategoryTooltip then p1.categoryTooltipKey else nil)
		v3 = UseTokensFunction()
	end
	local Ref = nil
	local HasCategoryLocalizedTooltipBody: boolean? = nil
	
	if FFlagAXMigrateCategoryTooltip then
		Ref = RoactModule.createRef()
		HasCategoryLocalizedTooltipBody = p1.categoryTooltipKey ~= nil and p1.categoryTooltipLocalizationKey ~= nil
		
		if FFlagAXCatalogCategoriesSDUI then
			HasCategoryLocalizedTooltipBody = HasCategoryLocalizedTooltipBody and (p1.categoryLocalizedTooltipBody ~= nil or p1.categoryTooltipLocalizationKey ~= nil)
		end
	end
	local Top: string = if FFlagAXAddHDCatalogTooltip then if UseSelectorResult then "Top" else "Bottom" else "Top"
	
	return RoactModule.createElement(CategoryButton, CryoModule.Dictionary.join(p1, {
		forwardRef = ForwardRef,
		isSpatial = UseIsSpatialResult,
		tooltipOpen = if FFlagAXMigrateCategoryTooltip then nil else v1,
		tooltipActivated = if FFlagAXMigrateCategoryTooltip then nil else v2,
		foundationTokens = if FFlagAXMigrateCategoryTooltip then nil else v3,
		tooltipText = if FFlagAXMigrateCategoryTooltip then nil else v4,
		dismissTooltipRef = if FFlagAXMigrateCategoryTooltip then Ref else nil,
		showTooltip = if FFlagAXMigrateCategoryTooltip then HasCategoryLocalizedTooltipBody else nil,
		popoverSide = if FFlagAXAddHDCatalogTooltip then Top else nil
	}))
end)