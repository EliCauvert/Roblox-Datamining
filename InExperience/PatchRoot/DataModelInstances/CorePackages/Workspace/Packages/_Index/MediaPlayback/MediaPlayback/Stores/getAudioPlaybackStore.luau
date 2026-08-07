local _ = require(script.types)

return require(script:FindFirstAncestor("MediaPlayback").Parent.Signals).createComputed(require(script.createAudioPlaybackStore))