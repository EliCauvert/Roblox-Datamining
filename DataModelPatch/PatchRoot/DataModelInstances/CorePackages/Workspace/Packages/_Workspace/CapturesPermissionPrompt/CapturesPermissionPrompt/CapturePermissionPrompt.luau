local Parent = script.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local UsePinInputStateWhileOpenModule = require(Parent.usePinInputStateWhileOpen)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UsePinInputStateWhileOpenModule (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		allow = "Feature.Captures.Action.Allow",
		dontAllow = "Feature.Captures.Action.DontAllow",
		galleryTitle = "Feature.Captures.Title.AllowAccessToCaptures",
		galleryBody = "Feature.Captures.Body.AllowAccessToCaptures"
	})
	UsePinInputStateWhileOpenModule(p1.promptId ~= nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onAccepted then
			p1.onAccepted()
		end
		p1.respond(true)
	end, { p1.respond, p1.onAccepted })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onRejected then
			p1.onRejected()
		end
		p1.respond(false)
	end, { p1.respond, p1.onRejected })
	
	return if p1.promptId == nil then nil else ReactModule.createElement(Dialog.Root, { size = DialogSize.Small }, {
		ModalFix = ReactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		DialogTitle = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col align-x-center align-y-center gap-small size-full-0 auto-y margin-top-small"
		}, {
			DialogTitleText = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small text-wrap",
				Text = UseLocalizationResult.galleryTitle
			})
		}),
		DialogContent = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-center align-y-center gap-small size-full-0 auto-y margin-none"
		}, {
			DialogContentText = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy padding-bottom-xsmall text-body-small text-wrap",
				Text = UseLocalizationResult.galleryBody
			}),
			Buttons = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-center gap-medium auto-xy"
			}, {
				AcceptButton = ReactModule.createElement(Button, {
					text = UseLocalizationResult.allow,
					variant = ButtonVariant.Emphasis,
					onActivated = UseResult,
					size = InputSize.Small,
					width = UDim.new(0.45, 0)
				}),
				RejectButton = ReactModule.createElement(Button, {
					text = UseLocalizationResult.dontAllow,
					variant = ButtonVariant.Standard,
					onActivated = UseResult1,
					size = InputSize.Small,
					width = UDim.new(0.45, 0)
				})
			})
		})
	})
end