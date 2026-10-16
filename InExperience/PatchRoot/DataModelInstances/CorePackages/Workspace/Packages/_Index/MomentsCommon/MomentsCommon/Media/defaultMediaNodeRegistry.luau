local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local MediaNodeRegistryModule = require(MomentsCommon.Media.mediaNodeRegistry)
local CreateVideoNodeModule = require(MomentsCommon.Media.Nodes.createVideoNode)
local CreateMusicNodeModule = require(MomentsCommon.Media.Nodes.createMusicNode)
local CreateTtsNodeModule = require(MomentsCommon.Media.Nodes.createTtsNode)
local CreateScreenshotNodeModule = require(MomentsCommon.Media.Nodes.createScreenshotNode)
local CreateTextOverlayNodeModule = require(MomentsCommon.Media.Nodes.createTextOverlayNode)
local CreateStickerOverlayNodeModule = require(MomentsCommon.Media.Nodes.createStickerOverlayNode)
local GetFFlagMomentsStickerButtonModule = require(MomentsCommon.Flags.GetFFlagMomentsStickerButton)

return function() --[[ Line: 29 | Named "createDefaultMediaNodeRegistry" ]]
	-- upvalues: MediaNodeRegistryModule (copy), CreateVideoNodeModule (copy), CreateMusicNodeModule (copy), CreateTtsNodeModule (copy), CreateScreenshotNodeModule (copy), CreateTextOverlayNodeModule (copy), GetFFlagMomentsStickerButtonModule (copy), CreateStickerOverlayNodeModule (copy)
	local MediaNodeRegistryModuleResult = MediaNodeRegistryModule()
	MediaNodeRegistryModuleResult.register(CreateVideoNodeModule)
	MediaNodeRegistryModuleResult.register(CreateMusicNodeModule)
	MediaNodeRegistryModuleResult.register(CreateTtsNodeModule)
	MediaNodeRegistryModuleResult.register(CreateScreenshotNodeModule)
	MediaNodeRegistryModuleResult.register(CreateTextOverlayNodeModule)
	
	if GetFFlagMomentsStickerButtonModule() then
		MediaNodeRegistryModuleResult.register(CreateStickerOverlayNodeModule)
	end
	return MediaNodeRegistryModuleResult
end