local parent = script:FindFirstAncestor("GamePlayButton").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appLinking = require(parent.RoactServiceTags).AppLinking
local centralOverlayModule = require(parent.CentralOverlay)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local extractAndStyleRichTextLinks = require(parent.DiscoveryUtils).extractAndStyleRichTextLinks

return function(p0)
	-- upvalues: useTokens (ref), useDispatch (ref), useRoactService (ref), appLinking (ref), reactModule (ref), extractAndStyleRichTextLinks (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref)
	local var2 = useTokens()
	local var3 = useDispatch()
	local var4 = useRoactService(appLinking)
	local var5 = reactModule.useMemo(function()
		-- upvalues: extractAndStyleRichTextLinks (copy), p0 (ref)
		local var6, var7 = extractAndStyleRichTextLinks(p0.bodyText)
		
		return {
			link = if #var6 > 0 then var6[1] else nil,
			styledText = var7
		}
	end, { p0.bodyText })
	
	return reactModule.createElement("TextButton", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		RichText = true,
		Size = UDim2.new(1, 0, 0, 0),
		Text = var5.styledText,
		TextSize = var2.Typography.BodyLarge.FontSize,
		Font = var2.Typography.BodyLarge.Font,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextColor3 = var2.Color.Content.Emphasis.Color3,
		Active = var5.link ~= nil,
		Selectable = var5.link ~= nil,
		[reactModule.Event.Activated] = if var5.link then reactModule.useCallback(function()
			-- upvalues: var5 (ref), p0 (ref), var3 (ref), setCentralOverlay (copy), centralOverlayType (copy), var4 (ref), closeCentralOverlay (copy)
			if var5.link then
				p0.onCloseModal()
				var3(setCentralOverlay(centralOverlayType.LeaveRobloxAlert, {
					continueFunc = function()
						-- upvalues: var4 (copy), var5 (copy), var3 (copy), closeCentralOverlay (copy)
						var4:openURL(var5.link)
						var3(closeCentralOverlay())
					end
				}))
				
				return
			end
		end, { p0.onCloseModal, var5.link, var3, var4 }) else nil
	})
end