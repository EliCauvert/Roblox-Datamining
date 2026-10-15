local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.PresetTypes)
local t = {
	detailFromPreset = function(value, p1, p2)
		return {
			fallbackText = p1,
			presetId = value,
			presetVersion = p2,
			displayText = p1
		}
	end
}

function t.fromPreset(value, p1, p2)
	-- upvalues: t (ref)
	return { preset = t.detailFromPreset(value, p1, p2) }
end

function t.draftFromPreset(value, p1)
	return { preset = { presetId = value, displayText = p1 } }
end

function t.getDetail(p1)
	return p1.preset
end

function t.getDraft(p1)
	return p1.preset
end

function t.fromDraft(p1)
	-- upvalues: t (ref)
	local draft = t.getDraft(p1)
	
	return if draft == nil then nil else t.fromPreset(draft.presetId, draft.displayText, nil)
end

return t