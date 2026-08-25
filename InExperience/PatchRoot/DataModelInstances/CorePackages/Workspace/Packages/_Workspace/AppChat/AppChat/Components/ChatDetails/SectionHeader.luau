local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactFitComponents = require(parent.LuaSocialLibrariesDeps).RoactFitComponents
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local t = {
	Text = "Default Title",
	LayoutOrder = 0,
	marginTop = 8,
	marginBottom = 14,
	style = require(appChat.SocialLibraries).Components.TestStyle
}

function SectionHeader(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), roactFitComponents (ref)
	local var4 = cryoModule.Dictionary.join(t, p0)
	local style = var4.style
	local font = style.Font
	
	return reactModule.createElement(roactFitComponents.FitFrameVertical, {
		BackgroundTransparency = 1,
		LayoutOrder = var4.LayoutOrder,
		width = UDim.new(1, 0),
		margin = {
			left = 12,
			right = 0,
			top = var4.marginTop,
			bottom = var4.marginBottom
		}
	}, {
		SectionHeader = reactModule.createElement(roactFitComponents.FitTextLabel, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			width = roactFitComponents.FitTextLabel.Width.FitToText,
			Text = var4.Text,
			TextColor3 = style.Theme.TextDefault.Color,
			TextSize = font.CaptionHeader.RelativeSize * font.BaseSize,
			Font = font.CaptionHeader.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			AnchorPoint = Vector2.new(0, 1)
		})
	})
end

return memo(SectionHeader)