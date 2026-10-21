local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local DialogSize = FoundationModule.Enums.DialogSize
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local FFlagAccountUpgradeOAuthDialogFitsContentModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeOAuthDialogFitsContent)

local function useFitHeights(IsFitsContent)
	-- upvalues: FoundationModule (copy), ReactModule (copy)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(1e999)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: IsFitsContent (copy), UseOverlayResult (copy), UseBindingResult2 (copy)
		if not IsFitsContent or UseOverlayResult == nil then return end
		local function updateOverlayHeight()
			-- upvalues: UseBindingResult2 (upval), UseOverlayResult (copy)
			UseBindingResult2(UseOverlayResult.AbsoluteSize.Y)
		end
		
		UseBindingResult2(UseOverlayResult.AbsoluteSize.Y)
		local Connection = UseOverlayResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateOverlayHeight)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { IsFitsContent, UseOverlayResult })
	
	return {
		overlayHeight = UseBindingResult,
		headerHeight = UseBindingResult1,
		setHeaderHeight = UseBindingResult2_1,
		contentHeight = UseBindingResult3,
		setContentHeight = UseBindingResult2_2
	}
end

return function(p1)
	-- upvalues: FoundationModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagAccountUpgradeOAuthDialogFitsContentModule (copy), useFitHeights (copy), ReactModule (copy), View (copy), Text (copy), Dialog (copy), Icon (copy), IconName (copy), IconSize (copy), DialogSize (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseFocusRootResult = UseFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p1.isFocusable
	})
	local TestId = p1.testId or "account-upgrade-dialog"
	local IsFitsContent: boolean = FFlagAccountUpgradeOAuthDialogFitsContentModule and p1.fitsContent == true
	local UseFitHeightsResult = if FFlagAccountUpgradeOAuthDialogFitsContentModule then useFitHeights(IsFitsContent) else nil
	local Element = nil
	
	if p1.title and IsFitsContent then
		Element = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 1,
			padding = {
				top = UDim.new(0, UseTokensResult.Size.Size_500),
				right = UDim.new(0, UseTokensResult.Size.Size_400 + UseTokensResult.Size.Size_1000)
			},
			testId = `{TestId}--title`
		}, {
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = p1.title
			})
		})
	elseif p1.title then
		Element = ReactModule.createElement(Dialog.Title, { text = p1.title })
	end
	if p1.subtitle then
		Element = ReactModule.createElement(View, {
			tag = "col gap-xsmall size-full-0 auto-y",
			LayoutOrder = 1,
			testId = `{TestId}--header`
		}, {
			Title = Element,
			Subtitle = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				LayoutOrder = 2,
				Text = p1.subtitle,
				testId = `{TestId}--subtitle`
			})
		})
	end
	if p1.onCloseActivated then
		local Size400 = UseTokensResult.Size.Size_400
		Element = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
			Title = Element,
			CloseButtonAnchor = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = -2147483648,
				Size = UDim2.fromScale(1, 0)
			}, {
				CloseButton = ReactModule.createElement(View, {
					tag = "row align-x-center align-y-center anchor-top-right clip",
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
					padding = UDim.new(0, UseTokensResult.Size.Size_200),
					cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
					cursor = {
						radius = UDim.new(0, UseTokensResult.Radius.Medium),
						offset = UseTokensResult.Size.Size_150,
						borderWidth = UseTokensResult.Stroke.Thicker
					},
					onActivated = p1.onCloseActivated,
					Position = UDim2.new(1, UseTokensResult.Padding.XLarge - Size400, 0, Size400),
					testId = `{TestId}--close-button`
				}, {
					Icon = ReactModule.createElement(Icon, {
						name = IconName.X,
						size = IconSize.Large,
						style = UseTokensResult.Color.Content.Emphasis
					})
				})
			})
		})
	end
	local Element1 = nil
	if IsFitsContent and UseFitHeightsResult then
		local SetHeaderHeightFunction = UseFitHeightsResult.setHeaderHeight
		local SetContentHeightFunction = UseFitHeightsResult.setContentHeight
		
		if Element then
			Element = ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y",
				LayoutOrder = 1,
				onAbsoluteSizeChanged = function(Frame)
					-- upvalues: SetHeaderHeightFunction (copy)
					SetHeaderHeightFunction(Frame.AbsoluteSize.Y)
				end
			}, { Header = Element })
		end
		Element1 = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = `{TestId}--content`
		}, {
			ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(),
				Size = ReactModule.joinBindings({
					UseFitHeightsResult.overlayHeight,
					UseFitHeightsResult.headerHeight,
					UseFitHeightsResult.contentHeight
				}):map(function(Entry): UDim2
					-- upvalues: UseTokensResult (copy)
					local Entry1: number = Entry[2]
					
					return UDim2.new(1, 0, 0, (math.min(math.ceil(Entry[3]), (math.max(0, Entry[1] - (UseTokensResult.Padding.XLarge * 3 + Entry1 + (if Entry1 > 0 then UseTokensResult.Gap.XLarge else 0)))))))
				end),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
				ScrollBarThickness = UseTokensResult.Size.Size_150,
				ScrollBarImageColor3 = UseTokensResult.Color.Shift.Shift_400.Color3,
				ScrollBarImageTransparency = UseTokensResult.Color.Shift.Shift_400.Transparency
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
					SortOrder = Enum.SortOrder.LayoutOrder,
					[ReactModule.Change.AbsoluteContentSize] = function(p2)
						-- upvalues: SetContentHeightFunction (copy)
						SetContentHeightFunction(p2.AbsoluteContentSize.Y)
					end
				}),
				Children = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
			})
		})
	else
		Element1 = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, p1.children)
	end
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		ref = UseFocusRootResult,
		size = DialogSize.Medium,
		hasBackdrop = p1.hasBackdrop,
		onClose = if p1.onCloseActivated then nil else p1.onClose,
		testId = TestId
	}, {
		Title = Element,
		Content = Element1,
		Actions = p1.actions
	})
end