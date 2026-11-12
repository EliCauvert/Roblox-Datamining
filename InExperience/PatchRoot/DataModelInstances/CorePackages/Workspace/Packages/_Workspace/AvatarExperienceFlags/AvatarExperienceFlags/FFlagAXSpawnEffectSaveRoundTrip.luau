local HasFromValueResult = Enum.AvatarAssetType:FromValue(97) ~= nil

return game:DefineFastFlag("AXSpawnEffectSaveRoundTrip", false) and HasFromValueResult