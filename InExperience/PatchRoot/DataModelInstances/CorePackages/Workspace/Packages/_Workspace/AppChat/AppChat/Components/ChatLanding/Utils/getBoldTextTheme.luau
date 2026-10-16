local CryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: CryoModule (copy)
	return {
		Settings = nil,
		Theme = CryoModule.Dictionary.join(p1.Theme, {
			TextDefault = {
				Color = p1.Theme.TextEmphasis.Color,
				Transparency = p1.Theme.TextEmphasis.Transparency
			}
		}),
		Font = CryoModule.Dictionary.join(p1.Font, {
			Body = {
				Font = p1.Font.Header1.Font,
				RelativeSize = p1.Font.Body.RelativeSize,
				RelativeMinSize = p1.Font.Body.RelativeMinSize
			},
			CaptionBody = {
				Font = p1.Font.Header1.Font,
				RelativeSize = p1.Font.CaptionBody.RelativeSize,
				RelativeMinSize = p1.Font.CaptionBody.RelativeMinSize
			}
		}),
		Tokens = p1.Tokens
	}
end