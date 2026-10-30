local _ = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.Foundation)

local function _(p1)
	return {
		Color3 = p1.Color3,
		Transparency = 1 - (1 - (p1.Transparency or 0)) * 0.5
	}
end

return function(p1, p2, p3)
	local Config = if p1 then {
		backgroundStyle = p2.Color.System.Emphasis,
		textStyle = p2.Color.ActionEmphasis.Foreground
	} else {
		backgroundStyle = p2.Color.Shift.Shift_400,
		textStyle = p2.Color.Content.Emphasis
	}
	
	if p3 then
		local BackgroundStyle = Config.backgroundStyle
		local BackgroundStyle1 = {
			Color3 = BackgroundStyle.Color3,
			Transparency = 1 - (1 - (BackgroundStyle.Transparency or 0)) * 0.5
		}
		local TextStyle = Config.textStyle
		
		return {
			backgroundStyle = BackgroundStyle1,
			textStyle = {
				Color3 = TextStyle.Color3,
				Transparency = 1 - (1 - (TextStyle.Transparency or 0)) * 0.5
			}
		}
	else
		return Config
	end
end