local CloudClientOffer = script:FindFirstAncestor("CloudClientOffer")
local Parent = CloudClientOffer.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CloudClientOfferSheetTextModule = require(CloudClientOffer.Components.CloudClientOfferSheetText)
local _ = require(CloudClientOffer.createCloudClientOffer)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: CloudClientOfferSheetTextModule (copy), ReactModule (copy), Text (copy), Sheet (copy), View (copy), Button (copy), ButtonVariant (copy)
	local CloudClientOfferSheetTextModuleEntry = CloudClientOfferSheetTextModule[p1.offerKind]
	local UseRefResult = ReactModule.useRef(p1.onUnmount)
	UseRefResult.current = p1.onUnmount
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			local CurrentFunction: () -> () = UseRefResult.current
			
			if CurrentFunction ~= nil then
				CurrentFunction()
			end
		end
	end, {})
	local config = {
		Body = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = CloudClientOfferSheetTextModuleEntry.body
		})
	}
	
	for i, feature in CloudClientOfferSheetTextModuleEntry.features do
		config[`Feature{i}`] = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			LayoutOrder = 1 + i,
			Text = feature
		})
	end
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		testId = "cloud-client-offer-sheet",
		onClose = p1.onDismiss
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-medium text-align-x-left content-emphasis",
				Text = CloudClientOfferSheetTextModuleEntry.title
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			Layout = ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, config)
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Layout = ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, {
				Accept = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					testId = "cloud-client-offer-sheet-try-now",
					text = CloudClientOfferSheetTextModuleEntry.accept,
					variant = ButtonVariant.Emphasis,
					width = UDim.new(1, 0),
					onActivated = p1.onAccept
				}),
				Decline = ReactModule.createElement(Button, {
					LayoutOrder = 2,
					testId = "cloud-client-offer-sheet-join-without",
					text = CloudClientOfferSheetTextModuleEntry.decline,
					variant = ButtonVariant.Utility,
					width = UDim.new(1, 0),
					onActivated = p1.onDecline
				})
			})
		})
	})
end