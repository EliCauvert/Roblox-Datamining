local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local mediaNodeRegistryModule = require(momentsCommon.Media.mediaNodeRegistry)
local createVideoNodeModule = require(momentsCommon.Media.Nodes.createVideoNode)
local createMusicNodeModule = require(momentsCommon.Media.Nodes.createMusicNode)
local createScreenshotNodeModule = require(momentsCommon.Media.Nodes.createScreenshotNode)
local createTextOverlayNodeModule = require(momentsCommon.Media.Nodes.createTextOverlayNode)
local createStickerOverlayNodeModule = require(momentsCommon.Media.Nodes.createStickerOverlayNode)
local getFFlagMomentsStickerButtonModule = require(momentsCommon.Flags.GetFFlagMomentsStickerButton)

return function()
	-- upvalues: mediaNodeRegistryModule (ref), createVideoNodeModule (ref), createMusicNodeModule (ref), createScreenshotNodeModule (ref), createTextOverlayNodeModule (ref), getFFlagMomentsStickerButtonModule (ref), createStickerOverlayNodeModule (ref)
	local var1 = mediaNodeRegistryModule()
	var1.register(createVideoNodeModule)
	var1.register(createMusicNodeModule)
	var1.register(createScreenshotNodeModule)
	var1.register(createTextOverlayNodeModule)
	
	if getFFlagMomentsStickerButtonModule() then
		var1.register(createStickerOverlayNodeModule)
	end
	return var1
end