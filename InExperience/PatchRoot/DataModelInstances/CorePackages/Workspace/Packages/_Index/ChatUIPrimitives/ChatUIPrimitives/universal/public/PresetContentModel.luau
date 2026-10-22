local PresetContentModelModule = require(script.Parent.Parent.ContentKinds.Preset.PresetContentModel)

return {
	fromPreset = function(p1, p2, p3)
		-- upvalues: PresetContentModelModule (copy)
		return PresetContentModelModule.fromPreset(p1, p2, p3)
	end
}