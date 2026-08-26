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

function SectionHeader(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), roactFitComponents (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local style = var1.style
	local font = style.Font
	
	return reactModule.createElement(roactFitComponents.FitFrameVertical, {
		BackgroundTransparency = 1,
		LayoutOrder = var1.LayoutOrder,
		width = UDim.new(1, 0),
		margin = {
			left = 12,
			right = 0,
			top = var1.marginTop,
			bottom = var1.marginBottom
		}
	}, {
		SectionHeader = reactModule.createElement(roactFitComponents.FitTextLabel, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			width = roactFitComponents.FitTextLabel.Width.FitToText,
			Text = var1.Text,
			TextColor3 = style.Theme.TextDefault.Color,
			TextSize = font.CaptionHeader.RelativeSize * font.BaseSize,
			Font = font.CaptionHeader.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			AnchorPoint = Vector2.new(0, 1)
		})
	})
end

return memo(SectionHeader)