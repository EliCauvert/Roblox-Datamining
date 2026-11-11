local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local OnScreenKeyboardWindowModule = require(Modules.LuaApp.Components.OnScreenKeyboardWindow)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local GetPartialPageModalMiddleContentWidthFunction = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
ExtendResult.defaultProps = {
	makeBodyFragment = function()
		return nil
	end
}

function ExtendResult.init(p1)
	function p1.closeModal()
		-- upvalues: p1 (copy)
		p1.props.closeOverlay()
		
		if p1.props.closeCallback then
			p1.props.closeCallback()
		end
	end
	
	function p1.getAdjustedTitleToScreenString(Text: string, p2, p3)
		-- upvalues: p1 (copy)
		if Text == nil then
			return Text
		end
		local Floored = math.floor(0.85 * (p2 / (p3.Font.Body.RelativeSize * p3.Font.BaseSize * 0.6)))
		
		if string.len(Text) <= Floored then
			return Text
		end
		if Text:find(" ") == nil then
			return Text
		end
		p1.adjustedTitle = ""
		p1.remainingTitleToAnalyze = Text
		
		for i = 1, 2 do
			if Floored >= string.len(p1.remainingTitleToAnalyze) then
				p1.adjustedTitle ..= p1.remainingTitleToAnalyze
				break
			end
			local Segment = string.sub(p1.remainingTitleToAnalyze, 1, Floored)
			local v1 = Segment:reverse():find(" ")
			
			if v1 == nil then
				p1.adjustedTitle ..= Segment
				p1.remainingTitleToAnalyze = string.sub(p1.remainingTitleToAnalyze, Floored + 1)
			else
				local LengthDelta = string.len(Segment) - v1
				p1.remainingTitleToAnalyze = string.sub(p1.remainingTitleToAnalyze, LengthDelta + 2)
				p1.adjustedTitle ..= string.sub(Segment, 0, LengthDelta)
			end
			if i ~= 2 then
				p1.adjustedTitle ..= "\n"
			end
		end
		return p1.adjustedTitle
	end
end

function ExtendResult.render(p2)
	-- upvalues: GetPartialPageModalMiddleContentWidthFunction (copy), WithStyleFunction (copy), RoactModule (copy), OnScreenKeyboardWindowModule (copy), PartialPageModal (copy)
	local ScreenSize = p2.props.screenSize
	local PartialPageModalMiddleContentWidth = GetPartialPageModalMiddleContentWidthFunction(ScreenSize.X)
	local ButtonConfig = p2.props.buttonConfig
	local MakeBodyFragmentFunction = p2.props.makeBodyFragment
	local NoHideCloseButton = not p2.props.hideCloseButton
	local Title = p2.props.title
	
	return WithStyleFunction(function(p3)
		-- upvalues: p2 (copy), Title (copy), PartialPageModalMiddleContentWidth (copy), RoactModule (upval), OnScreenKeyboardWindowModule (upval), PartialPageModal (upval), ScreenSize (copy), ButtonConfig (copy), NoHideCloseButton (copy), MakeBodyFragmentFunction (copy)
		return RoactModule.createElement(OnScreenKeyboardWindowModule, {
			Contents = {
				Modal = RoactModule.createElement(PartialPageModal, {
					title = p2.getAdjustedTitleToScreenString(Title, PartialPageModalMiddleContentWidth, p3),
					screenSize = ScreenSize,
					buttonStackProps = ButtonConfig,
					onCloseClicked = NoHideCloseButton and p2.closeModal
				}, {
					Middle = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.fromScale(1, 0)
					}, {
						ContentPadding = RoactModule.createElement("UIPadding", {
							PaddingBottom = ButtonConfig and UDim.new(0, 24),
							PaddingTop = UDim.new(0, 24)
						}),
						ListLayout = RoactModule.createElement("UIListLayout", {
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 24),
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						BodyFragment = MakeBodyFragmentFunction(PartialPageModalMiddleContentWidth)
					})
				})
			}
		})
	end)
end

return (RoactServices.connect({ analytics = RoactAnalyticsModule })((RoactRoduxModule.connect(function(p2, _)
	return { screenSize = p2.ScreenSize }
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closeOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end
	}
end)(ExtendResult))))