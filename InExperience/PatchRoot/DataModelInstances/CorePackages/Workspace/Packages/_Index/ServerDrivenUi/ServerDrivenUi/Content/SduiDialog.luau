local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local orientation = foundationModule.Enums.Orientation

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), buttonVariant (ref), dialog (ref), orientation (ref)
	local bodyText = p1.bodyText or p1.bodyComponent
	local var1 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.primaryButtonAction then
			p1.primaryButtonAction()
			
			if p1.primaryButtonSideEffectAction then
				p1.primaryButtonSideEffectAction()
			end
		end
	end, { p1.primaryButtonAction, p1.primaryButtonSideEffectAction })
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.secondaryButtonAction then
			p1.secondaryButtonAction()
			
			if p1.secondaryButtonSideEffectAction then
				p1.secondaryButtonSideEffectAction()
			end
		end
	end, {
		p1.secondaryButtonAction,
		p1.secondaryButtonSideEffectAction
	})
	local var3 = nil
	
	if p1.primaryButtonAction or p1.primaryButtonText or p1.primaryButtonIcon then
		var3 = var3 or {}
		table.insert(var3, {
			testId = "--sdui-dialog-primary-button",
			variant = buttonVariant.Emphasis,
			text = p1.primaryButtonText,
			icon = p1.primaryButtonIcon,
			onActivated = var1,
			inputDelay = p1.primaryButtonInputDelay
		})
	end
	if p1.secondaryButtonAction or p1.secondaryButtonText or p1.secondaryButtonIcon then
		var3 = var3 or {}
		table.insert(var3, {
			testId = "--sdui-dialog-secondary-button",
			variant = buttonVariant.Standard,
			text = p1.secondaryButtonText,
			icon = p1.secondaryButtonIcon,
			onActivated = var2,
			inputDelay = p1.secondaryButtonInputDelay
		})
	end
	return reactModule.createElement(dialog.Root, {
		size = p1.size,
		onClose = p1.onClose,
		disablePortal = p1.disablePortal ~= nil or p1.disablePortal,
		hasBackdrop = p1.hasBackdrop ~= nil or p1.hasBackdrop
	}, {
		DialogTitle = p1.titleText and reactModule.createElement(dialog.Title, { text = p1.titleText }) or nil,
		DialogMedia = p1.image and reactModule.createElement(dialog.HeroMedia, {
			media = p1.image,
			aspectRatio = p1.imageAspectRatio or 1.777777777778
		}) or nil,
		DialogContent = bodyText and (reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			BodyContent = if p1.bodyComponent then p1.bodyComponent elseif p1.bodyText then reactModule.createElement(dialog.Text, { Text = p1.bodyText }) else nil
		}) or nil),
		DialogActions = var3 and (reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = var3,
			label = p1.actionsLabel,
			orientation = p1.actionsOrientation or orientation.Horizontal
		}) or nil)
	})
end)