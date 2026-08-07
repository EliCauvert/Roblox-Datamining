local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p0) --[[ line: 6 ]]
	-- upvalues: cryoModule (ref)
	return {
		Settings = nil,
		Theme = cryoModule.Dictionary.join(p0.Theme, {
			TextDefault = {
				Color = p0.Theme.TextEmphasis.Color,
				Transparency = p0.Theme.TextEmphasis.Transparency
			}
		}),
		Font = cryoModule.Dictionary.join(p0.Font, {
			Body = {
				Font = p0.Font.Header1.Font,
				RelativeSize = p0.Font.Body.RelativeSize,
				RelativeMinSize = p0.Font.Body.RelativeMinSize
			},
			CaptionBody = {
				Font = p0.Font.Header1.Font,
				RelativeSize = p0.Font.CaptionBody.RelativeSize,
				RelativeMinSize = p0.Font.CaptionBody.RelativeMinSize
			}
		}),
		Tokens = p0.Tokens
	}
end