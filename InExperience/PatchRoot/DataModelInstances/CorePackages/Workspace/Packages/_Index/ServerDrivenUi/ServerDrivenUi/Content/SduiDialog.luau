local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local orientation = foundationModule.Enums.Orientation

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), buttonVariant (ref), dialog (ref), orientation (ref)
	local bodyText = p0.bodyText or p0.bodyComponent
	local var3 = reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		if p0.primaryButtonAction then
			p0.primaryButtonAction()
			
			if p0.primaryButtonSideEffectAction then
				p0.primaryButtonSideEffectAction()
			end
		end
	end, { p0.primaryButtonAction, p0.primaryButtonSideEffectAction })
	local var4 = reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		if p0.secondaryButtonAction then
			p0.secondaryButtonAction()
			
			if p0.secondaryButtonSideEffectAction then
				p0.secondaryButtonSideEffectAction()
			end
		end
	end, {
		p0.secondaryButtonAction,
		p0.secondaryButtonSideEffectAction
	})
	local var5 = nil
	
	if p0.primaryButtonAction or p0.primaryButtonText or p0.primaryButtonIcon then
		var5 = var5 or {}
		table.insert(var5, {
			testId = "--sdui-dialog-primary-button",
			variant = buttonVariant.Emphasis,
			text = p0.primaryButtonText,
			icon = p0.primaryButtonIcon,
			onActivated = var3,
			inputDelay = p0.primaryButtonInputDelay
		})
	end
	if p0.secondaryButtonAction or p0.secondaryButtonText or p0.secondaryButtonIcon then
		var5 = var5 or {}
		table.insert(var5, {
			testId = "--sdui-dialog-secondary-button",
			variant = buttonVariant.Standard,
			text = p0.secondaryButtonText,
			icon = p0.secondaryButtonIcon,
			onActivated = var4,
			inputDelay = p0.secondaryButtonInputDelay
		})
	end
	return reactModule.createElement(dialog.Root, {
		size = p0.size,
		onClose = p0.onClose,
		disablePortal = p0.disablePortal ~= nil or p0.disablePortal,
		hasBackdrop = p0.hasBackdrop ~= nil or p0.hasBackdrop
	}, {
		DialogTitle = p0.titleText and reactModule.createElement(dialog.Title, { text = p0.titleText }) or nil,
		DialogMedia = p0.image and reactModule.createElement(dialog.HeroMedia, {
			media = p0.image,
			aspectRatio = p0.imageAspectRatio or 1.777777777778
		}) or nil,
		DialogContent = bodyText and (reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			BodyContent = if p0.bodyComponent then p0.bodyComponent elseif p0.bodyText then reactModule.createElement(dialog.Text, { Text = p0.bodyText }) else nil
		}) or nil),
		DialogActions = var5 and (reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = var5,
			label = p0.actionsLabel,
			orientation = p0.actionsOrientation or orientation.Horizontal
		}) or nil)
	})
end)