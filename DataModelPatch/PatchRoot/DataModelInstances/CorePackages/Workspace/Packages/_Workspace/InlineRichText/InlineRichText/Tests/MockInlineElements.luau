local function _(New)
	return { new = New }
end

return {
	default = {
		new = function(...)
			return ...
		end
	},
	LinkElement = {
		new = function(Elements, p1)
			return { elements = Elements, onActivated = p1.onActivated }
		end
	}
}