local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local parent = gamePlayButton.Parent
local playButtonUpsellBodyModule = require(gamePlayButton.PlayButtonUpsellBody)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local useTokens = foundationModule.Hooks.useTokens
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appLinking = require(parent.RoactServiceTags).AppLinking
local centralOverlayModule = require(parent.CentralOverlay)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local extractAndStyleRichTextLinks = require(parent.DiscoveryUtils).extractAndStyleRichTextLinks
local fFlagEnablePlayButtonWizardVPCPrologueModule = require(gamePlayButton.Flags.FFlagEnablePlayButtonWizardVPCPrologue)

return function(p0)
	-- upvalues: useTokens (ref), useDispatch (ref), useRoactService (ref), appLinking (ref), reactModule (ref), extractAndStyleRichTextLinks (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref), dialog (ref), dialogSize (ref), fFlagEnablePlayButtonWizardVPCPrologueModule (ref), playButtonUpsellBodyModule (ref), buttonVariant (ref)
	local var6 = useTokens()
	local var7 = useDispatch()
	local var8 = useRoactService(appLinking)
	local var9 = reactModule.useMemo(function()
		-- upvalues: extractAndStyleRichTextLinks (copy), p0 (ref)
		local var10, var11 = extractAndStyleRichTextLinks(p0.bodyText)
		
		return {
			link = if #var10 > 0 then var10[1] else nil,
			styledText = var11
		}
	end, { p0.bodyText })
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = false,
		size = dialogSize.Medium,
		onClose = p0.onCloseModal
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = p0.titleText }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			BodyText = if fFlagEnablePlayButtonWizardVPCPrologueModule then reactModule.createElement(playButtonUpsellBodyModule, { bodyText = p0.bodyText, onCloseModal = p0.onCloseModal }) else reactModule.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				RichText = true,
				Size = UDim2.new(1, 0, 0, 0),
				Text = var9.styledText,
				TextSize = var6.Typography.BodyLarge.FontSize,
				Font = var6.Typography.BodyLarge.Font,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextColor3 = var6.Color.Content.Emphasis.Color3,
				Active = var9.link ~= nil,
				Selectable = var9.link ~= nil,
				[reactModule.Event.Activated] = if var9.link then reactModule.useCallback(function()
					-- upvalues: var9 (ref), p0 (ref), var7 (ref), setCentralOverlay (copy), centralOverlayType (copy), var8 (ref), closeCentralOverlay (copy)
					if var9.link then
						p0.onCloseModal()
						var7(setCentralOverlay(centralOverlayType.LeaveRobloxAlert, {
							continueFunc = function()
								-- upvalues: var8 (copy), var9 (copy), var7 (copy), closeCentralOverlay (copy)
								var8:openURL(var9.link)
								var7(closeCentralOverlay())
							end
						}))
						
						return
					end
				end, { p0.onCloseModal, var9.link, var7, var8 }) else nil
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = p0.cancelButtonText,
					variant = buttonVariant.Standard,
					onActivated = p0.onCancelButtonClick
				},
				{
					text = p0.actionButtonText,
					variant = buttonVariant.Emphasis,
					onActivated = p0.onActionButtonClick
				}
			}
		})
	})
end