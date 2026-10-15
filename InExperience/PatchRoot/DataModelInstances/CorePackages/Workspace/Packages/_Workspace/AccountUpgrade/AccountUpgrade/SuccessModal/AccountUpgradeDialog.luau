local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local dialogSize = foundationModule.Enums.DialogSize
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local fFlagAccountUpgradeOAuthDialogFitsContentModule = require(accountUpgrade.Flags.FFlagAccountUpgradeOAuthDialogFitsContent)

local function useFitHeights(p1)
	-- upvalues: foundationModule (ref), reactModule (ref)
	local var1 = foundationModule.Hooks.useOverlay()
	local var2, var3 = reactModule.useBinding(1e999)
	local var4, var5 = reactModule.useBinding(0)
	local var6, var7 = reactModule.useBinding(0)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), var3 (ref)
		if p1 and var1 ~= nil then
			local function updateOverlayHeight()
				-- upvalues: var3 (copy), var1 (ref)
				var3(var1.AbsoluteSize.Y)
			end
			
			var3(var1.AbsoluteSize.Y)
			local var8 = var1:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateOverlayHeight)
			
			return function()
				-- upvalues: var8 (ref)
				var8:Disconnect()
			end
		end
	end, { p1, var1 })
	
	return {
		overlayHeight = var2,
		headerHeight = var4,
		setHeaderHeight = var5,
		canvasHeight = var6,
		setCanvasHeight = var7
	}
end

return function(p1)
	-- upvalues: foundationModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), fFlagAccountUpgradeOAuthDialogFitsContentModule (ref), useFitHeights (ref), reactModule (ref), view (ref), text (ref), dialog (ref), icon (ref), iconName (ref), iconSize (ref), dialogSize (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p1.isFocusable
	})
	local testId = p1.testId or "account-upgrade-dialog"
	local var3 = fFlagAccountUpgradeOAuthDialogFitsContentModule and p1.fitsContent == true
	local var4 = if fFlagAccountUpgradeOAuthDialogFitsContentModule then useFitHeights(var3) else nil
	local var5 = nil
	
	if p1.title and var3 then
		var5 = reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 1,
			padding = {
				top = UDim.new(0, var1.Size.Size_500),
				right = UDim.new(0, var1.Size.Size_400 + var1.Size.Size_1000)
			},
			testId = `{testId}--title`
		}, {
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = p1.title
			})
		})
	elseif p1.title then
		var5 = reactModule.createElement(dialog.Title, { text = p1.title })
	end
	if p1.subtitle then
		var5 = reactModule.createElement(view, {
			tag = "col gap-xsmall size-full-0 auto-y",
			LayoutOrder = 1,
			testId = `{testId}--header`
		}, {
			Title = var5,
			Subtitle = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				LayoutOrder = 2,
				Text = p1.subtitle,
				testId = `{testId}--subtitle`
			})
		})
	end
	if p1.onCloseActivated then
		local size400 = var1.Size.Size_400
		var5 = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
			Title = var5,
			CloseButtonAnchor = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = -2147483648,
				Size = UDim2.fromScale(1, 0)
			}, {
				CloseButton = reactModule.createElement(view, {
					tag = "row align-x-center align-y-center anchor-top-right clip",
					Size = UDim2.fromOffset(var1.Size.Size_1000, var1.Size.Size_1000),
					padding = UDim.new(0, var1.Size.Size_200),
					cornerRadius = UDim.new(0, var1.Radius.Medium),
					cursor = {
						radius = UDim.new(0, var1.Radius.Medium),
						offset = var1.Size.Size_150,
						borderWidth = var1.Stroke.Thicker
					},
					onActivated = p1.onCloseActivated,
					Position = UDim2.new(1, var1.Padding.XLarge - size400, 0, size400),
					testId = `{testId}--close-button`
				}, {
					Icon = reactModule.createElement(icon, {
						name = iconName.X,
						size = iconSize.Large,
						style = var1.Color.Content.Emphasis
					})
				})
			})
		})
	end
	local var6
	local _ = nil
	
	if var3 and var4 then
		local setHeaderHeight = var4.setHeaderHeight
		local setCanvasHeight = var4.setCanvasHeight
		
		if var5 then
			var5 = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y",
				LayoutOrder = 1,
				onAbsoluteSizeChanged = function(value)
					-- upvalues: setHeaderHeight (ref)
					setHeaderHeight(value.AbsoluteSize.Y)
				end
			}, { Header = var5 })
		end
		var6 = reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = `{testId}--content`
		}, {
			ScrollingFrame = reactModule.createElement("ScrollingFrame", {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(),
				Size = reactModule.joinBindings({
					var4.overlayHeight,
					var4.headerHeight,
					var4.canvasHeight
				}):map(function(p2)
					-- upvalues: var1 (ref)
					local var7 = p2[2]
					
					return UDim2.new(1, 0, 0, math.min(p2[3], math.max(0, p2[1] - (var1.Padding.XLarge * 3 + var7 + (if var7 > 0 then var1.Gap.XLarge else 0)))))
				end),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
				ScrollBarThickness = var1.Size.Size_150,
				ScrollBarImageColor3 = var1.Color.Shift.Shift_400.Color3,
				ScrollBarImageTransparency = var1.Color.Shift.Shift_400.Transparency,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				[reactModule.Change.AbsoluteCanvasSize] = function(p2)
					-- upvalues: setCanvasHeight (ref)
					setCanvasHeight(p2.AbsoluteCanvasSize.Y)
				end
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Children = reactModule.createElement(reactModule.Fragment, nil, p1.children)
			})
		})
	else
		var6 = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, p1.children)
	end
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		ref = var2,
		size = dialogSize.Medium,
		hasBackdrop = p1.hasBackdrop,
		onClose = if p1.onCloseActivated then nil else p1.onClose,
		testId = testId
	}, { Title = var5, Content = var6, Actions = p1.actions })
end