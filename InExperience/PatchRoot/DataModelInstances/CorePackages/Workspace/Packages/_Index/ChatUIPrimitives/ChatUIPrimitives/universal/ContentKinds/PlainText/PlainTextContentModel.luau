local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.PlainTextTypes)
local t = {
	detailFromText = function(p1)
		return {
			wasRewritten = false,
			fallbackText = p1,
			displayText = { text = p1 }
		}
	end
}

function t.fromText(p1)
	-- upvalues: t (ref)
	return { plainText = t.detailFromText(p1) }
end

return t