return function()
	return {
		Format = function(_, p1, p2): string
			return if p2 and p2.productName then `localized:{p1}:{p2.productName}` else `localized:{p1}`
		end,
		GetLocale = function(): string
			return "en-us"
		end,
		changed = {
			connect = function()
				return { disconnect = function() end }
			end
		}
	}
end