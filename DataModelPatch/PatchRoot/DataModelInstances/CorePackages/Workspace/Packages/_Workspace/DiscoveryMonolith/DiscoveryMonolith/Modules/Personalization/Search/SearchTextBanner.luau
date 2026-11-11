local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local ReactModule = require(Parent.React)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local ExtractAndStyleRichTextLinksFunction = DiscoveryUtilsModule.extractAndStyleRichTextLinks
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local CentralOverlayModule = require(Parent.CentralOverlay)
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseSelectorFunction (copy), ReactModule (copy), DiscoveryUtilsModule (copy), UseRoactServiceFunction (copy), AppLinking (copy), ExtractAndStyleRichTextLinksFunction (copy), UseDispatchFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), CloseCentralOverlayFunction (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local BodyFont = UseStyleResultFont.Body.Font
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize
	local UseStateResult, UseStateResult2 = ReactModule.useState((UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)))
	
	local function v12(Frame)
		-- upvalues: UseStateResult2 (copy)
		if Frame then
			UseStateResult2(Frame.AbsoluteSize)
		end
	end
	
	local PageSideMargin = UseStateResult.X and DiscoveryUtilsModule.getPageSideMargin(UseStateResult.X) or 0
	local SidePadding = p1.sidePadding or PageSideMargin
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ExtractAndStyleRichTextLinksFunction (upval), p1 (copy)
		local ExtractAndStyleRichTextLinksResult, ExtractAndStyleRichTextLinksResult2 = ExtractAndStyleRichTextLinksFunction(p1.text)
		
		return {
			link = if #ExtractAndStyleRichTextLinksResult > 0 then ExtractAndStyleRichTextLinksResult[1] else nil,
			styledText = ExtractAndStyleRichTextLinksResult2
		}
	end, { p1.text })
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UseRoactServiceResult (copy), UseMemoResult (copy), CloseCentralOverlayFunction (upval)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.LeaveRobloxAlert, {
			continueFunc = function()
				-- upvalues: UseRoactServiceResult (upval), UseMemoResult (upval), UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseRoactServiceResult:openURL(UseMemoResult.link)
				UseDispatchResult(CloseCentralOverlayFunction())
			end
		}))
	end, { UseMemoResult.link, UseDispatchResult })
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 32),
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = UseStyleResult.Theme.BackgroundContrast.Transparency,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
		BorderSizePixel = 0,
		[ReactModule.Change.AbsoluteSize] = v12
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SidePadding),
			PaddingRight = UDim.new(0, SidePadding),
			PaddingTop = UDim.new(0, 16),
			PaddingBottom = UDim.new(0, 16)
		}),
		BannerText = ReactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			RichText = true,
			Size = UDim2.new(1, 0, 0, 32),
			Text = UseMemoResult.styledText,
			TextSize = ScaledBaseSize,
			Font = BodyFont,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
			Active = UseMemoResult.link ~= nil,
			Selectable = UseMemoResult.link ~= nil,
			[ReactModule.Event.Activated] = if UseMemoResult.link then UseResult else nil
		})
	})
end