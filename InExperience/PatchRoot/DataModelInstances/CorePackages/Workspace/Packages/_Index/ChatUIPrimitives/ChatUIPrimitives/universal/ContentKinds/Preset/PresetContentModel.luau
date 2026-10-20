local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.PresetTypes)
local PresetContentModelModule = {
	detailFromPreset = function(PresetId, DisplayText, PresetVersion)
		return {
			fallbackText = DisplayText,
			presetId = PresetId,
			presetVersion = PresetVersion,
			displayText = DisplayText
		}
	end
}

function PresetContentModelModule.fromPreset(PresetId, DisplayText, PresetVersion)
	-- upvalues: PresetContentModelModule (copy)
	return {
		preset = PresetContentModelModule.detailFromPreset(PresetId, DisplayText, PresetVersion)
	}
end

function PresetContentModelModule.draftFromPreset(PresetId, DisplayText)
	return {
		preset = { presetId = PresetId, displayText = DisplayText }
	}
end

function PresetContentModelModule.getDetail(p1)
	return p1.preset
end

function PresetContentModelModule.getDraft(p1)
	return p1.preset
end

function PresetContentModelModule.fromDraft(p1)
	-- upvalues: PresetContentModelModule (copy)
	local Draft = PresetContentModelModule.getDraft(p1)
	
	return if Draft == nil then nil else PresetContentModelModule.fromPreset(Draft.presetId, Draft.displayText, nil)
end

return PresetContentModelModule