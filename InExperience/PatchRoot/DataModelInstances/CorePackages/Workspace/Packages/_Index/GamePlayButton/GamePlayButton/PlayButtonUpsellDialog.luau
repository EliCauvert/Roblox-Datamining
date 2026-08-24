local parent = script:FindFirstAncestor("GamePlayButton").Parent
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

return function(p0)
	-- upvalues: useTokens (ref), useDispatch (ref), useRoactService (ref), appLinking (ref), reactModule (ref), extractAndStyleRichTextLinks (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local var3 = useTokens()
	local var4 = useDispatch()
	local var5 = useRoactService(appLinking)
	local var6 = reactModule.useMemo(function()
		-- upvalues: extractAndStyleRichTextLinks (copy), p0 (ref)
		local var7, var8 = extractAndStyleRichTextLinks(p0.bodyText)
		
		return {
			link = if #var7 > 0 then var7[1] else nil,
			styledText = var8
		}
	end, { p0.bodyText })
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = false,
		size = dialogSize.Medium,
		onClose = p0.onCloseModal
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = p0.titleText }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			BodyText = reactModule.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				RichText = true,
				Size = UDim2.new(1, 0, 0, 0),
				Text = var6.styledText,
				TextSize = var3.Typography.BodyLarge.FontSize,
				Font = var3.Typography.BodyLarge.Font,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextColor3 = var3.Color.Content.Emphasis.Color3,
				Active = var6.link ~= nil,
				Selectable = var6.link ~= nil,
				[reactModule.Event.Activated] = if var6.link then reactModule.useCallback(function()
					-- upvalues: var6 (ref), p0 (ref), var4 (ref), setCentralOverlay (copy), centralOverlayType (copy), var5 (ref), closeCentralOverlay (copy)
					if var6.link then
						p0.onCloseModal()
						var4(setCentralOverlay(centralOverlayType.LeaveRobloxAlert, {
							continueFunc = function()
								-- upvalues: var5 (copy), var6 (copy), var4 (copy), closeCentralOverlay (copy)
								var5:openURL(var6.link)
								var4(closeCentralOverlay())
							end
						}))
						
						return
					end
				end, { p0.onCloseModal, var6.link, var4, var5 }) else nil
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