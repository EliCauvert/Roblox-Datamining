local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local CentralOverlayModule = require(Parent.CentralOverlay)
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local ExtractAndStyleRichTextLinksFunction = require(Parent.DiscoveryUtils).extractAndStyleRichTextLinks

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), AppLinking (copy), ReactModule (copy), ExtractAndStyleRichTextLinksFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), CloseCentralOverlayFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ExtractAndStyleRichTextLinksFunction (upval), p1 (copy)
		local ExtractAndStyleRichTextLinksResult, ExtractAndStyleRichTextLinksResult2 = ExtractAndStyleRichTextLinksFunction(p1.bodyText)
		
		return {
			link = if #ExtractAndStyleRichTextLinksResult > 0 then ExtractAndStyleRichTextLinksResult[1] else nil,
			styledText = ExtractAndStyleRichTextLinksResult2
		}
	end, { p1.bodyText })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), p1 (copy), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UseRoactServiceResult (copy), CloseCentralOverlayFunction (upval)
		if UseMemoResult.link then
			p1.onCloseModal()
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.LeaveRobloxAlert, {
				continueFunc = function()
					-- upvalues: UseRoactServiceResult (upval), UseMemoResult (upval), UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					UseRoactServiceResult:openURL(UseMemoResult.link)
					UseDispatchResult(CloseCentralOverlayFunction())
				end
			}))
			
			return
		end
	end, {
		p1.onCloseModal,
		UseMemoResult.link,
		UseDispatchResult,
		UseRoactServiceResult
	})
	
	return ReactModule.createElement("TextButton", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		RichText = true,
		Size = UDim2.new(1, 0, 0, 0),
		Text = UseMemoResult.styledText,
		TextSize = UseTokensResult.Typography.BodyLarge.FontSize,
		Font = if FoundationFontFaceMigration then nil else UseTokensResult.Typography.BodyLarge.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodyLarge.Font) else nil,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
		Active = UseMemoResult.link ~= nil,
		Selectable = UseMemoResult.link ~= nil,
		[ReactModule.Event.Activated] = if UseMemoResult.link then UseResult else nil
	})
end