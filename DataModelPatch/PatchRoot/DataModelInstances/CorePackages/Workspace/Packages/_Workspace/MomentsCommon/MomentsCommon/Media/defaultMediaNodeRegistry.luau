local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local MediaNodeRegistryModule = require(MomentsCommon.Media.mediaNodeRegistry)
local CreateVideoNodeModule = require(MomentsCommon.Media.Nodes.createVideoNode)
local CreateMusicNodeModule = require(MomentsCommon.Media.Nodes.createMusicNode)
local CreateScreenshotNodeModule = require(MomentsCommon.Media.Nodes.createScreenshotNode)
local CreateTextOverlayNodeModule = require(MomentsCommon.Media.Nodes.createTextOverlayNode)

return function()
	-- upvalues: MediaNodeRegistryModule (copy), CreateVideoNodeModule (copy), CreateMusicNodeModule (copy), CreateScreenshotNodeModule (copy), CreateTextOverlayNodeModule (copy)
	local MediaNodeRegistryModuleResult = MediaNodeRegistryModule()
	MediaNodeRegistryModuleResult.register(CreateVideoNodeModule)
	MediaNodeRegistryModuleResult.register(CreateMusicNodeModule)
	MediaNodeRegistryModuleResult.register(CreateScreenshotNodeModule)
	MediaNodeRegistryModuleResult.register(CreateTextOverlayNodeModule)
	
	return MediaNodeRegistryModuleResult
end