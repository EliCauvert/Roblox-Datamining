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

function t.draftFromText(p1)
	return { plainText = { text = p1 } }
end

function t.getDetail(p1)
	return p1.plainText
end

function t.getDraft(p1)
	return p1.plainText
end

function t.fromDraft(p1)
	-- upvalues: t (ref)
	local draft = t.getDraft(p1)
	
	return if draft == nil then nil else t.fromText(draft.text)
end

return t