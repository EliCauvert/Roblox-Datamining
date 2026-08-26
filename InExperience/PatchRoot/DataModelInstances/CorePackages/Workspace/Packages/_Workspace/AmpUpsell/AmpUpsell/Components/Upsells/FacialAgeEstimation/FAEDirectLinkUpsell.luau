local parent = script:FindFirstAncestor("AmpUpsell").Parent
local reactModule = require(parent.React)
local appLinking = require(parent.RoactServiceTags).AppLinking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local authButtonClick = require(parent.AuthAnalytics).Events.authButtonClick

return function(p1)
	-- upvalues: useScreenSize (ref), useTokens (ref), useRoactService (ref), appLinking (ref), useLocalization (ref), reactModule (ref), authButtonClick (ref), partialPageModal (ref), buttonType (ref), images (ref), text (ref)
	local webLink = p1.webLink
	local onCancel = p1.onCancel
	local sessionId = p1.sessionId
	local entryPointEventCtx = p1.entryPointEventCtx
	local var1 = useScreenSize()
	local var2 = useTokens()
	local var3 = useRoactService(appLinking)
	local var4 = useLocalization({
		title = "Amp.FAEUpsell.Modal.ExternalLink.Title",
		bodyText = "Amp.FAEUpsell.Modal.ExternalLink.Text",
		startBtn = "Amp.FAEUpsell.Modal.ExternalLink.ButtonStart",
		cancelBtn = "Amp.FAEUpsell.Modal.ExternalLink.ButtonCancel"
	})
	local var5 = reactModule.useCallback(function()
		-- upvalues: authButtonClick (copy), entryPointEventCtx (ref), sessionId (ref), onCancel (ref)
		authButtonClick(entryPointEventCtx, "cancelFaeNonNative", sessionId)
		onCancel()
	end, { onCancel, sessionId, entryPointEventCtx })
	
	return reactModule.createElement(partialPageModal, {
		title = var4.title,
		screenSize = var1,
		onCloseClicked = var5,
		buttonStackProps = {
			forcedFillDirection = Enum.FillDirection.Vertical,
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = var5, text = var4.cancelBtn }
				},
				{
					buttonType = buttonType.PrimaryContextual,
					props = {
						icon = images["icons/navigation/externallink_medium"],
						onActivated = reactModule.useCallback(function()
							-- upvalues: authButtonClick (copy), entryPointEventCtx (ref), sessionId (ref), var3 (ref), webLink (ref)
							authButtonClick(entryPointEventCtx, "startFaeNonNative", sessionId)
							var3:openURL(webLink)
						end, { var3, webLink, sessionId, entryPointEventCtx }),
						text = var4.startBtn
					}
				}
			}
		}
	}, {
		ViewFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			OuterPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var2.Padding.XXLarge),
				PaddingBottom = UDim.new(0, var2.Padding.XXLarge)
			}),
			BodyText = reactModule.createElement(text, {
				tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
				LayoutOrder = 1,
				Text = var4.bodyText
			})
		})
	})
end