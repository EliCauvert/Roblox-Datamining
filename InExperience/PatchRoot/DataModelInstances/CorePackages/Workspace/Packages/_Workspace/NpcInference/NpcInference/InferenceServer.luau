game:DefineFastString("NpcInferenceServer", "localhost")
game:DefineFastInt("NpcInferencePort", 8080)

return {
	server = game:GetFastString("NpcInferenceServer"),
	port = game:GetFastInt("NpcInferencePort")
}