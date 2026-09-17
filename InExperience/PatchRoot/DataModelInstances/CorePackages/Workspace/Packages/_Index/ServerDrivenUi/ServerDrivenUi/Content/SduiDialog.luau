local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local orientation = foundationModule.Enums.Orientation
local sduiDialogHeroMediaProps2 = game:DefineFastFlag("SduiDialogHeroMediaProps2", false)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), buttonVariant (ref), dialog (ref), sduiDialogHeroMediaProps2 (ref), orientation (ref)
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
	local createElement_1
	local createElement = reactModule.createElement
	local root = dialog.Root
	local t = {
		size = p1.size,
		onClose = p1.onClose,
		disablePortal = p1.disablePortal ~= nil or p1.disablePortal,
		hasBackdrop = p1.hasBackdrop ~= nil or p1.hasBackdrop
	}
	local t_1 = {
		DialogTitle = p1.titleText and reactModule.createElement(dialog.Title, { text = p1.titleText }) or nil
	}
	
	if p1.image then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(dialog.HeroMedia, {
			media = p1.image,
			aspectRatio = if sduiDialogHeroMediaProps2 and p1.imageHeight ~= nil then p1.imageAspectRatio else p1.imageAspectRatio or 1.777777777778,
			mediaStyle = if sduiDialogHeroMediaProps2 then p1.imageStyle else nil,
			height = if sduiDialogHeroMediaProps2 then p1.imageHeight else nil,
			scaleType = if sduiDialogHeroMediaProps2 then p1.imageScaleType else nil
		}) or nil
	end
	t_1.DialogMedia = createElement_1
	t_1.DialogContent = bodyText and (reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
		BodyContent = if p1.bodyComponent then p1.bodyComponent elseif p1.bodyText then reactModule.createElement(dialog.Text, { Text = p1.bodyText }) else nil
	}) or nil)
	t_1.DialogActions = var3 and (reactModule.createElement(dialog.Actions, {
		LayoutOrder = 3,
		actions = var3,
		label = p1.actionsLabel,
		orientation = p1.actionsOrientation or orientation.Horizontal
	}) or nil)
	
	return createElement(root, t, t_1)
end)