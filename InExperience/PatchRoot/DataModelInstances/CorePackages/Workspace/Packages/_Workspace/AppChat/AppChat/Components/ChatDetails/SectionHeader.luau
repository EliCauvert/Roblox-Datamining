local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactFitComponents = require(Parent.LuaSocialLibrariesDeps).RoactFitComponents
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local config = {
	Text = "Default Title",
	LayoutOrder = 0,
	marginTop = 8,
	marginBottom = 14,
	style = require(AppChat.SocialLibraries).Components.TestStyle
}

function SectionHeader(p1) --[[ Line: 30 ]]
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), RoactFitComponents (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Style = JoinResult.style
	local StyleFont = Style.Font
	
	return ReactModule.createElement(RoactFitComponents.FitFrameVertical, {
		BackgroundTransparency = 1,
		LayoutOrder = JoinResult.LayoutOrder,
		width = UDim.new(1, 0),
		margin = {
			left = 12,
			right = 0,
			top = JoinResult.marginTop,
			bottom = JoinResult.marginBottom
		}
	}, {
		SectionHeader = ReactModule.createElement(RoactFitComponents.FitTextLabel, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			width = RoactFitComponents.FitTextLabel.Width.FitToText,
			Text = JoinResult.Text,
			TextColor3 = Style.Theme.TextDefault.Color,
			TextSize = StyleFont.CaptionHeader.RelativeSize * StyleFont.BaseSize,
			Font = StyleFont.CaptionHeader.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			AnchorPoint = Vector2.new(0, 1)
		})
	})
end

return MemoFunction(SectionHeader)