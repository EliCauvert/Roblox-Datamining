local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local mediaNodeRegistryModule = require(momentsCommon.Media.mediaNodeRegistry)
local createVideoNodeModule = require(momentsCommon.Media.Nodes.createVideoNode)
local createMusicNodeModule = require(momentsCommon.Media.Nodes.createMusicNode)
local createScreenshotNodeModule = require(momentsCommon.Media.Nodes.createScreenshotNode)
local createTextOverlayNodeModule = require(momentsCommon.Media.Nodes.createTextOverlayNode)

return function() --[[ line: 26 | named "createDefaultMediaNodeRegistry" ]]
	-- upvalues: mediaNodeRegistryModule (ref), createVideoNodeModule (ref), createMusicNodeModule (ref), createScreenshotNodeModule (ref), createTextOverlayNodeModule (ref)
	local var6 = mediaNodeRegistryModule()
	var6.register(createVideoNodeModule)
	var6.register(createMusicNodeModule)
	var6.register(createScreenshotNodeModule)
	var6.register(createTextOverlayNodeModule)
	
	return var6
end