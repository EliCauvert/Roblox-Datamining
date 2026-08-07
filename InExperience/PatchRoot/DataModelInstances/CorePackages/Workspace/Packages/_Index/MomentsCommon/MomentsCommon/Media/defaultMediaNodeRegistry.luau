local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local mediaNodeRegistryModule = require(momentsCommon.Media.mediaNodeRegistry)
local createVideoNodeModule = require(momentsCommon.Media.Nodes.createVideoNode)
local createMusicNodeModule = require(momentsCommon.Media.Nodes.createMusicNode)
local createScreenshotNodeModule = require(momentsCommon.Media.Nodes.createScreenshotNode)
local createTextOverlayNodeModule = require(momentsCommon.Media.Nodes.createTextOverlayNode)
local createStickerOverlayNodeModule = require(momentsCommon.Media.Nodes.createStickerOverlayNode)
local getFFlagMomentsStickerButtonModule = require(momentsCommon.Flags.GetFFlagMomentsStickerButton)

return function() --[[ line: 28 | named "createDefaultMediaNodeRegistry" ]]
	-- upvalues: mediaNodeRegistryModule (ref), createVideoNodeModule (ref), createMusicNodeModule (ref), createScreenshotNodeModule (ref), createTextOverlayNodeModule (ref), getFFlagMomentsStickerButtonModule (ref), createStickerOverlayNodeModule (ref)
	local var8 = mediaNodeRegistryModule()
	var8.register(createVideoNodeModule)
	var8.register(createMusicNodeModule)
	var8.register(createScreenshotNodeModule)
	var8.register(createTextOverlayNodeModule)
	
	if getFFlagMomentsStickerButtonModule() then
		var8.register(createStickerOverlayNodeModule)
	end
	return var8
end