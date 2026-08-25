local parent = script.Parent.Parent
local cryoModule = require(parent.Parent.Parent.Parent.Cryo)
local _ = require(script.Parent.Types)
local _ = require(parent.StyleTypes)

local function mapColorTokensToFoundation(p0, p1)
	-- upvalues: cryoModule (ref)
	p0.Semantic.Color = cryoModule.Dictionary.join(p0.Semantic.Color, p1.Semantic.Color)
	p0.Global.Color = cryoModule.Dictionary.join(p0.Global.Color, p1.Global.Color)
	p0.Component = cryoModule.Dictionary.join(p0.Component, p1.Component)
	
	return p0
end

local function getOnHoverColor(p2, p3)
	local hover = p3.Color.State.Hover
	
	return if hover.Transparency == 1 then { Color3 = p2.Color3, Transparency = p2.Transparency } elseif p2.Color3 == nil or p2.Transparency == 1 then { Color3 = hover.Color3, Transparency = hover.Transparency } else {
		Color3 = p2.Color3:Lerp(hover.Color3, 1 - hover.Transparency),
		Transparency = p2.Transparency
	}
end

local list = {
	"Color", "Config", "DarkMode", "Ease", "LightMode", "Inverse", "Size",
	"Padding", "Margin", "Gap", "Gutter", "Radius", "Stroke", "LineHeight",
	"FontSize", "FontWeight", "Time", "Typography"
}

return {
	mapColorTokensToFoundation = mapColorTokensToFoundation,
	mapThemeToFoundation = function(p4, p5)
		-- upvalues: getOnHoverColor (ref), cryoModule (ref)
		return cryoModule.Dictionary.join(p4, cryoModule.Dictionary.map({
			BackgroundDefault = p5.Color.Surface.Surface_0,
			BackgroundContrast = p5.Color.Surface.Surface_100,
			BackgroundMuted = p5.Color.Surface.Surface_200,
			BackgroundUIDefault = p5.Color.Surface.Surface_300,
			BackgroundUIContrast = p5.Color.OverMedia.OverMedia_0,
			BackgroundOnHover = p5.Color.State.Hover,
			BackgroundOnPress = p5.Color.State.Press,
			UIDefault = p5.Color.Shift.Shift_200,
			UIMuted = p5.Color.Shift.Shift_100,
			UIEmphasis = p5.Color.Shift.Shift_400,
			ContextualPrimaryDefault = p5.Color.ActionEmphasis.Background,
			ContextualPrimaryOnHover = getOnHoverColor(p5.Color.ActionEmphasis.Background, p5),
			ContextualPrimaryContent = p5.Color.ActionEmphasis.Foreground,
			SystemPrimaryDefault = p5.Color.ActionSubEmphasis.Background,
			SystemPrimaryOnHover = getOnHoverColor(p5.Color.ActionSubEmphasis.Background, p5),
			SystemPrimaryContent = p5.Color.ActionSubEmphasis.Foreground,
			IconDefault = p5.Color.Content.Default,
			IconEmphasis = p5.Color.Content.Emphasis,
			IconOnHover = p5.Color.Content.Emphasis,
			TextEmphasis = p5.Color.Content.Emphasis,
			TextDefault = p5.Color.Content.Default,
			TextMuted = p5.Color.Content.Muted,
			TextLink = p5.Color.Content.Link,
			Divider = p5.Color.Stroke.Emphasis,
			Overlay = p5.Color.Common.Scrim,
			DropShadow = p5.Color.Common.Shadow,
			NavigationBar = p5.Color.Common.NavigationBar,
			PlaceHolder = p5.Color.Common.Shimmer,
			OnlineStatus = p5.Color.System.Success,
			OfflineStatus = p5.Color.System.Neutral,
			Success = p5.Color.System.Success,
			Alert = p5.Color.System.Alert,
			Badge = p5.Color.System.Contrast,
			BadgeContent = p5.Inverse.Content.Emphasis
		}, function(p6)
			return { Color = p6.Color3, Transparency = p6.Transparency }
		end))
	end,
	addFoundationFlatKeys = function(p7, p8)
		-- upvalues: list (ref)
		for i, v in list do
			p7[v] = p8[v]
		end
		return p7
	end
}