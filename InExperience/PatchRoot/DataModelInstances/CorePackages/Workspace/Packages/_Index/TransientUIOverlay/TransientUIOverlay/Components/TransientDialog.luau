local TransientUIOverlay = script:FindFirstAncestor("TransientUIOverlay")
local Parent = TransientUIOverlay.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local FoundationProvider = FoundationModule.FoundationProvider
local Orientation = FoundationModule.Enums.Orientation
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local _ = require(TransientUIOverlay.Types)
local GetTransientUIOverlayStoreModule = require(TransientUIOverlay.Stores.GetTransientUIOverlayStore)

return function(p1)
	-- upvalues: UsePreferencesFunction (copy), ButtonVariant (copy), GetTransientUIOverlayStoreModule (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), Orientation (copy), FoundationProvider (copy)
	local UsePreferencesResult = UsePreferencesFunction()
	local List = {}
	local PrimaryActionText = p1.primaryActionText
	local OnPrimaryActivatedFunction = p1.onPrimaryActivated
	
	if PrimaryActionText ~= nil and OnPrimaryActivatedFunction ~= nil then
		table.insert(List, {
			text = PrimaryActionText,
			variant = ButtonVariant.Emphasis,
			onActivated = function()
				-- upvalues: GetTransientUIOverlayStoreModule (upval), OnPrimaryActivatedFunction (copy)
				GetTransientUIOverlayStoreModule(false).clearDialog()
				OnPrimaryActivatedFunction()
			end
		})
	end
	table.insert(List, {
		text = p1.secondaryActionText,
		variant = ButtonVariant.Standard,
		onActivated = function()
			-- upvalues: GetTransientUIOverlayStoreModule (upval), p1 (copy)
			GetTransientUIOverlayStoreModule(false).clearDialog()
			p1.onSecondaryActivated()
		end
	})
	local Element = ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "transient-ui-dialog",
		onClose = if p1.onClose == nil then nil else function()
			-- upvalues: GetTransientUIOverlayStoreModule (upval), p1 (copy)
			GetTransientUIOverlayStoreModule(false).clearDialog()
			p1.onClose()
		end,
		size = DialogSize.Small
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = p1.title }),
		Content = if p1.body == nil then nil else ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Body = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = p1.body })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = Orientation.Horizontal,
			actions = List
		})
	})
	
	return if p1.colorMode == nil then Element else ReactModule.createElement("Folder", nil, {
		Provider = ReactModule.createElement(FoundationProvider, {
			colorMode = p1.colorMode,
			device = p1.device,
			preferences = {
				preferredTextSize = UsePreferencesResult.preferredTextSize,
				preferredTransparency = UsePreferencesResult.preferredTransparency,
				reducedMotion = UsePreferencesResult.reducedMotion
			}
		}, { Dialog = Element })
	})
end