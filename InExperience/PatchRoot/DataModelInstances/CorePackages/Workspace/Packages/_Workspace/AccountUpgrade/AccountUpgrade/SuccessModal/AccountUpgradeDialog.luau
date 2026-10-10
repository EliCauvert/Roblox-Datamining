local parent = script:FindFirstAncestor("AccountUpgrade").Parent
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

return function(p1)
	-- upvalues: foundationModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref), dialog (ref), view (ref), text (ref), icon (ref), iconName (ref), iconSize (ref), dialogSize (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p1.isFocusable
	})
	local testId = p1.testId or "account-upgrade-dialog"
	local var3 = if p1.title then reactModule.createElement(dialog.Title, { text = p1.title }) else nil
	
	if p1.subtitle then
		var3 = reactModule.createElement(view, {
			tag = "col gap-xsmall size-full-0 auto-y",
			LayoutOrder = 1,
			testId = `{testId}--header`
		}, {
			Title = var3,
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
		var3 = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
			Title = var3,
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
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		ref = var2,
		size = dialogSize.Medium,
		hasBackdrop = p1.hasBackdrop,
		onClose = if p1.onCloseActivated then nil else p1.onClose,
		testId = testId
	}, {
		Title = var3,
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, p1.children),
		Actions = p1.actions
	})
end