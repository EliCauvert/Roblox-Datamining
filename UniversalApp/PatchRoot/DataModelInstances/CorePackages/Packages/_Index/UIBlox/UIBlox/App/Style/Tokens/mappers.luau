local parent = script.Parent.Parent
local cryoModule = require(parent.Parent.Parent.Parent.Cryo)
local _ = require(script.Parent.Types)
local _ = require(parent.StyleTypes)

local function mapColorTokensToFoundation(p1, p2)
	-- upvalues: cryoModule (ref)
	p1.Semantic.Color = cryoModule.Dictionary.join(p1.Semantic.Color, p2.Semantic.Color)
	p1.Global.Color = cryoModule.Dictionary.join(p1.Global.Color, p2.Global.Color)
	p1.Component = cryoModule.Dictionary.join(p1.Component, p2.Component)
	
	return p1
end

local function getOnHoverColor(p1, p2)
	local hover = p2.Color.State.Hover
	
	return if hover.Transparency == 1 then { Color3 = p1.Color3, Transparency = p1.Transparency } elseif p1.Color3 == nil or p1.Transparency == 1 then { Color3 = hover.Color3, Transparency = hover.Transparency } else {
		Color3 = p1.Color3:Lerp(hover.Color3, 1 - hover.Transparency),
		Transparency = p1.Transparency
	}
end

local list = {
	"Color", "Config", "DarkMode", "Ease", "LightMode", "Inverse", "Size",
	"Padding", "Margin", "Gap", "Gutter", "Radius", "Stroke", "LineHeight",
	"FontSize", "FontWeight", "Time", "Typography"
}

return {
	mapColorTokensToFoundation = mapColorTokensToFoundation,
	mapThemeToFoundation = function(p1, p2)
		-- upvalues: getOnHoverColor (ref), cryoModule (ref)
		return cryoModule.Dictionary.join(p1, cryoModule.Dictionary.map({
			BackgroundDefault = p2.Color.Surface.Surface_0,
			BackgroundContrast = p2.Color.Surface.Surface_100,
			BackgroundMuted = p2.Color.Surface.Surface_200,
			BackgroundUIDefault = p2.Color.Surface.Surface_300,
			BackgroundUIContrast = p2.Color.OverMedia.OverMedia_0,
			BackgroundOnHover = p2.Color.State.Hover,
			BackgroundOnPress = p2.Color.State.Press,
			UIDefault = p2.Color.Shift.Shift_200,
			UIMuted = p2.Color.Shift.Shift_100,
			UIEmphasis = p2.Color.Shift.Shift_400,
			ContextualPrimaryDefault = p2.Color.ActionEmphasis.Background,
			ContextualPrimaryOnHover = getOnHoverColor(p2.Color.ActionEmphasis.Background, p2),
			ContextualPrimaryContent = p2.Color.ActionEmphasis.Foreground,
			SystemPrimaryDefault = p2.Color.ActionSubEmphasis.Background,
			SystemPrimaryOnHover = getOnHoverColor(p2.Color.ActionSubEmphasis.Background, p2),
			SystemPrimaryContent = p2.Color.ActionSubEmphasis.Foreground,
			IconDefault = p2.Color.Content.Default,
			IconEmphasis = p2.Color.Content.Emphasis,
			IconOnHover = p2.Color.Content.Emphasis,
			TextEmphasis = p2.Color.Content.Emphasis,
			TextDefault = p2.Color.Content.Default,
			TextMuted = p2.Color.Content.Muted,
			TextLink = p2.Color.Content.Link,
			Divider = p2.Color.Stroke.Emphasis,
			Overlay = p2.Color.Common.Scrim,
			DropShadow = p2.Color.Common.Shadow,
			NavigationBar = p2.Color.Common.NavigationBar,
			PlaceHolder = p2.Color.Common.Shimmer,
			OnlineStatus = p2.Color.System.Success,
			OfflineStatus = p2.Color.System.Neutral,
			Success = p2.Color.System.Success,
			Alert = p2.Color.System.Alert,
			Badge = p2.Color.System.Contrast,
			BadgeContent = p2.Inverse.Content.Emphasis
		}, function(p3)
			return { Color = p3.Color3, Transparency = p3.Transparency }
		end))
	end,
	addFoundationFlatKeys = function(p1, p2)
		-- upvalues: list (ref)
		for i, v in list do
			p1[v] = p2[v]
		end
		return p1
	end
}